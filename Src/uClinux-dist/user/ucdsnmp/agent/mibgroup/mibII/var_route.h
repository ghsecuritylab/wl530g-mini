/*
 *  Template MIB group interface - var_route.h
 *
 */
#ifndef _MIBGROUP_VAR_ROUTE_H
#define _MIBGROUP_VAR_ROUTE_H

config_require(mibII/ip util_funcs)
config_arch_require(solaris2, kernel_sunos5)

void init_var_route (void);
#ifdef RTENTRY_4_4
struct radix_node;
void load_rtentries (struct radix_node *);
#endif
#if defined(freebsd2) || defined(netbsd1) || defined(bsdi2) || defined(openbsd2)
struct sockaddr_in *klgetsa (struct sockaddr_in *);
#endif

extern FindVarMethod var_ipRouteEntry;

#endif /* _MIBGROUP_VAR_ROUTE_H */
