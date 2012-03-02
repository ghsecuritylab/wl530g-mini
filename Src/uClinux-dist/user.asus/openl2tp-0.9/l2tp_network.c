/*****************************************************************************
 * Copyright (C) 2004 Katalix Systems Ltd
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
 *
 *****************************************************************************/

#include "usl.h"
#include "l2tp_private.h"

#define L2TP_MAX_FRAME_LEN		4096
#define L2TP_MIN_FRAME_LEN		sizeof(struct l2tp_hdr)

/* The L2TP header is of variable length. The first byte contains
 * a number of flags that identify whether fields are present 
 * in the header itself. This makes it very difficult to define
 * a type for the header fields. We just define a type for the 
 * fixed part (the first 2 bytes).
 *
 *  0                   1                   2                   3
 *  0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
 * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 * |T|L|x|x|S|x|O|P|x|x|x|x|  Ver  |          Length (opt)         |
 * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 * |           Tunnel ID           |           Session ID          |
 * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 * |             Ns (opt)          |             Nr (opt)          |
 * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 * |      Offset Size (opt)        |    Offset pad... (opt)
 * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 *
 * We use C bitfields to represent bits in the header. We need to
 * take account of different bit-orders for little and big endian,
 * I use a macro to do that.
 */
#if (__BYTE_ORDER == __BIG_ENDIAN)
#define X(a,b)	b,a
#elif (__BYTE_ORDER == __LITTLE_ENDIAN)
#define X(a,b)	a,b
#else
#error	"Adjust your <endian.h> defines"
#endif	

struct u1_bits_s{
	uint8_t X(X(X(X(X(X(p_bit:1, o_bit:1), rsvd_2:1), s_bit:1), rsvd_1:2), l_bit:1), t_bit:1);
	uint8_t X(ver:4, rsvd_3:4);
} __attribute__ ((packed));
typedef struct u1_bits_s u1_bits_t;

union u1_u {
	u1_bits_t bits;
	unsigned short int flags_ver;
} __attribute__ ((packed));
typedef union u1_u u1_t;

struct u2_bits_s{
	unsigned short int  	length;
	unsigned short int  	tunnel_id;
	unsigned short int  	session_id;
	unsigned short int  	ns;
	unsigned short int  	nr;
} __attribute__ ((packed));
typedef struct u2_bits_s u2_bits_t;

union u2_u {
	u2_bits_t bits;
	unsigned char			data[0];
} __attribute__ ((packed));
typedef union u2_u u2_t;

struct l2tp_control_hdr_s {
	u1_t u1;
	u2_t u2;
};
typedef struct l2tp_control_hdr_s l2tp_control_hdr;

#if 0
struct l2tp_control_hdr {
	union {
		struct {
			uint8_t X(X(X(X(X(X(p_bit:1, o_bit:1), rsvd_2:1), s_bit:1), rsvd_1:2), l_bit:1), t_bit:1);
			uint8_t X(ver:4, rsvd_3:4);
		}bits;
		uint16_t flags_ver;
	}u1;
	union {
		struct {
			uint16_t  	length;
			uint16_t  	tunnel_id;
			uint16_t  	session_id;
			uint16_t  	ns;
			uint16_t  	nr;
		}bits; //eric**
		uint8_t			data[0];
	}u2;
};
#endif

#undef X

static int		l2tp_fd;

static inline void l2tp_net_parse_header(struct l2tp_packet *pkt, uint16_t *ver, int *is_data, int *has_seq, void **payload)
{
	l2tp_control_hdr* hdr = pkt->buf[0].data;

	uint16_t offset = 0;
	uint16_t dlen = 0;
	uint16_t *optval = (uint16_t *) &hdr->u2.data;

	*ver = (uint16_t) hdr->u1.bits.ver;
	if (hdr->u1.bits.t_bit) {
		*is_data = 0;
	} else {
		*is_data = 1;
	}
	if (hdr->u1.bits.l_bit) {
		dlen = ntohs(*optval);
		optval++;
	}
	pkt->tunnel_id = ntohs(*optval);
	optval++;
	pkt->session_id = ntohs(*optval);
	optval++;
	if (hdr->u1.bits.s_bit) {
		pkt->ns = ntohs(*optval);
		optval++;
		pkt->nr = ntohs(*optval);
		optval++;
		*has_seq = 1;
	} else {
		*has_seq = 0;
	}
	if (hdr->u1.bits.o_bit) {
		offset = ntohs(*optval);
		optval++;
	}
	*payload = ((void *) optval) + offset;
	if (hdr->u1.bits.l_bit) {
		pkt->avp_len = dlen - (((void *) optval) - ((void *) hdr));
	} else {
		pkt->avp_len = 0;
	}
	pkt->avp_offset = ((void *) *payload) - ((void *) hdr);

	L2TP_DEBUG(L2TP_XPRT, "%s: ver=%hu data=%d tid=%hu sid=%hu nr=%hu ns=%hu seq=%d offs=%hu len=%hu", __FUNCTION__, 
		    *ver, *is_data, pkt->tunnel_id, pkt->session_id,
		    pkt->nr, pkt->ns, *has_seq, offset, pkt->avp_len);
}

int l2tp_net_build_header(void **buf, int *buf_len, uint16_t ns, uint16_t nr, uint16_t tunnel_id, uint16_t session_id)
{
	l2tp_control_hdr *lh;

	lh = calloc(1, sizeof(*lh));
	if (lh == NULL) {
		return -ENOMEM;
	}

	lh->u1.bits.t_bit = 1;
	lh->u1.bits.l_bit = 1;
	lh->u1.bits.s_bit = 1;
	lh->u1.bits.o_bit = 0;
	lh->u1.bits.ver = 2;
	lh->u2.bits.nr = htons(nr);
	lh->u2.bits.ns = htons(ns);
	lh->u2.bits.tunnel_id = htons(tunnel_id);
	lh->u2.bits.session_id = htons(session_id);
	lh->u2.bits.length = htons(sizeof(*lh));

	*buf = lh;
	*buf_len = sizeof(*lh);

	return 0;
}

void l2tp_net_update_header(void *buf, uint16_t ns, uint16_t nr)
{
	l2tp_control_hdr *lh;

	lh = buf;
	lh->u2.bits.nr = htons(nr);
	lh->u2.bits.ns = htons(ns);
}

static void l2tp_net_recv_core(int fd, struct sockaddr_in const *from, struct msghdr *msg, int recv_len, struct in_pktinfo *ipi)
{
	int result = -EBADMSG;
	struct l2tp_peer *peer = NULL;
	struct l2tp_tunnel *tunnel = NULL;
	char *peer_host_name = NULL;
	struct l2tp_packet *pkt;
	int frag;
	uint16_t ver;
	int is_data;
	int has_seq;
	void *payload;
	uint16_t msg_type;

	if (recv_len < L2TP_MIN_FRAME_LEN) {
		l2tp_stats.short_frames++;
		goto out;
	}

	/* Allocate a pkt to hold info about this packet. 
	 * Once we've done this, there's no need to use the struct msghdr.
	 */
	pkt = l2tp_pkt_alloc(msg->msg_iovlen);
	if (pkt == NULL) {
		result = -ENOMEM;
		l2tp_stats.no_control_frame_resources++;
		goto out;
	}
	for (frag = 0; frag < msg->msg_iovlen; frag++) {
		pkt->buf[frag].data = msg->msg_iov[frag].iov_base;
		pkt->buf[frag].data_len = MIN(recv_len, msg->msg_iov[frag].iov_len);
	}
	pkt->total_len = recv_len;

	/* Parse the L2TP packet header */
	l2tp_net_parse_header(pkt, &ver, &is_data, &has_seq, &payload);
	if (ver != 2) {
		l2tp_stats.wrong_version_frames++;
		goto out;
	}

	/* If this is a data frame, return now. This should be handled by
	 * the kernel's L2TP code.
	 */
	if (is_data) {
		l2tp_stats.unexpected_data_frames++;
		goto out;
	}

#ifdef L2TP_TEST
	if (l2tp_test_is_fake_rx_drop(pkt->tunnel_id, pkt->session_id)) {
		L2TP_DEBUG(L2TP_DATA, "%s: fake rx drop: tid=%hu/%hu, len=%d", __FUNCTION__,
			   pkt->tunnel_id, pkt->session_id, recv_len);
		goto out;
	}
#endif /* L2TP_TEST */

	L2TP_DEBUG(L2TP_PROTOCOL, "%s: received len %d tunl %hu ses %hu, from fd %d", __FUNCTION__,
		   recv_len, pkt->tunnel_id, pkt->session_id, fd);
	if (pkt->avp_len > 0) {
		/* Don't count ZLBs as received frames */
		l2tp_stats.total_rcvd_control_frames++;
	}
	if ((pkt->avp_offset + pkt->avp_len) > recv_len) {
		l2tp_stats.bad_rcvd_frames++;
		goto out;
	}

	/* If tunnel_id non-zero, find tunnel context by id and if not found, discard the frame.
	 * If tunnel_id is zero, pre-parse the L2TP packet looking for a HOSTNAME attribute
	 * which is mandatory for all messages when tunnel_id is zero. Use the name there
	 * to locate the peer profile, then create the tunnel context.
	 */
	if (pkt->tunnel_id != 0) {
		/* Simple case - tunnel_id non-zero. If we can't find a tunnel context, bail */
		tunnel = l2tp_tunnel_find_by_id(pkt->tunnel_id);
		if (tunnel == NULL) {
			l2tp_stats.no_matching_tunnel_id_discards++;
			goto out;
		}
		peer = l2tp_tunnel_get_peer(tunnel);
	} else {
		/* Complicated case - tunnel_id zero. Since we support incoming L2TP tunnel
		 * setup requests, we must create internal contexts in order to handle the
		 * request. However, we should only do this for SCCRQ messages...
		 */
		struct l2tp_peer_profile *peer_profile;

		result = l2tp_avp_preparse(payload, pkt->avp_len, &peer_host_name, &msg_type);
		if (result < 0) {
			if (result != -ENOMEM) {
				if (from != NULL) {
					L2TP_DEBUG(L2TP_PROTOCOL, "%s: dropping non-SCCRQ from %x/%hu on fd %d", __FUNCTION__, 
						   ntohl(from->sin_addr.s_addr), ntohs(from->sin_port), fd);
				} else {
					L2TP_DEBUG(L2TP_PROTOCOL, "%s: dropping non-SCCRQ on fd %d", __FUNCTION__, fd);
				}
				l2tp_stats.no_matching_tunnel_id_discards++;
			}
			goto out;
		}

		/* Find a peer profile. Since this tunnel is being created by remote request, an explicit
		 * peer profile name cannot be specified by the remote peer. So we use the HOST_NAME AVP
		 * to select it. If a peer profile with that name does not exist, try to find a profile
		 * that matches the source IP address. Otherwise, we use the default profile.
		 */
		peer_profile = l2tp_peer_profile_find(peer_host_name);
		if (peer_profile == NULL) {
			peer_profile = l2tp_peer_profile_find_by_addr(from->sin_addr);
			if (peer_profile == NULL) {
				peer_profile = l2tp_peer_profile_find(L2TP_API_PEER_PROFILE_DEFAULT_PROFILE_NAME);
			}
		}
		L2TP_DEBUG(L2TP_PROTOCOL, "%s: using peer profile %s for %s (%x/%hu) on fd %d", __FUNCTION__, 
			   peer_profile->profile_name, peer_host_name, ntohl(from->sin_addr.s_addr), ntohs(from->sin_port), fd);

		/* Register a new peer context and record his addr */
		if (ipi != NULL) {
			peer = l2tp_peer_find(&ipi->ipi_addr, &from->sin_addr);
			if (peer == NULL) {
				peer = l2tp_peer_alloc(ipi->ipi_addr, from->sin_addr);
				if (peer == NULL) {
					result = -ENOMEM;
					l2tp_stats.no_control_frame_resources++;
					goto out;
				}
			}
			l2tp_peer_inc_use_count(peer);
		}

		if (l2tp_opt_trace_flags & L2TP_PROTOCOL) {
			l2tp_log(LOG_DEBUG, "PROTO: Creating new tunnel context with profile '%s' for %s (%x/%hu)",
				 peer_profile->default_tunnel_profile_name, peer_host_name, ntohl(from->sin_addr.s_addr), ntohs(from->sin_port));
		}

		tunnel = l2tp_tunnel_alloc(0, peer_profile->default_tunnel_profile_name, peer_profile->profile_name, 0, &result);
		if (tunnel == NULL) {
			if (result == -ENOMEM) {
				l2tp_stats.no_control_frame_resources++;
			}
			goto out_unlink_peer;
		}
		l2tp_tunnel_link(tunnel);
		result = l2tp_tunnel_xprt_create(peer, tunnel, from);
		if (result < 0) {
			if (result == -ENOMEM) {
				l2tp_stats.no_control_frame_resources++;
			}
			goto out_unlink_tunnel;
		}

		/* Give plugins visibility of tunnel created */
		if (l2tp_tunnel_created_hook != NULL) {
			result = (*l2tp_tunnel_created_hook)(l2tp_tunnel_peer_id(tunnel));
			if (result < 0) {
				goto out_unlink_tunnel;
			}
		}
	}

	BUG_TRAP(tunnel == NULL);

	if (!l2tp_tunnel_is_fd_connected(tunnel)) {
		if (from == NULL) {
			from = l2tp_tunnel_get_peer_addr(tunnel);
		}
		result = l2tp_net_connect_socket(l2tp_tunnel_get_fd(tunnel), from, peer, tunnel);
		if (result < 0) {
			l2tp_stats.socket_errors++;
			goto out_unlink_tunnel;
		}
	}

	l2tp_tunnel_inc_use_count(tunnel);
	result = l2tp_xprt_recv(l2tp_tunnel_get_xprt(tunnel), pkt);
	l2tp_tunnel_dec_use_count(tunnel);

out:
	/* l2tp_xprt_recv() consumes msg only if it returns 0 */
	if (result < 0) {
		if (pkt == NULL) {
			for (frag = 0; frag < msg->msg_iovlen; frag++) {
				if (msg->msg_iov[frag].iov_base != NULL) {
					free(msg->msg_iov[frag].iov_base);
				}
			}
		} else {
			l2tp_pkt_free(pkt);
		}
	}

	/* This might have been allocated by l2tp_avp_preparse() */
	if (peer_host_name != NULL) {
		free(peer_host_name);
	}

	return;

out_unlink_tunnel:
	l2tp_tunnel_dec_use_count(tunnel);
out_unlink_peer:
	l2tp_peer_dec_use_count(peer);

	l2tp_stats.tunnel_setup_failures++;
	
	goto out;
}

void l2tp_net_recv_unconn(int fd, void *arg)
{
	int recv_len;
	unsigned char *buf;
	struct sockaddr_in from;
        struct iovec iov;
	struct {
		struct cmsghdr cm;
		struct in_pktinfo ipi;
	} cmsg = {
		.cm = {
			.cmsg_len = sizeof(struct cmsghdr) + sizeof(struct in_pktinfo),
			.cmsg_level = SOL_IP,
			.cmsg_type = IP_PKTINFO,
		},
		.ipi = {
			.ipi_ifindex = 0,
			.ipi_spec_dst = { 0 },
		},
	};
	struct msghdr msg = {
		.msg_name = &from,
		.msg_namelen = sizeof(struct sockaddr_in),
		.msg_iov = &iov,
		.msg_iovlen = 1,
		.msg_control = &cmsg,
		.msg_controllen = sizeof(cmsg),
		.msg_flags = 0,
	};

	L2TP_DEBUG(L2TP_FUNC, "%s: enter, fd=%d arg=%p", __FUNCTION__, fd, arg);

	buf = malloc(L2TP_MAX_FRAME_LEN);
	if (buf == NULL) {
		l2tp_stats.no_control_frame_resources++;
		goto out;
	}
	iov.iov_base = buf;
	iov.iov_len = L2TP_MAX_FRAME_LEN;

	for (;;) {
		recv_len = recvmsg(fd, &msg, MSG_NOSIGNAL | MSG_DONTWAIT);
		if (recv_len < 0) {
			if (errno == EINTR) {
				continue;
			} else if (errno == ECONNREFUSED) {
				/* Can happen if peer closes his UDP socket. Ignore it - our tunnel context
				 * will notice it isn't getting any more frames anyway...
				 */
				free(buf);
				goto out;
			} else {
				if (errno != EAGAIN) {
					L2TP_DEBUG(L2TP_DATA, "%s: recvmsg() returned %d (%d)", __FUNCTION__, recv_len, errno);
				}
				free(buf);
				goto out;
			}
		} else if (recv_len == 0) {
			free(buf);
			goto out;
		}
		break;
	}
	L2TP_DEBUG(L2TP_DATA, "%s: %d bytes received on fd %d, to %x via %x",
		   __FUNCTION__, recv_len, fd, ntohl(cmsg.ipi.ipi_spec_dst.s_addr), ntohl(cmsg.ipi.ipi_addr.s_addr));

	l2tp_net_recv_core(fd, &from, &msg, recv_len, &cmsg.ipi);

out:
	return;
}

void l2tp_net_recv(int fd, void *arg)
{
	int recv_len;
	unsigned char *buf = NULL;
        struct iovec iov;
	struct msghdr msg = {
		.msg_name = NULL,
		.msg_namelen = 0,
		.msg_iov = &iov,
		.msg_iovlen = 1,
		.msg_control = NULL,
		.msg_controllen = 0,
		.msg_flags = 0,
	};

	L2TP_DEBUG(L2TP_FUNC, "%s: enter, fd=%d arg=%p", __FUNCTION__, fd, arg);

	buf = malloc(L2TP_MAX_FRAME_LEN);
	if (buf == NULL) {
		l2tp_stats.no_control_frame_resources++;
		goto out;
	}

	iov.iov_base = buf;
	iov.iov_len = L2TP_MAX_FRAME_LEN;

	for (;;) {
		recv_len = recvmsg(fd, &msg, MSG_NOSIGNAL | MSG_DONTWAIT);
		if (recv_len < 0) {
			if (errno == EINTR) {
				continue;
			} else if (errno == ECONNREFUSED) {
				/* Can happen if peer closes his UDP socket. Ignore it - our tunnel context
				 * will notice it isn't getting any more frames anyway...
				 */
				free(buf);
				goto out;
			} else if (errno == EMSGSIZE) {
				/* PMTU discovery MTU update */
				int mtu;
				int result;
				int optlen = sizeof(mtu);
				result = getsockopt(fd, SOL_IP, IP_MTU, &mtu, (socklen_t*)&optlen);
				if (result == 0) {
					l2tp_tunnel_update_mtu(NULL, fd, mtu);
				}
				free(buf);
				goto out;
			} else {
				if (errno != EAGAIN) {
					L2TP_DEBUG(L2TP_DATA, "%s: recvmsg() returned %d (%d)", __FUNCTION__, recv_len, errno);
				}
				free(buf);
				goto out;
			}
		} else if (recv_len == 0) {
			free(buf);
			goto out;
		}
		break;
	}
	l2tp_net_recv_core(fd, NULL, &msg, recv_len, NULL);

out:
	return;
}

#ifdef L2TP_TEST

/* Can be called by a test harness to inject a received test frame.
 */
void l2tp_net_recv_test(struct sockaddr_in *from, void *buf, int buf_len)
{
	struct msghdr *msg;
	struct iovec *iov;

	L2TP_DEBUG(L2TP_FUNC, "%s: enter, from=%s buf=%p len=%d", __FUNCTION__, 
		   from ? inet_ntoa(from->sin_addr) : "NULL", buf, buf_len);

	msg = malloc(sizeof(*msg));
	iov = malloc(sizeof(*iov));
	if ((msg == NULL) || (iov == NULL)) {
		l2tp_stats.no_control_frame_resources++;
		goto out;
	}

	iov->iov_base = buf;
	iov->iov_len = buf_len;
	msg->msg_name = NULL;
	msg->msg_namelen = 0;
	msg->msg_iov = iov;
	msg->msg_iovlen = 1;
	msg->msg_control = NULL;
	msg->msg_controllen = 0;
	msg->msg_flags = 0;

	l2tp_net_recv_core(-1, from, msg, buf_len, NULL);
out:
	if (iov != NULL) {
		free(iov);
	}
	if (msg != NULL) {
		free(msg);
	}
}

#endif /* L2TP_TEST */

int l2tp_net_prepare_msghdr(struct msghdr *msg, struct l2tp_packet *pkt)
{
	int buf;

	msg->msg_iov = calloc(pkt->num_bufs, sizeof(*msg->msg_iov));
	if (msg->msg_iov == NULL) {
		goto nomem_iov;
	}

	for (buf = 0; buf < pkt->num_bufs; buf++) {
		msg->msg_iov[buf].iov_base = pkt->buf[buf].data;
		msg->msg_iov[buf].iov_len = pkt->buf[buf].data_len;
	}

	msg->msg_iovlen = pkt->num_bufs;
	msg->msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;

	return 0;

nomem_iov:
	return -ENOMEM;
}

int l2tp_net_send(struct l2tp_tunnel *tunnel, uint16_t tunnel_id, uint16_t session_id, struct l2tp_packet *pkt, uint8_t msg_type)
{
	int result = 0;
	l2tp_control_hdr *l2tp_hdr;
	struct l2tp_xprt *xprt = l2tp_tunnel_get_xprt(tunnel);

	L2TP_DEBUG(L2TP_PROTOCOL, "%s: tid=%hu sid=%hu, fd=%d", __FUNCTION__, 
		   tunnel_id, session_id, l2tp_tunnel_get_fd(tunnel));

	l2tp_hdr = malloc(sizeof(*l2tp_hdr));
	if (l2tp_hdr == NULL) {
		goto nomem_lh;
	}

	/* Prepend the L2TP header.
	 */
	pkt->total_len += sizeof (l2tp_control_hdr);

	l2tp_hdr->u1.flags_ver = 0;
	l2tp_hdr->u2.bits.length = htons(pkt->total_len);
	l2tp_hdr->u1.bits.t_bit = -1;
	l2tp_hdr->u1.bits.l_bit = -1;
	l2tp_hdr->u1.bits.s_bit = -1;
	l2tp_hdr->u1.bits.ver = 2;
	l2tp_hdr->u2.bits.tunnel_id = htons(tunnel_id);
	l2tp_hdr->u2.bits.session_id = htons(session_id);
	l2tp_hdr->u2.bits.ns = 0;
	l2tp_hdr->u2.bits.nr = 0;

	pkt->buf[0].data = l2tp_hdr;
	pkt->buf[0].data_len = sizeof (l2tp_control_hdr);

	pkt->msg_type = msg_type;
	pkt->tunnel_id = tunnel_id;
	pkt->session_id = session_id;
	pkt->xprt = xprt;

	result = l2tp_xprt_send(xprt, pkt);
	if (result < 0) {
		l2tp_stats.no_control_frame_resources++;
	}

out:
	return result;

nomem_lh:
	l2tp_stats.no_control_frame_resources++;
	result = -ENOMEM;

	goto out;
}

int l2tp_net_get_socket_addresses(int fd, struct sockaddr_in *src, struct sockaddr_in *dest, struct l2tp_tunnel *tunnel)
{
	socklen_t sock_len;
	int result = 0;

	if (src != NULL) {
		sock_len = sizeof(struct sockaddr_in);
		if (getsockname(fd, (struct sockaddr*) src, &sock_len) < 0) {
			l2tp_log(LOG_ERR, "tunl %hu: getsockname fd=%d: %s", l2tp_tunnel_id(tunnel), fd, strerror(errno));
			result = -errno;
			goto out;
		}

		if (sock_len != sizeof(struct sockaddr_in)) {
			l2tp_log(LOG_ERR, "tunl %hu: bad socket address len=%d: fd=%d", l2tp_tunnel_id(tunnel), fd, sock_len);
			result = -EPROTO;
			goto out;
		}
	}

	if (dest != NULL) {
		sock_len = sizeof(struct sockaddr_in);
		if (getpeername(fd, (struct sockaddr*) dest, &sock_len) < 0) {
			l2tp_log(LOG_ERR, "tunl %hu: getpeername  fd=%d: %s", l2tp_tunnel_id(tunnel), fd, strerror(errno));
			result = -errno;
			goto out;
		}
		if (sock_len != sizeof(struct sockaddr_in)) {
			l2tp_log(LOG_ERR, "tunl %hu: bad socket address len=%d: fd=%d", __FUNCTION__, 
				 l2tp_tunnel_id(tunnel), fd, sock_len);
			result = -EPROTO;
			goto out;
		}
	}

out:
	return result;
}

int l2tp_net_connect_socket(int fd, struct sockaddr_in const *peer_addr, struct l2tp_peer *peer, struct l2tp_tunnel *tunnel)
{
	struct sockaddr_in saddr;
	struct sockaddr_in daddr;
	int result;

	result = connect(fd, (struct sockaddr*) peer_addr, sizeof(*peer_addr));
	if(result < 0) {
		l2tp_log(LOG_ERR, "tunl %hu: connect fd=%d: %s", l2tp_tunnel_id(tunnel), fd, strerror(errno));
		result = -errno;
		goto out;
	}

	result = l2tp_net_get_socket_addresses(fd, &saddr, &daddr, tunnel);
	if (result < 0) {
		goto out;
	}

	/* connect() again if peer responds on an ephemeral port */
	if (daddr.sin_port != htons((uint16_t) l2tp_opt_udp_port)) {
		L2TP_DEBUG(L2TP_DATA, "%s: connecting to peer ephemeral port %hu, fd=%d, tid=%hu", __FUNCTION__,
			   ntohs(daddr.sin_port), fd, l2tp_tunnel_id(tunnel));
		result = connect(fd, (struct sockaddr*) &daddr, sizeof(struct sockaddr_in));
		if(result < 0) {
			l2tp_log(LOG_ERR, "tunl %hu: connect fd=%d: %s", __FUNCTION__, 
				 l2tp_tunnel_id(tunnel), fd, strerror(errno));
			result = -errno;
			goto out;
		}
	}

	result = usl_fd_modify_fd(fd, l2tp_net_recv, tunnel);
	if (result < 0) {
		l2tp_log(LOG_ERR, "tunl %hu: unable to modify socket %d for connected state", 
			 l2tp_tunnel_id(tunnel), fd);
		goto out;
	}

	l2tp_tunnel_set_addresses(tunnel, &saddr, &daddr);

	L2TP_DEBUG(L2TP_PROTOCOL, "%s: peer %x/%hu has src %x/%hu on fd %d", __FUNCTION__,
		   ntohl(daddr.sin_addr.s_addr), ntohs(daddr.sin_port), 
		   ntohl(saddr.sin_addr.s_addr), ntohs(saddr.sin_port), fd);

	return fd;

out:
	if (fd >= 0) {
		close(fd);
	}

	return result;
}

int l2tp_net_create_socket(struct sockaddr_in *local_addr, int use_udp_checksums)
{
	struct sockaddr_in saddr;
	int result;
	int new_fd = -1;
 	int on = 1;

	new_fd = socket(PF_INET, SOCK_DGRAM, 0);
	if (new_fd < 0) {
		L2TP_DEBUG(L2TP_XPRT, "%s: socket: %s", __FUNCTION__, strerror(errno));
		result = new_fd;
		goto out;
	}
 	(void) setsockopt(new_fd, SOL_SOCKET, SO_REUSEADDR, (char *)&on, sizeof(on));

	/* Configure UDP checksums */
	if (!use_udp_checksums) {
		(void) setsockopt(new_fd, SOL_SOCKET, SO_NO_CHECK, (char *)&on, sizeof(on));
	}
	/* Enable IP_PKTINFO socket message to retrieve peer address info. See l2tp_net_recv_xxx(). */
 	(void) setsockopt(new_fd, SOL_IP, IP_PKTINFO, (char *)&on, sizeof(on));

	memset(&saddr, 0, sizeof(saddr));
	saddr.sin_family = AF_INET;
	saddr.sin_port = local_addr->sin_port;
	saddr.sin_addr.s_addr = local_addr->sin_addr.s_addr;

	result = bind(new_fd, (struct sockaddr *) &saddr, sizeof(saddr));
	if (result < 0) {
		l2tp_log(LOG_ERR, "%s: bind %x/%hu: %s", __FUNCTION__, 
			 ntohl(saddr.sin_addr.s_addr), ntohs(saddr.sin_port), strerror(errno));
		result = -errno;
		goto out;
	}

	L2TP_DEBUG(L2TP_FUNC, "%s: fd=%d for local %x/%hu", __FUNCTION__, new_fd,
		   ntohl(saddr.sin_addr.s_addr), ntohs(saddr.sin_port));

	return new_fd;

out:
	if (new_fd >= 0) {
		close(new_fd);
	}

	return result;
}

/* Utility function to derive source address to reach a peer.
 */
int l2tp_net_get_local_address_for_peer(struct sockaddr_in *peer_addr, struct in_addr *local_addr)
{
	int result = 0;
	int fd = -1;
	socklen_t sock_len;
	struct sockaddr_in saddr;

	fd = socket(PF_INET, SOCK_DGRAM, 0);
	if (fd < 0) {
		L2TP_DEBUG(L2TP_XPRT, "%s: socket: %s", __FUNCTION__, strerror(errno));
		result = fd;
		goto out;
	}

	memset(&saddr, 0, sizeof(saddr));
	saddr.sin_family = AF_INET;
	saddr.sin_port = 0;
	saddr.sin_addr.s_addr = INADDR_ANY;
	result = bind(fd, (struct sockaddr *) &saddr, sizeof(saddr));
	if (result < 0) {
		result = -errno;
		goto out;
	}

	result = connect(fd, (struct sockaddr*) peer_addr, sizeof(*peer_addr));
	if(result < 0) {
		result = -errno;
		goto out;
	}

	sock_len = sizeof(struct sockaddr_in);
	if (getsockname(fd, (struct sockaddr*) &saddr, &sock_len) < 0) {
		result = -errno;
		goto out;
	}
	local_addr->s_addr = saddr.sin_addr.s_addr;

out:
	if (fd >= 0) {
		close(fd);
	}
	return result;
}

int l2tp_net_modify_socket(int fd, int use_udp_checksums, int do_pmtu_discovery)
{
	int result = 0;
	int on;

	if (use_udp_checksums >= 0) {
		on = use_udp_checksums ? 0 : 1; /* must only be 0 or 1 */
		result = setsockopt(fd, SOL_SOCKET, SO_NO_CHECK, (char *)&on, sizeof(on));
		if (result < 0) {
			result = -errno;
			goto out;
		}
	}
	if (do_pmtu_discovery >= 0) {
		on = do_pmtu_discovery ? IP_PMTUDISC_DO : IP_PMTUDISC_DONT;
		result = setsockopt(fd, SOL_IP, IP_MTU_DISCOVER, &on, sizeof(on));
		if (result < 0) {
			result = -errno;
			goto out;
		}
	}
out:
	return result;
}

void l2tp_net_init(void)
{
	int fd;
	int result;
	struct sockaddr_in addr;
	int on = 1;
	struct servent *serv_entry;

	if (l2tp_opt_udp_port == 0) {
		if ((serv_entry = getservbyname("l2tp", "udp"))) {
			l2tp_opt_udp_port = ntohs(serv_entry->s_port);
		} else {
			l2tp_log(LOG_ERR, "no entry for l2tp in /etc/services and -u not used");
			exit(1);
		}
	}

	fd = socket(PF_INET, SOCK_DGRAM, 0);
	if (fd < 0) {
		l2tp_log(LOG_ERR, "%s: socket: %s", __FUNCTION__, strerror(errno));
		exit(1);
	}
	(void) setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, (char *)&on, sizeof(on));

	/* Configure UDP checksums */
	(void) setsockopt(fd, SOL_SOCKET, SO_NO_CHECK, (char *)&on, sizeof(on));

	/* Enable IP_PKTINFO socket message to retrieve peer address info. See l2tp_net_recv_xxx(). */
 	(void) setsockopt(fd, SOL_IP, IP_PKTINFO, (char *)&on, sizeof(on));

	memset(&addr, 0, sizeof(addr));
	addr.sin_port = htons(l2tp_opt_udp_port);
	addr.sin_family = AF_INET;
	addr.sin_addr.s_addr = htonl(INADDR_ANY);

	result = bind(fd, (struct sockaddr *) &addr, sizeof(addr));
	if (result < 0) {
		result = -errno;
		l2tp_log(LOG_ERR, "%s: bind: %s", __FUNCTION__, strerror(errno));
		close(fd);
		exit(1);
	}

	L2TP_DEBUG(L2TP_PROTOCOL, "L2TP socket %d listening on port %hu", fd, l2tp_opt_udp_port);

	result = usl_fd_add_fd(fd, l2tp_net_recv_unconn, NULL);
	if (result < 0) {
		l2tp_log(LOG_ERR, "network_init: unable to register socket %d", fd);
		close(fd);
		exit(1);
	}
	l2tp_fd = fd;
}

void l2tp_net_cleanup(void)
{
	if (l2tp_fd != 0) {
		close(l2tp_fd);
	}
}

