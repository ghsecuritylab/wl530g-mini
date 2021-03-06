/*
 * Copyright (c) 2000-2003 Apple Computer, Inc. All rights reserved.
 *
 * @APPLE_LICENSE_HEADER_START@
 * 
 * Copyright (c) 1999-2003 Apple Computer, Inc.  All Rights Reserved.
 * 
 * This file contains Original Code and/or Modifications of Original Code
 * as defined in and that are subject to the Apple Public Source License
 * Version 2.0 (the 'License'). You may not use this file except in
 * compliance with the License. Please obtain a copy of the License at
 * http://www.opensource.apple.com/apsl/ and read it before using this
 * file.
 * 
 * The Original Code and all software distributed under the License are
 * distributed on an 'AS IS' basis, WITHOUT WARRANTY OF ANY KIND, EITHER
 * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
 * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT.
 * Please see the License for the specific language governing rights and
 * limitations under the License.
 * 
 * @APPLE_LICENSE_HEADER_END@
 */

/* -----------------------------------------------------------------------------
 *
 *  Theory of operation :
 *
 *  L2TP plugin for vpnd
 *
----------------------------------------------------------------------------- */


/* -----------------------------------------------------------------------------
  Includes
----------------------------------------------------------------------------- */

#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <errno.h>
#include <fcntl.h>
#include <syslog.h>
#include <netdb.h>
#include <utmp.h>
#include <pwd.h>
#include <setjmp.h>
#include <sys/param.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <syslog.h>
#include <sys/ioctl.h>
#include <net/dlil.h>
#include <net/if.h>
#include <net/route.h>
#include <pthread.h>
#include <sys/kern_event.h>
#include <netinet/in_var.h>
#include <CoreFoundation/CFNumber.h>
#include <CoreFoundation/CFBundle.h>
#include <SystemConfiguration/SystemConfiguration.h>

#define APPLE 1

//#include "../L2TP-extension/l2tpk.h"
#include "../L2TP-plugin/ipsec_utils.h"
#include "../../../Helpers/vpnd/vpnplugins.h"
#include "../../../Helpers/vpnd/vpnd.h"
#include "../../../Helpers/vpnd/RASSchemaDefinitions.h"
#include "l2tp.h"


// ----------------------------------------------------------------------------
//	� Private Globals
// ----------------------------------------------------------------------------
#define MAXSECRETLEN	256	/* max length of secret */

static CFBundleRef 		bundle = 0;
static CFBundleRef 		pppbundle = 0;
static int 			listen_sockfd = -1;
static int			opt_noipsec = 0;
static int 			key_preference = -1;
static struct sockaddr_in 	listen_address;
static struct sockaddr_in 	our_address;
static struct sockaddr_in 	any_address;
static int			secure_transport = 0;
static int			need_stop_racoon = 0;
static int			debug = 0;
static char			opt_ipsecsharedsecret[MAXSECRETLEN];
static char    			*opt_ipsecsharedsecrettype = "use";	 /* use, key, keychain */
int l2tpvpn_get_pppd_args(struct vpn_params *params);
int l2tpvpn_listen(void);
int l2tpvpn_accept(void);
int l2tpvpn_refuse(void);
void l2tpvpn_close(void);

static u_long load_kext(char *kext);
static int set_key_preference(int *oldval, int newval);


/* -----------------------------------------------------------------------------
plugin entry point, called by vpnd
ref is the vpn bundle reference
pppref is the ppp bundle reference
bundles can be layout in two different ways
- As simple vpn bundles (bundle.vpn). the bundle contains the vpn bundle binary.
- As full ppp bundles (bundle.ppp). The bundle contains the ppp bundle binary, 
and also the vpn kext and the vpn bundle binary in its Plugins directory.
if a simple vpn bundle was used, pppref will be NULL.
if a ppp bundle was used, the vpn plugin will be able to get access to the 
Plugins directory and load the vpn kext.
----------------------------------------------------------------------------- */
int start(struct vpn_channel* the_vpn_channel, CFBundleRef ref, CFBundleRef pppref, int debug_mode)
{
    char 	name[MAXPATHLEN]; 
    CFURLRef	url;

    debug = debug_mode;
    
    /* first load the kext if we are loaded as part of a ppp bundle */
    if (pppref) {
        while ((listen_sockfd = socket(PF_PPP, SOCK_DGRAM, PPPPROTO_L2TP)) < 0)
            if (errno != EINTR)
                break;
        if (listen_sockfd < 0) {
            vpnlog(LOG_DEBUG, "first call to socket failed - attempting to load kext\n");
            if (url = CFBundleCopyBundleURL(pppref)) {
                name[0] = 0;
                CFURLGetFileSystemRepresentation(url, 0, name, MAXPATHLEN - 1);
                CFRelease(url);
                strcat(name, "/");
                if (url = CFBundleCopyBuiltInPlugInsURL(pppref)) {
                    CFURLGetFileSystemRepresentation(url, 0, name + strlen(name), 
                                MAXPATHLEN - strlen(name) - strlen(L2TP_NKE) - 1);
                    CFRelease(url);
                    strcat(name, "/");
                    strcat(name, L2TP_NKE);
                    if (!load_kext(name))
                        while ((listen_sockfd = socket(PF_PPP, SOCK_DGRAM, PPPPROTO_L2TP)) < 0)
                            if (errno != EINTR)
                                break;
                }	
            }
            if (listen_sockfd < 0) {
                vpnlog(LOG_ERR, "VPND L2TP plugin: Unable to load L2TP kernel extension\n");
                return -1;
            }
        }
    }
    

    /* retain reference */
    bundle = ref;
    CFRetain(bundle);
    
    pppbundle = pppref;
    CFRetain(pppbundle);
            
    // hookup our socket handlers
    bzero(the_vpn_channel, sizeof(struct vpn_channel));
    the_vpn_channel->get_pppd_args = l2tpvpn_get_pppd_args;
    the_vpn_channel->listen = l2tpvpn_listen;
    the_vpn_channel->accept = l2tpvpn_accept;
    the_vpn_channel->refuse = l2tpvpn_refuse;
    the_vpn_channel->close = l2tpvpn_close;

    return 0;
}

/* ----------------------------------------------------------------------------- 
    l2tpvpn_get_pppd_args
----------------------------------------------------------------------------- */
int l2tpvpn_get_pppd_args(struct vpn_params *params)
{

    CFStringRef	string;
    
    if (params->serverRef) {			
        /* arguments from the preferences file */
        addstrparam(params->exec_args, &params->next_arg_index, "l2tpmode", "answer");

        string = get_cfstr_option(params->serverRef, kRASEntL2TP, kRASPropL2TPTransport);
        if (string && CFEqual(string, kRASValL2TPTransportIP)) {
            addparam(params->exec_args, &params->next_arg_index, "l2tpnoipsec");
            opt_noipsec = 1;
        }

        string = get_cfstr_option(params->serverRef, kRASEntL2TP, kRASPropL2TPIPSecSharedSecret);
        if (string) {
            CFStringGetCString(string, opt_ipsecsharedsecret, sizeof(opt_ipsecsharedsecret), kCFStringEncodingUTF8);
        }

        string = get_cfstr_option(params->serverRef, kRASEntL2TP, kRASPropL2TPIPSecSharedSecretEncryption);
        if (string) {
            if (CFEqual(string, kRASValL2TPIPSecSharedSecretEncryptionKey))
                opt_ipsecsharedsecrettype = "key";
            else if (CFEqual(string, kRASValL2TPIPSecSharedSecretEncryptionKeychain))
                opt_ipsecsharedsecrettype = "keychain";
        }

    } else {
        /* arguments from command line */
        if (opt_noipsec)
            addparam(params->exec_args, &params->next_arg_index, "l2tpnoipsec");
    }

    return 0;
}


/* ----------------------------------------------------------------------------- 
    system call wrappers
----------------------------------------------------------------------------- */
int l2tp_sys_getsockopt(int sockfd, int level, int optname, void *optval, int *optlen)
{
    while (getsockopt(sockfd, level, optname, optval, optlen) < 0)
        if (errno != EINTR) {
            vpnlog(LOG_ERR, "VPND L2TP plugin: error calling getsockopt for option %d (%s)\n", optname, strerror(errno));
            return -1;
        }
    return 0;
}

int l2tp_sys_setsockopt(int sockfd, int level, int optname, const void *optval, int optlen)
{
    while (setsockopt(sockfd, level, optname, optval, optlen) < 0)
        if (errno != EINTR) {
            vpnlog(LOG_ERR, "VPND L2TP plugin: error calling setsockopt for option %d (%s)\n", optname, strerror(errno));
            return -1;
        }
    return 0;
}

int l2tp_sys_recvfrom(int sockfd, void *buff, size_t nbytes, int flags,
            struct sockaddr *from, int *addrlen)
{
    while (recvfrom(sockfd, buff, nbytes, flags, from, addrlen) < 0)
        if (errno != EINTR) {
            vpnlog(LOG_ERR, "VPND L2TP plugin: error calling recvfrom = %s\n", strerror(errno));
            return -1;
        }
    return 0;
}

/* -----------------------------------------------------------------------------
    set_flag  
----------------------------------------------------------------------------- */
int set_flag(int fd, int set, u_int32_t flag)
{
    int 	optlen;
    u_int32_t	flags;
    
    optlen = 4;
    if (l2tp_sys_getsockopt(fd, PPPPROTO_L2TP, L2TP_OPT_FLAGS, &flags, &optlen) < 0) 
        return -1;

    flags = set ? (flags | flag) : (flags & ~flag);
    if (l2tp_sys_setsockopt(fd, PPPPROTO_L2TP, L2TP_OPT_FLAGS, &flags, 4) < 0)
        return -1;

    return 0;
}

/* -----------------------------------------------------------------------------
    closeall
----------------------------------------------------------------------------- */
static void closeall()
{
    int i;

    for (i = getdtablesize() - 1; i >= 0; i--) close(i);
    open("/dev/null", O_RDWR, 0);
    dup(0);
    dup(0);
    return;
}


/* -----------------------------------------------------------------------------
    load_kext
----------------------------------------------------------------------------- */
static u_long load_kext(char *kext)
{
    int pid;

    if ((pid = fork()) < 0)
        return 1;

    if (pid == 0) {
        closeall();
        // PPP kernel extension not loaded, try load it...
        execl("/sbin/kextload", "kextload", kext, (char *)0);
        exit(1);
    }

    while (waitpid(pid, 0, 0) < 0) {
        if (errno == EINTR)
            continue;
       return 1;
    }
    return 0;
}

/* ----------------------------------------------------------------------------- 
    change the preference for security associations
----------------------------------------------------------------------------- */
static int set_key_preference(int *oldval, int newval)
{
    size_t len = sizeof(int); 
    
    if (newval != 0 && newval != 1)
        return 0;	// ignore the command
    
    return sysctlbyname("net.key.prefered_oldsa", oldval, &len, &newval, sizeof(int));
}

/* ----------------------------------------------------------------------------- 
----------------------------------------------------------------------------- */
int l2tp_set_ouraddress(int fd, struct sockaddr *addr)
{
    int optlen;

    setsockopt(fd, PPPPROTO_L2TP, L2TP_OPT_OURADDRESS, addr, sizeof(*addr));
    /* get the address to retrieve the actual port used */
    optlen = sizeof(*addr);
    getsockopt(fd, PPPPROTO_L2TP, L2TP_OPT_OURADDRESS, addr, &optlen);
    return 0;
}

/* -----------------------------------------------------------------------------
    l2tpvpn_listen - called by vpnd to setup listening socket
----------------------------------------------------------------------------- */
int l2tpvpn_listen(void)
{
        
    if (listen_sockfd <= 0)
        return -1;
    
    if (!opt_noipsec) {
        vpnlog(LOG_INFO, "VPND L2TP plugin:  start racoon...\n");
        /* start racoon */
        if (start_racoon(0 /*pppbundle*/, 0 /*"racoon.l2tp"*/) < 0) {
            vpnlog(LOG_ERR, "VPND L2TP plugin: cannot start racoon...\n");
            return -1;
        }
        /* XXX if we started racoon, we will need to stop it */
        /* racoon should probably provide a control API */
        need_stop_racoon = 1;
    }

    set_flag(listen_sockfd, debug, L2TP_FLAG_DEBUG);
    set_flag(listen_sockfd, 1, L2TP_FLAG_CONTROL);

    /* unknown src and dst addresses */
    any_address.sin_len = sizeof(any_address);
    any_address.sin_family = AF_INET;
    any_address.sin_port = 0;
    any_address.sin_addr.s_addr = INADDR_ANY;
    
    /* bind the socket in the kernel with L2TP port */
    listen_address.sin_len = sizeof(listen_address);
    listen_address.sin_family = AF_INET;
    listen_address.sin_port = L2TP_UDP_PORT;
    listen_address.sin_addr.s_addr = INADDR_ANY;
    l2tp_set_ouraddress(listen_sockfd, (struct sockaddr *)&listen_address);
    our_address = listen_address;

    /* add security policies */
    if (!opt_noipsec) { 
        if (configure_racoon(&our_address, &any_address, 0, IPPROTO_UDP, opt_ipsecsharedsecret, opt_ipsecsharedsecrettype)
            || require_secure_transport((struct sockaddr *)&any_address, (struct sockaddr *)&listen_address, IPPROTO_UDP, "in"))  {
            vpnlog(LOG_ERR, "VPND L2TP plugin: cannot configure secure transport...\n");
            return -1;
        }
        /* set IPSec Key management to prefer most recent key */
        if (set_key_preference(&key_preference, 0))
            vpnlog(LOG_ERR, "VPND L2TP plugin: cannot set IPSec Key management preference (error %d)\n", errno);

        secure_transport = 1;
    }

    return listen_sockfd;
}


/* -----------------------------------------------------------------------------
    l2tpvpn_accept
----------------------------------------------------------------------------- */
int l2tpvpn_accept(void) 
{

    u_int8_t			recv_buf[1500];
    int				addrlen;
    struct sockaddr_in6		from;
    int 			newSockfd; 
    
    /* we should check if there are too many call from the same IP address 
    in the last xxx minutes, proving a denial of service attack */

    while((newSockfd = socket(PF_PPP, SOCK_DGRAM, PPPPROTO_L2TP)) < 0)
        if (errno != EINTR) {
            vpnlog(LOG_ERR, "VPND L2TP plugin: Unable to open L2TP socket during accept\n");
            return -1;
        }
    
    /* accept the call. it will copy the data to the new socket */
    //set_flag(newSockfd, 1, L2TP_FLAG_DEBUG);
    setsockopt(newSockfd, PPPPROTO_L2TP, L2TP_OPT_ACCEPT, 0, 0);
    
    /* read the duplicated SCCRQ from the listen socket and ignore for now */
    if (l2tp_sys_recvfrom(listen_sockfd, recv_buf, 1500, MSG_DONTWAIT, (struct sockaddr*)&from, &addrlen) < 0)
        return -1;
    
    return newSockfd;
}


/* -----------------------------------------------------------------------------
    l2tpvpn_refuse - called by vpnd to refuse an incomming connection.
        return values: 	 -1 		error
                         socket#	launch pppd with next server address  
                         0 			handled, do nothing
                        
----------------------------------------------------------------------------- */
int l2tpvpn_refuse(void) 
{
    u_int8_t			recv_buf[1500];
    int				addrlen;
    struct sockaddr_in6		from;    
    int 			newSockfd; 
    
    /* we should check if there are too many call from the same IP address 
    in the last xxx minutes, proving a denial of service attack */

    /* need t read the packet to empty the socket buffer */
    while((newSockfd = socket(PF_PPP, SOCK_DGRAM, PPPPROTO_L2TP)) < 0)
        if (errno != EINTR) {
            vpnlog(LOG_ERR, "VPND L2TP plugin: Unable to open L2TP socket during refuse\n");
            return -1;
        }
    
    /* accept the call. it will copy the data to the new socket */
    setsockopt(newSockfd, PPPPROTO_L2TP, L2TP_OPT_ACCEPT, 0, 0);
    /* and close it right away */
    close(newSockfd);
    
    /* read the duplicated SCCRQ from the listen socket and ignore for now */
    if (l2tp_sys_recvfrom(listen_sockfd, recv_buf, 1500, MSG_DONTWAIT, (struct sockaddr*)&from, &addrlen) < 0)
        return -1;
    
    return 0;
}

/* -----------------------------------------------------------------------------
    l2tpvpn_close
----------------------------------------------------------------------------- */
void l2tpvpn_close(void)
{

    if (listen_sockfd != -1) {
        while (close(listen_sockfd) < 0)
            if (errno == EINTR)
                continue;
        listen_sockfd = -1;
    }

    /* remove security policies */
    if (secure_transport) {            
        cleanup_racoon(&our_address, &any_address);
        remove_secure_transport((struct sockaddr *)&any_address, (struct sockaddr *)&listen_address, IPPROTO_UDP, "in");            
        /* restore IPSec Key management preference */
        if (set_key_preference(0, key_preference))
            vpnlog(LOG_ERR, "VPND L2TP plugin: cannot reset IPSec Key management preference (error %d)\n", errno);
    }

    if (need_stop_racoon) {
        need_stop_racoon = 0;
        // let racoon running
        //stop_racoon();
    }

}



