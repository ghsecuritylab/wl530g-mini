#ifndef _SNMP_H_
#define _SNMP_H_

/*
 * Definitions for the Simple Network Management Protocol (RFC 1067).
 *
 */
/**********************************************************************
 *
 *           Copyright 1997 by Carnegie Mellon University
 * 
 *                       All Rights Reserved
 * 
 * Permission to use, copy, modify, and distribute this software and its
 * documentation for any purpose and without fee is hereby granted,
 * provided that the above copyright notice appear in all copies and that
 * both that copyright notice and this permission notice appear in
 * supporting documentation, and that the name of CMU not be
 * used in advertising or publicity pertaining to distribution of the
 * software without specific, written prior permission.
 * 
 * CMU DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
 * ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
 * CMU BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
 * ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
 * WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
 * ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
 * SOFTWARE.
 * 
 * $Id: snmp.h,v 1.13 1998/04/04 01:43:42 kostas Exp $
 * 
 **********************************************************************/

#if HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#if HAVE_NETINET_IN_H
#include <netinet/in.h>
#endif

/* These come first */
#include "asn1.h"
#include "snmp_error.h"
#if 0
#include "mibii.h"
#include "snmp_extra.h"
#include "snmp_dump.h"
#endif

/* I didn't touch this */
#include "snmp_session.h"

/* The various modules */
#include "snmp_vars.h"
#include "snmp_pdu.h"
#include "snmp_msg.h"

/* Other functions */
#include "snmp_coexist.h"
#include "version.h"
#include "snmp_error.h"
#include "snmp_api_error.h"
/* Other stuff I didn't touch */
#include "snmp_impl.h"
#include "snmp_api.h"
#if 0
#include "snmp_client.h"
#include "mib.h"
#endif
#include "snmp-internal.h"
#include "parse.h"
#include "snmp_compat.h"
#include "snmp_debug.h"

#endif /* _SNMP_H_ */
