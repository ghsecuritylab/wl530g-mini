/*
 * Please do not edit this file.
 * It was generated using rpcgen.
 */

#ifndef _L2TP_EVENT_RPC_H_RPCGEN
#define _L2TP_EVENT_RPC_H_RPCGEN

#include <rpc/rpc.h>

#include <pthread.h>

#ifdef __cplusplus
extern "C" {
#endif


struct l2tp_session_ppp_updown_ind_1_argument {
	uint16_t tunnel_id;
	uint16_t session_id;
	int unit;
	bool_t up;
};
typedef struct l2tp_session_ppp_updown_ind_1_argument l2tp_session_ppp_updown_ind_1_argument;

struct l2tp_session_ppp_status_ind_1_argument {
	uint16_t tunnel_id;
	uint16_t session_id;
	int result;
};
typedef struct l2tp_session_ppp_status_ind_1_argument l2tp_session_ppp_status_ind_1_argument;

struct l2tp_session_ppp_accm_ind_1_argument {
	uint16_t tunnel_id;
	uint16_t session_id;
	uint32_t send_accm;
	uint32_t recv_accm;
};
typedef struct l2tp_session_ppp_accm_ind_1_argument l2tp_session_ppp_accm_ind_1_argument;

#define L2TP_EVENT_PROG 0x206b6c7a
#define L2TP_EVENT_VERSION 1

#if defined(__STDC__) || defined(__cplusplus)
#define L2TP_SESSION_PPP_UPDOWN_IND 1
extern  enum clnt_stat l2tp_session_ppp_updown_ind_1(uint16_t , uint16_t , int , bool_t , void *, CLIENT *);
extern  bool_t l2tp_session_ppp_updown_ind_1_svc(uint16_t , uint16_t , int , bool_t , void *, struct svc_req *);
#define L2TP_SESSION_PPP_STATUS_IND 2
extern  enum clnt_stat l2tp_session_ppp_status_ind_1(uint16_t , uint16_t , int , void *, CLIENT *);
extern  bool_t l2tp_session_ppp_status_ind_1_svc(uint16_t , uint16_t , int , void *, struct svc_req *);
#define L2TP_SESSION_PPP_ACCM_IND 3
extern  enum clnt_stat l2tp_session_ppp_accm_ind_1(uint16_t , uint16_t , uint32_t , uint32_t , void *, CLIENT *);
extern  bool_t l2tp_session_ppp_accm_ind_1_svc(uint16_t , uint16_t , uint32_t , uint32_t , void *, struct svc_req *);
extern int l2tp_event_prog_1_freeresult (SVCXPRT *, xdrproc_t, caddr_t);

#else /* K&R C */
#define L2TP_SESSION_PPP_UPDOWN_IND 1
extern  enum clnt_stat l2tp_session_ppp_updown_ind_1();
extern  bool_t l2tp_session_ppp_updown_ind_1_svc();
#define L2TP_SESSION_PPP_STATUS_IND 2
extern  enum clnt_stat l2tp_session_ppp_status_ind_1();
extern  bool_t l2tp_session_ppp_status_ind_1_svc();
#define L2TP_SESSION_PPP_ACCM_IND 3
extern  enum clnt_stat l2tp_session_ppp_accm_ind_1();
extern  bool_t l2tp_session_ppp_accm_ind_1_svc();
extern int l2tp_event_prog_1_freeresult ();
#endif /* K&R C */

/* the xdr functions */

#if defined(__STDC__) || defined(__cplusplus)
extern  bool_t xdr_l2tp_session_ppp_updown_ind_1_argument (XDR *, l2tp_session_ppp_updown_ind_1_argument*);
extern  bool_t xdr_l2tp_session_ppp_status_ind_1_argument (XDR *, l2tp_session_ppp_status_ind_1_argument*);
extern  bool_t xdr_l2tp_session_ppp_accm_ind_1_argument (XDR *, l2tp_session_ppp_accm_ind_1_argument*);

#else /* K&R C */
extern bool_t xdr_l2tp_session_ppp_updown_ind_1_argument ();
extern bool_t xdr_l2tp_session_ppp_status_ind_1_argument ();
extern bool_t xdr_l2tp_session_ppp_accm_ind_1_argument ();

#endif /* K&R C */

#ifdef __cplusplus
}
#endif

#endif /* !_L2TP_EVENT_RPC_H_RPCGEN */
