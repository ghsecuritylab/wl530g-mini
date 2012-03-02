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

#ifndef L2TP_PRIVATE_H
#define L2TP_PRIVATE_H

#define _GNU_SOURCE
#include <string.h>		/* for strndup() */

#include <stdarg.h>
#include <sys/ioctl.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <fcntl.h>
#include <assert.h>
#ifdef L2TP_DMALLOC
#include <dmalloc.h>
#endif

#include <asm/byteorder.h>

#include "usl_list.h"

#include "l2tp_avp.h"
#include "l2tp_rpc.h"

/* BEGIN CONFIGURABLE SETTINGS */

#define L2TP_CISCO_SCCRQ_BUG_WORKAROUND
#define L2TP_PPP_UNIX_PPPD_PATH		"usr/sbin/pppd"
#define L2TP_PLUGIN_DIR			"/usr/lib/openl2tp"

/* END CONFIGURABLE SETTINGS */

/* Where did IP_MTU go in glibc includes? */
#ifndef IP_MTU
#define IP_MTU 14
#endif

/* This hack is to work around a warning generated by gcc because this constant 
 * looks negative. Unfortunately, it is generated by the SUNRPC tools and
 * they don't support the xxxUL C syntax to force the constant to be unsigned.
 * So we redefine the constant with UL suffix to avoid the gcc warning.
 * Is there some C preprocessor magic that could avoid having to do this?
 */
#if L2TP_API_TUNNEL_FLAG_MTU != 2147483648
#error Constant L2TP_API_TUNNEL_FLAG_MTU changed. Update local definition here.
#endif
#undef L2TP_API_TUNNEL_FLAG_MTU
#define L2TP_API_TUNNEL_FLAG_MTU 2147483648UL

/* Debug masks */
#define L2TP_PROTOCOL			L2TP_DEBUG_PROTOCOL
#define L2TP_FSM			L2TP_DEBUG_FSM
#define L2TP_API			L2TP_DEBUG_API
#define L2TP_AVP			L2TP_DEBUG_AVP
#define L2TP_AVPHIDE			L2TP_DEBUG_AVP_HIDE
#define L2TP_AVPDATA			L2TP_DEBUG_AVP_DATA
#define L2TP_FUNC			L2TP_DEBUG_FUNC
#define L2TP_XPRT			L2TP_DEBUG_XPRT
#define L2TP_DATA			L2TP_DEBUG_DATA
#define L2TP_SYSTEM			L2TP_DEBUG_SYSTEM
#define L2TP_PPP			L2TP_DEBUG_PPP

#ifdef L2TP_DMALLOC
#define DMALLOC_MESSAGE(fmt, args...)	dmalloc_message(fmt, ##args)
#define DMALLOC_VMESSAGE(fmt, ap)	dmalloc_vmessage(fmt, ap)
#else
#define DMALLOC_MESSAGE(fmt, args...)	do { } while(0)
#define DMALLOC_VMESSAGE(fmt, args...)	do { } while(0)
#endif

#define dbg(fmt, args...) do { FILE *fp = fopen("/dev/console", "w"); if (fp) { fprintf(fp, fmt, ## args); fclose(fp); } } while (0)	//eric++
//#define dbg(fmt, args...) l2tp_log (LOG_INFO, fmt, ##args); //eric++

#ifdef DEBUG
#if 1	//eric++
#define L2TP_DEBUG(type, fmt, args...)					\
	do { FILE *fp = fopen("/dev/console", "w"); if (fp) { fprintf(fp, fmt, ## args); fclose(fp); } } while (0)
#else
#define L2TP_DEBUG(type, fmt, args...)					\
	do {								\
		if (l2tp_opt_debug && (l2tp_opt_trace_flags & type)) {	\
			if (l2tp_opt_nodaemon) {			\
				printf("DEBUG: " fmt "\n", ##args);	\
			} else {					\
				syslog(LOG_DEBUG, "DEBUG: " fmt, ##args);\
			}						\
		}							\
		DMALLOC_MESSAGE(fmt, ##args);				\
	} while(0)
#endif
#else
#define L2TP_DEBUG(level, fmt, args...)
#endif /* DEBUG */

#define BUG_TRAP(_cond)		assert(!(_cond))

/* Control Connection Establishment state machine events.
 * Ref RFC2661, 7.2.1
 */
#define L2TP_CCE_EVENT_OPEN_REQ		0
#define L2TP_CCE_EVENT_SCCRQ_ACCEPT	1
#define L2TP_CCE_EVENT_SCCRQ_DENY	2
#define L2TP_CCE_EVENT_SCCRP_ACCEPT	3
#define L2TP_CCE_EVENT_SCCRP_DENY	4
#define L2TP_CCE_EVENT_LOSETIE		5
#define L2TP_CCE_EVENT_SCCCN_ACCEPT	6
#define L2TP_CCE_EVENT_SCCCN_DENY	7
#define L2TP_CCE_EVENT_CLOSE_REQ	8
#define L2TP_CCE_EVENT_STOPCCN		9
#define L2TP_CCE_EVENT_XPRT_DOWN	10
#define L2TP_CCE_EVENT_COUNT		11

#define	L2TP_CCE_EVENT_NAMES {		\
	"OPEN_REQ",			\
	"SCCRQ_ACCEPT",			\
	"SCCRQ_DENY",			\
	"SCCRP_ACCEPT",			\
	"SCCRP_DENY",			\
	"LOSETIE",			\
	"SCCCN_ACCEPT",			\
	"SCCCN_DENY",			\
	"CLOSE_REQ",			\
	"STOPCCN",			\
	"XPRT_DOWN" }

/* LAC Incoming Call state machine events.
 * Ref RFC2661, 7.4.1
 */
#define L2TP_LAIC_EVENT_INCALL_IND	0
#define L2TP_LAIC_EVENT_ICCN		1
#define L2TP_LAIC_EVENT_CDN		2
#define L2TP_LAIC_EVENT_ENDCALL_IND	3
#define L2TP_LAIC_EVENT_TUNNEL_OPEN_IND	4
#define L2TP_LAIC_EVENT_ICRP_ACCEPT	5
#define L2TP_LAIC_EVENT_ICRP_DENY	6
#define L2TP_LAIC_EVENT_ICRQ		7
#define L2TP_LAIC_EVENT_CLOSE_REQ	8
#define L2TP_LAIC_EVENT_OPEN_REQ	9
#define L2TP_LAIC_EVENT_XPRT_DOWN	10
#define L2TP_LAIC_EVENT_PERSIST		11
#define L2TP_LAIC_EVENT_COUNT		12

#define	L2TP_LAIC_EVENT_NAMES {		\
	"INCALL_IND",			\
	"ICCN",				\
	"CDN",				\
	"ENDCALL_IND",			\
	"TUNNEL_OPEN_IND",		\
	"ICRP_ACCEPT",			\
	"ICRP_DENY",			\
	"ICRQ",				\
	"CLOSE_REQ",			\
	"OPEN_REQ",			\
	"XPRT_DOWN",			\
	"PERSIST" }

/* LNS Incoming Call state machine events.
 * Ref RFC2661, 7.4.2
 */
#define L2TP_LNIC_EVENT_ICRQ_ACCEPT	0
#define L2TP_LNIC_EVENT_ICRQ_DENY	1
#define L2TP_LNIC_EVENT_ICRP		2
#define L2TP_LNIC_EVENT_ICCN_ACCEPT	3
#define L2TP_LNIC_EVENT_ICCN_DENY	4
#define L2TP_LNIC_EVENT_CDN		5
#define L2TP_LNIC_EVENT_CLOSE_REQ	6
#define L2TP_LNIC_EVENT_XPRT_DOWN	7
#define L2TP_LNIC_EVENT_COUNT		8

#define	L2TP_LNIC_EVENT_NAMES {		\
	"ICRQ_ACCEPT",			\
	"ICRQ_DENY",			\
	"ICRP",				\
	"ICCN_ACCEPT",			\
	"ICCN_DENY",			\
	"CDN",				\
	"CLOSE_REQ",			\
	"XPRT_DOWN" }

/* LAC Outgoing Call state state machine events.
 * Ref RFC2661, 7.5.1
 */
#define L2TP_LAOC_EVENT_OCRQ_ACCEPT	0
#define L2TP_LAOC_EVENT_OCRQ_DENY	1
#define L2TP_LAOC_EVENT_OCRP		2
#define L2TP_LAOC_EVENT_OCCN		3
#define L2TP_LAOC_EVENT_CDN		4
#define L2TP_LAOC_EVENT_BEARER_UP	5
#define L2TP_LAOC_EVENT_BEARER_DOWN	6
#define L2TP_LAOC_EVENT_CLOSE_REQ	7
#define L2TP_LAOC_EVENT_XPRT_DOWN	8
#define L2TP_LAOC_EVENT_COUNT		9

#define	L2TP_LAOC_EVENT_NAMES {		\
	"OCRQ_ACCEPT",			\
	"OCRQ_DENY",			\
	"OCRP",				\
	"OCCN",				\
	"CDN",				\
	"BEARER_UP",			\
	"BEARER_DOWN",			\
	"CLOSE_REQ",			\
	"XPRT_DOWN" }

/* LNS Outgoing Call state state machine events.
 * Ref RFC2661, 7.5.2
 */
#define L2TP_LNOC_EVENT_OPEN_REQ	0
#define L2TP_LNOC_EVENT_OCCN		1
#define L2TP_LNOC_EVENT_CDN		2
#define L2TP_LNOC_EVENT_TUNNEL_OPEN	3
#define L2TP_LNOC_EVENT_OCRP_ACCEPT	4
#define L2TP_LNOC_EVENT_OCRP_DENY	5
#define L2TP_LNOC_EVENT_OCRQ		6
#define L2TP_LNOC_EVENT_CLOSE_REQ	7
#define L2TP_LNOC_EVENT_XPRT_DOWN	8
#define L2TP_LNOC_EVENT_PERSIST		9
#define L2TP_LNOC_EVENT_COUNT		10

#define	L2TP_LNOC_EVENT_NAMES {		\
	"OPEN_REQ",			\
	"OCCN",				\
	"CDN",				\
	"TUNNEL_OPEN",			\
	"OCRP_ACCEPT",			\
	"OCRP_DENY",			\
	"OCRQ",				\
	"CLOSE_REQ",			\
	"XPRT_DOWN",			\
	"PERSIST" }

struct l2tp_tunnel;
struct l2tp_session;

struct l2tp_result_codes {
	int result_code;
	int error_code;
	const char *error_string;
};

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
 */
struct l2tp_hdr {
#if defined(__LITTLE_ENDIAN_BITFIELD)
	__u8	p_bit:1,
		o_bit:1,
		rsvd_2:1,
		s_bit:1,
		rsvd_1:2,
		l_bit:1,
		t_bit:1;
	__u8	ver:4,
		rsvd_3:4;
#elif defined(__BIG_ENDIAN_BITFIELD)
	__u8	t_bit:1,
		l_bit:1,
		rsvd_1:2,
		s_bit:1,
		rsvd_2:1,
		o_bit:1,
		p_bit:1;
	__u8	rsvd_3:4,
		ver:4;
#else
#error	"Adjust your <asm/byteorder.h> defines"
#endif	
	__u8	data[0];
};

/*****************************************************************************
 * Application shared types
 *****************************************************************************/

/* A packet is represented internally by the following data structure.
 * Transmit packets can be made up of multiple data buffers which are converted
 * into a struct msghdr for sendmsg() system calls.
 * Receive packets are usually held in a single data buffer.
 * State associated with each packet is carried here.
 */
struct l2tp_packet_buffer {
	void *data;
	int data_len;
};

struct l2tp_packet {
	__u16				tunnel_id;
	__u16				session_id;
	int				msg_type;
	int				total_len;
	__u16				ns;
	__u16				nr;
	int				avp_len;
	int				avp_offset;
	int				requeue_count; 		/* number of times this pkt has been requeued */
	__u32				expires_at;
	struct l2tp_xprt		*xprt;
	struct usl_list_head		list;			/* the list this packet is on */
	int				num_bufs;		/* number of elements in buf[] */
	struct l2tp_packet_buffer	buf[0];			/* array of packet buffers */
};

/* Each tunnel has a peer, represented by this data structure.
 * More than one tunnel shares the same peer context when those tunnels
 * are between the same local and peer IP addresses.
 */
struct l2tp_peer {
	int				if_index; 		/* IP_PKTINFO: ifindex of local i/f to reach peer */
	struct in_addr			if_local_addr; 		/* IP_PKTINFO: src ip to reach peer */
	struct in_addr			if_peer_addr;		/* IP_PKTINFO: dest ip to reach peer (addr of next hop if is a router) */
	struct usl_list_head		list;
	int				num_tunnels;
	int				use_count;
	int				mtu;
	void				*priv;
};

struct l2tp_peer_profile {
	char	 			*profile_name;
	char				*default_tunnel_profile_name;
	char				*default_session_profile_name;
	char				*default_ppp_profile_name;
	int				we_can_be_lac:1;
	int				we_can_be_lns:1;
	struct sockaddr_in		peer_addr;
	struct in_addr			netmask;
	int				netmask_len;
	__u32				flags;
	struct usl_list_head		list;
};

/* L2TP global counters and statistics.
 */
struct l2tp_msg_stats {
	unsigned long		rx;
	unsigned long		tx;
	unsigned long		rx_bad;
};

struct l2tp_stats {
	unsigned long		socket_errors;
	unsigned long		total_rcvd_control_frames;
	unsigned long		total_sent_control_frames;
	unsigned long		total_retransmitted_control_frames;
	unsigned long		total_control_frame_send_fails;
	unsigned long		short_frames;
	unsigned long		wrong_version_frames;
	unsigned long		unexpected_data_frames;
	unsigned long		bad_rcvd_frames;
	unsigned long		no_control_frame_resources;
	unsigned long		no_peer_resources;
	unsigned long		no_tunnel_resources;
	unsigned long		no_session_resources;
	unsigned long		no_ppp_resources;
	unsigned long		too_many_peers;
	unsigned long		too_many_tunnels;
	unsigned long		too_many_sessions;
	unsigned long		tunnel_setup_failures;
	unsigned long		session_setup_failures;
	unsigned long		auth_fails;
	unsigned long		no_matching_tunnels;
	unsigned long		tunnel_id_alloc_fails;
	unsigned long		no_matching_tunnel_id_discards;
	unsigned long		no_matching_session_id_discards;
	unsigned long		mismatched_tunnel_ids;
	unsigned long		mismatched_session_ids;
	unsigned long		session_id_alloc_fails;
	unsigned long		encode_message_fails;
	unsigned long		no_avp_resources;
	unsigned long		event_queue_full_errors;
	unsigned long		ignored_avps;
	unsigned long		vendor_avps;
	unsigned long		illegal_messages;
	unsigned long		unsupported_messages;
	struct l2tp_msg_stats	messages[L2TP_AVP_MSG_COUNT];
};

/* Tunnel <--> Transort API.
 */
struct l2tp_xprt_tunnel_create_data {
	__u16		max_retries;
	__u16		rx_window_size;		/* max length of receive pipe to userspace */
	__u16		tx_window_size;		/* max unack'd transmits */
	__u16		retry_timeout;
	__u16		hello_timeout;
	__u16		pad;
	__u32		our_addr; 		/* these values must agree with tunnel's socket */
	__u32		peer_addr;
	__u16		our_udp_port;
	__u16		peer_udp_port;
	int		udp_checksum_enabled:1;
};

struct l2tp_xprt_tunnel_modify_data {
	int		flags;
	__u16		max_retries;
	__u16		rx_window_size;		/* max length of receive pipe to userspace */
	__u16		tx_window_size;		/* max unack'd transmits */
	__u16		retry_timeout;
	__u16		hello_timeout;
#define L2TP_XPRT_TUN_FLAG_MAX_RETRIES		(1 << 0)
#define L2TP_XPRT_TUN_FLAG_RX_WINDOW_SIZE	(1 << 1)
#define L2TP_XPRT_TUN_FLAG_TX_WINDOW_SIZE	(1 << 2)
#define L2TP_XPRT_TUN_FLAG_RETRY_TIMEOUT	(1 << 3)
#define L2TP_XPRT_TUN_FLAG_SPARE		(1 << 4)
#define L2TP_XPRT_TUN_FLAG_HELLO_TIMEOUT	(1 << 5)
};

/* Session - PPP API.
 * This structure is provided read-only to PPP.
 */
struct l2tp_session_config {
	__u32					flags;
	__u32					trace_flags;
	char					*profile_name;
	char					*ppp_profile_name;
	char					*user_name;
	char					*user_password;
	char					*session_name;
	char					*interface_name;
	__u32					minimum_bps;
	__u32					maximum_bps;
	__u32					connect_speed;
	__u32					rx_connect_speed;
	char					*priv_group_id;
	char					*called_number;
	char					*calling_number;
	char					*sub_address;
	int					reorder_timeout;
	int					mtu;
	__u16					do_pmtu_discovery:1;
	__u16					framing_type_sync:1;
	__u16					framing_type_async:1;
	__u16					bearer_type_digital:1;
	__u16					bearer_type_analog:1;
	__u16					sequencing_required:1;
	__u16					use_sequence_numbers:1;
	__u16					use_ppp_proxy:1;
	enum l2tp_api_session_proxy_auth_type	proxy_auth_type;
	__u8					proxy_auth_id;
	char					*proxy_auth_name;
	__u8					*proxy_auth_challenge;
	int					proxy_auth_challenge_len;
	__u8					*proxy_auth_response;
	int					proxy_auth_response_len;
	__u8					*initial_rcvd_lcp_confreq;
	int					initial_rcvd_lcp_confreq_len;
	__u8					*last_sent_lcp_confreq;
	int					last_sent_lcp_confreq_len;
	__u8					*last_rcvd_lcp_confreq;
	int					last_rcvd_lcp_confreq_len;
};

/* This dummy structure contains all messages of the interface and is used to generate
 * a cookie for the application. We use this to tell when one of the structures of the
 * interface changes size.
 */
struct l2tp_api_app_cookie {
	struct l2tp_api_app_msg_data app_info;
	struct l2tp_api_system_msg_data system;
	struct l2tp_api_peer_profile_msg_data peer_profile;
	struct l2tp_api_peer_profile_list_msg_data peer_profile_list;
	struct l2tp_api_session_profile_msg_data session_profile;
	struct l2tp_api_session_profile_list_msg_data session_profile_list;
	struct l2tp_api_session_msg_data session;
	struct l2tp_api_session_list_msg_data session_list;
	struct l2tp_api_ppp_profile_msg_data ppp_profile;
	struct l2tp_api_ppp_profile_list_msg_data ppp_profile_list;
	struct l2tp_api_test_msg_data test;
	struct l2tp_api_tunnel_msg_data tunnel;
	struct l2tp_api_tunnel_list_msg_data tunnel_list;
	struct l2tp_api_tunnel_profile_msg_data tunnel_profile;
	struct l2tp_api_tunnel_profile_list_msg_data tunnel_profile_list;
};

#define L2TP_APP_COOKIE		sizeof(struct l2tp_api_app_cookie)

/*****************************************************************************
 * Modifying "optional string" values is encapsulated by these macros.
 * When optstrings are cleared (set to "empty string") they're either set
 * to NULL or are given default values. However, the RPC interface requires
 * us to send a "valid" (non-NULL) string, so if the supplied value is
 * a zero length string, we treat it as NULL.
 * These macros are used in management interface code. They assume the label
 * 'out' exists and the variables 'result' and 'msg' are appropriate.
 ******************************************************************************/

#define L2TP_SET_OPTSTRING_VAR(_to, _var)					\
	do {									\
		if (OPTSTRING_PTR(msg->_var) == NULL) {				\
			l2tp_log(LOG_ERR, "Bad optstring: " #_var);		\
			result = -EINVAL;					\
			goto out;						\
		}								\
		if ((_to)->_var != NULL) {					\
			free((_to)->_var);					\
			(_to)->_var = NULL;					\
		}								\
		if (strlen(OPTSTRING(msg->_var)) > 0) {				\
			(_to)->_var = strdup(OPTSTRING(msg->_var));		\
			if ((_to)->_var == NULL) {				\
				result = -ENOMEM;				\
				goto out;					\
			}							\
		}								\
	} while(0)

#define L2TP_SET_OPTSTRING_VAR_WITH_DEFAULT(_to, _var, _default)		\
	do {									\
		if ((_to)->_var != NULL) {					\
			free((_to)->_var);					\
			(_to)->_var = NULL;					\
		}								\
		if ((OPTSTRING_PTR(msg->_var) != NULL) &&			\
		    (strlen(OPTSTRING(msg->_var)) > 0)) {			\
			(_to)->_var = strdup(OPTSTRING(msg->_var));		\
		} else {							\
			(_to)->_var = strdup(_default);				\
		}								\
		if ((_to)->_var == NULL) {					\
			result = -ENOMEM;					\
			goto out;						\
		}								\
	} while(0)

#define L2TP_SET_OPTSTRING_VAR_WITH_LEN(_to, _var)				\
	do {									\
		if (OPTSTRING_PTR(msg->_var) == NULL) {				\
			l2tp_log(LOG_ERR, "Bad optstring: " #_var);		\
			result = -EINVAL;					\
			goto out;						\
		}								\
		(_to)->_var##_len = strlen(OPTSTRING(msg->_var));		\
		if ((_to)->_var != NULL) {					\
			free((_to)->_var);					\
			(_to)->_var = NULL;					\
		}								\
		if ((_to)->_var##_len > 0) {					\
			(_to)->_var = strdup(OPTSTRING(msg->_var));		\
			if ((_to)->_var == NULL) {				\
				result = -ENOMEM;				\
				goto out;					\
			}							\
		}								\
	} while(0)

/*****************************************************************************
 * Internal interfaces
 *****************************************************************************/

struct l2tp_xprt_tunnel_event {
	int		event_id;
#define L2TP_XPRT_TUN_EVENT_TUNNEL_UP		1
#define L2TP_XPRT_TUN_EVENT_TUNNEL_DOWN		2
};

struct l2tp_ppp_msg_data {
	char		*profile_name;
	int		trace_flags;
	__u32		ppp_id;
	int		flags;
#define L2TP_API_PPP_FLAG_TRACE_FLAGS		(1 << 0)
#define L2TP_API_PPP_FLAG_PROFILE_NAME		(1 << 1)
};

extern int l2tp_opt_remote_rpc;
extern int l2tp_opt_nodaemon;
extern int l2tp_opt_debug;
extern unsigned long l2tp_opt_trace_flags;
extern __u16 l2tp_firmware_revision;
extern char *l2tp_kernel_version;
extern char *l2tp_cpu_name;
extern struct l2tp_stats l2tp_stats;

extern int l2tp_opt_udp_port;
extern void *l2tp_sig_notifier;

extern struct l2tp_stats l2tp_stats;

struct iovec;
struct l2tp_tunnel;
struct msghdr;
struct pppol2tp_ioc_stats;

/* Hooks, overridable by plugins */
extern int (*l2tp_tunnel_created_hook)(__u16 tunnel_id);
extern int (*l2tp_tunnel_deleted_hook)(__u16 tunnel_id);
extern int (*l2tp_tunnel_modified_hook)(__u16 tunnel_id);
extern int (*l2tp_tunnel_up_hook)(__u16 tunnel_id, __u16 peer_tunnel_id);
extern int (*l2tp_tunnel_down_hook)(__u16 tunnel_id);
extern int (*l2tp_session_created_hook)(struct l2tp_session const *session, __u16 tunnel_id, __u16 session_id);
extern int (*l2tp_session_deleted_hook)(struct l2tp_session const *session, __u16 tunnel_id, __u16 session_id);
extern int (*l2tp_session_modified_hook)(struct l2tp_session const *session, __u16 tunnel_id, __u16 session_id);
extern int (*l2tp_session_up_hook)(struct l2tp_session const *session, __u16 tunnel_id, __u16 session_id, __u16 peer_tunnel_id, __u16 peer_session_id);
extern int (*l2tp_session_down_hook)(struct l2tp_session const *session, __u16 tunnel_id, __u16 session_id);
extern int (*l2tp_session_get_stats_hook)(struct l2tp_session const *session, __u16 tunnel_id, __u16 session_id, struct pppol2tp_ioc_stats *stats);
extern int (*l2tp_session_open_bearer_hook)(struct l2tp_session const *session, const char *called_number);
extern int (*l2tp_session_close_bearer_hook)(struct l2tp_session const *session, const char *called_number);

extern void (*l2tp_session_ppp_created_hook)(struct l2tp_session const *session, __u16 tunnel_id, __u16 session_id, int unit);
extern void (*l2tp_session_ppp_deleted_hook)(struct l2tp_session const *session, __u16 tunnel_id, __u16 session_id);

/* l2tp_common.c */
extern unsigned long l2tp_parse_debug_mask(char *arg);
extern const char *l2tp_strerror(int error);

/* l2tp_avp.c */
extern void l2tp_avp_init(void);
extern void l2tp_avp_cleanup(void);
extern int l2tp_avp_message_encode(__u16 msg_type, struct l2tp_packet **ppkt, int hide, struct l2tp_avp_desc *avp_data, struct l2tp_tunnel *tunnel);
extern int l2tp_avp_message_decode(int msg_len, struct l2tp_avp_hdr *first_avp, struct l2tp_avp_desc *data, struct l2tp_tunnel const *tunnel);
extern int l2tp_avp_hidable(struct l2tp_avp_hdr *avp);
extern int l2tp_message_parse(void *msg, int msg_len, struct l2tp_avp_desc *parse_data, void **avp_buf, struct l2tp_tunnel const *tunnel);
extern int l2tp_avp_preparse(struct l2tp_avp_hdr *first_avp, int avp_data_len, char **host_name, __u16 *msg_type);

/* l2tp_main.c */
extern int l2tp_random(int min, int max);
extern char *l2tp_buffer_hexify(void *buf, int buf_len);
extern void l2tp_make_random_vector(void *buf, int buf_len);
extern void l2tp_vlog(int level, const char *fmt, va_list ap);
extern void l2tp_log(int level, const char *fmt, ...);
extern char *l2tp_system_time(void);
extern void l2tp_mem_dump(int level, void *data, int data_len, int hex_only);
extern void l2tp_warn_not_yet_supported(const char *what);
extern void l2tp_restore_default_config(void);

/* l2tp_network.c */
extern int l2tp_net_build_header(void **buf, int *buf_len, __u16 ns, __u16 nr, __u16 tunnel_id, __u16 session_id);
extern void l2tp_net_update_header(void *buf, __u16 ns, __u16 nr);
extern struct l2tp_peer *l2tp_net_peer_register(struct in_addr addr, int udp_port);
extern void l2tp_net_peer_unregister(struct l2tp_peer *peer);
extern void l2tp_net_recv_unconn(int fd, void *arg);
extern void l2tp_net_recv(int fd, void *arg);
extern int l2tp_net_prepare_msghdr(struct msghdr *msg, struct l2tp_packet *pkt);
extern int l2tp_net_send(struct l2tp_tunnel *tunnel, __u16 tunnel_id, __u16 session_id, struct l2tp_packet *pkt, __u8 msg_type);
extern int l2tp_net_create_socket(struct sockaddr_in *local_addr, int use_udp_checksums);
extern int l2tp_net_modify_socket(int fd, int use_udp_checksums, int do_pmtu_discovery);
extern int l2tp_net_get_local_address_for_peer(struct sockaddr_in *peer_addr, struct in_addr *local_addr);
extern int l2tp_net_get_socket_addresses(int fd, struct sockaddr_in *src, struct sockaddr_in *dest, struct l2tp_tunnel *tunnel);
extern int l2tp_net_connect_socket(int fd, struct sockaddr_in const *peer_addr, struct l2tp_peer *peer, struct l2tp_tunnel *tunnel);
extern void l2tp_net_init(void);
extern void l2tp_net_cleanup(void);

/* l2tp_api.c */
extern void l2tp_api_init(void);
extern void l2tp_api_cleanup(void);

/* l2tp_peer.c */
extern struct l2tp_peer *l2tp_peer_find(struct in_addr const *src, struct in_addr const *dest);
extern struct l2tp_peer_profile *l2tp_peer_profile_find_by_addr(struct in_addr peer_addr);
extern void l2tp_peer_free(struct l2tp_peer *peer);
extern struct l2tp_peer *l2tp_peer_alloc(struct in_addr src, struct in_addr dest);
extern void l2tp_peer_inc_use_count(struct l2tp_peer *peer);
extern void l2tp_peer_dec_use_count(struct l2tp_peer *peer);
extern struct l2tp_peer_profile *l2tp_peer_profile_find(char *name);
extern void l2tp_peer_reinit(void);
extern void l2tp_peer_init(void);
extern void l2tp_peer_cleanup(void);

/* l2tp_tunnel.c */
extern void l2tp_tunnel_log(struct l2tp_tunnel const *tunnel, int category, int level, const char *fmt, ...);
extern int l2tp_tunnel_queue_event(__u16 tunnel_id, int event);
extern void l2tp_tunnel_inc_use_count(struct l2tp_tunnel *tunnel);
extern void l2tp_tunnel_dec_use_count(struct l2tp_tunnel *tunnel);
extern struct l2tp_tunnel *l2tp_tunnel_alloc(__u16 tunnel_id, char *tunnel_profile_name, char *peer_profile_name, int created_by_admin, int *result);
extern void l2tp_tunnel_link(struct l2tp_tunnel *tunnel);
extern void l2tp_tunnel_unlink(struct l2tp_tunnel *tunnel, int force);
extern int l2tp_tunnel_xprt_create(struct l2tp_peer *peer, struct l2tp_tunnel *tunnel, struct sockaddr_in const *peer_addr);
extern void l2tp_tunnel_session_add_again(struct l2tp_tunnel *tunnel, struct usl_hlist_node *hlist, __u16 session_id);
extern int l2tp_tunnel_session_add(struct l2tp_tunnel *tunnel, struct usl_list_head *list, struct usl_hlist_node *hlist, __u16 session_id);
extern void l2tp_tunnel_session_remove(struct l2tp_tunnel *tunnel, struct usl_list_head *list, struct usl_hlist_node *hlist);
extern struct usl_list_head *l2tp_tunnel_session_list(struct l2tp_tunnel *tunnel);
extern struct usl_hlist_head *l2tp_tunnel_session_id_hlist(struct l2tp_tunnel *tunnel, __u16 session_id);
extern int l2tp_tunnel_get_fd(struct l2tp_tunnel const *tunnel);
extern struct l2tp_xprt *l2tp_tunnel_get_xprt(struct l2tp_tunnel const *tunnel);
extern struct sockaddr_in const *l2tp_tunnel_get_peer_addr(struct l2tp_tunnel const *tunnel);
extern struct sockaddr_in const *l2tp_tunnel_get_local_addr(struct l2tp_tunnel const *tunnel);
extern void l2tp_tunnel_set_addresses(struct l2tp_tunnel *tunnel, struct sockaddr_in *src, struct sockaddr_in *dest);
extern int l2tp_tunnel_is_persistent(struct l2tp_tunnel const *tunnel);
extern int l2tp_tunnel_is_lac(struct l2tp_tunnel const *tunnel);
extern int l2tp_tunnel_is_fd_connected(struct l2tp_tunnel const *tunnel);
extern __u16 l2tp_tunnel_id(struct l2tp_tunnel const *tunnel);
extern __u16 l2tp_tunnel_peer_id(struct l2tp_tunnel const *tunnel);
extern struct l2tp_tunnel *l2tp_tunnel_find_by_id(__u16 tunnel_id);
extern struct l2tp_tunnel *l2tp_tunnel_find_by_name(const char *tunnel_name);
extern void l2tp_tunnel_update_mtu(struct l2tp_tunnel *tunnel, int fd, int mtu);
extern struct l2tp_peer *l2tp_tunnel_get_peer(struct l2tp_tunnel const *tunnel);
extern void l2tp_tunnel_get_profile_names(struct l2tp_tunnel const *tunnel, char **tunnel_profile_name, char **session_profile_name, char **ppp_profile_name);
extern void l2tp_tunnel_recv(struct l2tp_tunnel *tunnel, __u16 tunnel_id, 
			     __u16 session_id, struct l2tp_packet *pkt);

extern int l2tp_tunnel_is_hide_avps(struct l2tp_tunnel const *tunnel);
extern void l2tp_tunnel_get_secret(struct l2tp_tunnel const *tunnel, char **secret, int *secret_len);
extern int l2tp_tunnel_get_trace_flags(struct l2tp_tunnel const *tunnel);
extern int l2tp_tunnel_get_mtu(struct l2tp_tunnel const *tunnel);
extern int l2tp_tunnel_get_mtu_discovery(struct l2tp_tunnel const *tunnel);

extern void l2tp_tunnel_reinit(void);
extern void l2tp_tunnel_init(void);
extern void l2tp_tunnel_cleanup(void);

extern int l2tp_tunnel_send_hello(void *tun);

extern void l2tp_fsm_cce_handle_event(struct usl_fsm_instance *fsmi, int event, 
				      void *peer, void *tunnel, void *session);
extern void l2tp_tunnel_down_event(__u16 tunnel_id);

extern int l2tp_tunnel_register_message_handler(int msg_type,
						void (*func)(struct l2tp_peer *peer, 
							     struct l2tp_tunnel *tunnel, 
							     __u16 session_id, 
							     struct l2tp_avp_desc *avps));
extern void l2tp_tunnel_unregister_message_handler(int msg_type);
extern void l2tp_tunnel_globals_modify(struct l2tp_api_system_msg_data *msg, int *result);
extern void l2tp_tunnel_globals_get(struct l2tp_api_system_msg_data *msg);
extern void l2tp_tunnel_close_now(struct l2tp_tunnel *tunnel);

/* l2tp_transport.c */
struct l2tp_xprt;
extern void l2tp_xprt_tunnel_down(struct l2tp_xprt *xprt);
extern void l2tp_xprt_tunnel_going_down(struct l2tp_xprt *xprt);
extern int l2tp_xprt_tunnel_create(int fd, __u16 tunnel_id, struct l2tp_xprt_tunnel_create_data *msg, void *tunnel, void **handle);
extern int l2tp_xprt_tunnel_delete(struct l2tp_xprt *xprt);
extern int l2tp_xprt_tunnel_modify(struct l2tp_xprt *xprt, struct l2tp_xprt_tunnel_modify_data *msg);
extern int l2tp_xprt_tunnel_get(struct l2tp_xprt *xprt, struct l2tp_api_tunnel_msg_data *msg);
extern int l2tp_xprt_kernel_get(struct l2tp_xprt *xprt, struct l2tp_api_tunnel_stats *msg);
extern int l2tp_xprt_send(struct l2tp_xprt *xprt, struct l2tp_packet *pkt);
extern int l2tp_xprt_recv(struct l2tp_xprt *xprt, struct l2tp_packet *pkt);
extern void l2tp_xprt_set_peer_tunnel_id(struct l2tp_xprt *xprt, __u16 peer_tunnel_id);
extern void l2tp_xprt_set_tunnel_handle(struct l2tp_xprt *xprt, void *tunnel);
extern void l2tp_xprt_hello_rcvd(struct l2tp_xprt *xprt);
extern int l2tp_xprt_get_kernel_fd(struct l2tp_tunnel const *tunnel);

extern void l2tp_xprt_init(void);
extern void l2tp_xprt_cleanup(void);

/* l2tp_session.c */
extern void l2tp_session_log(struct l2tp_session const *session, int category, int level, const char *fmt, ...);
extern struct l2tp_tunnel *l2tp_session_get_tunnel(struct l2tp_session const *session);
extern const char *l2tp_session_get_name(struct l2tp_session const *session);
extern void l2tp_session_get_call_info(struct l2tp_session const *session, __u16 *session_id, __u16 *peer_session_id, 
				       __u32 *call_serial_number, __u32 *physical_channel_id);
extern struct l2tp_session_config const *l2tp_session_get_config(struct l2tp_session const *session);
extern int l2tp_session_is_lns(struct l2tp_session const *session);
extern int l2tp_session_info_get(struct l2tp_session const *session, __u16 tunnel_id, __u16 session_id, struct l2tp_api_session_msg_data *result);
extern void l2tp_session_msg_free(struct l2tp_api_session_msg_data *msg);
extern void l2tp_session_tunnel_updown_event(struct l2tp_tunnel *tunnel, int up);
extern void l2tp_session_tunnel_modified(struct l2tp_tunnel *tunnel);
extern void l2tp_session_close_event(__u16 tunnel_id, __u16 session_id);
extern int l2tp_session_profile_names_get(__u16 tunnel_id, __u16 session_id, char **session_profile_name, char **ppp_profile_name);
extern void l2tp_session_globals_modify(struct l2tp_api_system_msg_data *msg, int *result);
extern void l2tp_session_globals_get(struct l2tp_api_system_msg_data *msg);
extern void l2tp_session_inc_use_count(struct l2tp_session *session);
extern void l2tp_session_dec_use_count(struct l2tp_session *session);

extern void l2tp_session_reinit(void);
extern void l2tp_session_init(void);
extern void l2tp_session_cleanup(void);

/* l2tp_ppp.c */
extern int l2tp_ppp_profile_get(char *name, struct l2tp_api_ppp_profile_msg_data *result);
extern int l2tp_ppp_create(struct l2tp_ppp_msg_data *msg_data);
extern int l2tp_ppp_delete(struct l2tp_ppp_msg_data *msg_data);
extern int l2tp_ppp_modify(struct l2tp_ppp_msg_data *msg_data);
extern int l2tp_ppp_get(struct l2tp_ppp_msg_data *msg_data);
extern void l2tp_ppp_profile_msg_free(struct l2tp_api_ppp_profile_msg_data *msg);
extern void l2tp_ppp_reinit(void);
extern void l2tp_ppp_init(void);
extern void l2tp_ppp_cleanup(void);

/* l2tp_plugin.c */
extern int l2tp_plugin_load(char *name);

/* l2tp_packet.c */
extern int l2tp_pkt_cmp(void *t1, void *t2, int cmp_len);
extern struct l2tp_packet *l2tp_pkt_alloc(int num_bufs);
extern struct l2tp_packet *l2tp_pkt_peek(struct usl_list_head *head);
extern void l2tp_pkt_unlink(struct l2tp_packet *pkt);
extern int l2tp_pkt_queue_empty(struct usl_list_head *head);
extern void l2tp_pkt_queue_head(struct usl_list_head *head, struct l2tp_packet *pkt);
extern void l2tp_pkt_queue_tail(struct usl_list_head *head, struct l2tp_packet *pkt);
extern void l2tp_pkt_queue_add(struct usl_list_head *head, struct l2tp_packet *pkt);
extern void l2tp_pkt_insert(struct l2tp_packet *pos, struct l2tp_packet *pkt);
extern struct l2tp_packet *l2tp_pkt_dequeue(struct usl_list_head *head);
extern void l2tp_pkt_free(struct l2tp_packet *pkt);
extern void l2tp_pkt_queue_purge(struct usl_list_head *head);
extern struct l2tp_packet *l2tp_pkt_clone(struct l2tp_packet *pkt);

/* l2tp_test.c */
#ifdef L2TP_TEST

extern int l2tp_test_is_fake_rx_drop(__u16 tunnel_id, __u16 session_id);
extern int l2tp_test_is_fake_tx_drop(__u16 tunnel_id, __u16 session_id);
extern int l2tp_test_is_hold_tunnels(void);
extern int l2tp_test_is_hold_sessions(void);
extern int l2tp_test_is_no_random_ids(void);
extern __u16 l2tp_test_alloc_tunnel_id(void);
extern __u16 l2tp_test_alloc_session_id(void);
extern void l2tp_test_tunnel_id_hash_inc_stats(int hit);
extern void l2tp_test_tunnel_name_hash_inc_stats(int hit);
extern void l2tp_test_session_id_hash_inc_stats(int hit);

#else

static inline int l2tp_test_is_fake_rx_drop(__u16 tunnel_id, __u16 session_id)
{
	return FALSE;
}

static inline int l2tp_test_is_fake_tx_drop(__u16 tunnel_id, __u16 session_id)
{
	return FALSE;
}

static inline int l2tp_test_is_hold_tunnels(void)
{
	return FALSE;
}
 
static inline int l2tp_test_is_hold_sessions(void)
{
	return FALSE;
}

static inline int l2tp_test_is_no_random_ids(void)
{
	return FALSE;
}

static inline __u16 l2tp_test_alloc_tunnel_id(void)
{
	return 0;
}

static inline __u16 l2tp_test_alloc_session_id(void)
{
	return 0;
}

static inline void l2tp_test_tunnel_id_hash_inc_stats(int hit)
{
}

static inline void l2tp_test_tunnel_name_hash_inc_stats(int hit)
{
}

static inline void l2tp_test_session_id_hash_inc_stats(int hit)
{
}

#endif /* L2TP_TEST */

#endif
