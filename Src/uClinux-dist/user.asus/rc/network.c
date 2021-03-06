/*
 * Network services
 *
 * Copyright 2004, Broadcom Corporation
 * All Rights Reserved.
 * 
 * THIS SOFTWARE IS OFFERED "AS IS", AND BROADCOM GRANTS NO WARRANTIES OF ANY
 * KIND, EXPRESS OR IMPLIED, BY STATUTE, COMMUNICATION OR OTHERWISE. BROADCOM
 * SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A SPECIFIC PURPOSE OR NONINFRINGEMENT CONCERNING THIS SOFTWARE.
 *
 * $Id$
 */

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <syslog.h>															
#include <ctype.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <net/if.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <net/if_arp.h>
#include <signal.h>

#include <bcmnvram.h>
#include <netconf.h>
#include <shutils.h>
#include <wlutils.h>
#include <nvparse.h>
#include <rc.h>
#include <bcmutils.h>

static int
add_routes(char *prefix, char *var, char *ifname)
{
	char word[80], *next;
	char *ipaddr, *netmask, *gateway, *metric;
	char tmp[100];

	foreach(word, nvram_safe_get(strcat_r(prefix, var, tmp)), next) {

		netmask = word;
		ipaddr = strsep(&netmask, ":");
		if (!ipaddr || !netmask)
			continue;
		gateway = netmask;
		netmask = strsep(&gateway, ":");
		if (!netmask || !gateway)
			continue;
		metric = gateway;
		gateway = strsep(&metric, ":");
		if (!gateway || !metric)
			continue;

		dprintf("\n\n\nadd %s %d %s %s %s\n\n\n", ifname, atoi(metric), ipaddr, gateway, netmask);
		
		route_add(ifname, atoi(metric) + 1, ipaddr, gateway, netmask);
	}

	return 0;
}

static int
del_routes(char *prefix, char *var, char *ifname)
{
	char word[80], *next;
	char *ipaddr, *netmask, *gateway, *metric;
	char tmp[100];
	
	foreach(word, nvram_safe_get(strcat_r(prefix, var, tmp)), next) {
		dprintf("add %s\n", word);
		
		netmask = word;
		ipaddr = strsep(&netmask, ":");
		if (!ipaddr || !netmask)
			continue;
		gateway = netmask;
		netmask = strsep(&gateway, ":");
		if (!netmask || !gateway)
			continue;
		metric = gateway;
		gateway = strsep(&metric, ":");
		if (!gateway || !metric)
			continue;
		
		dprintf("add %s\n", ifname);
		
		route_del(ifname, atoi(metric) + 1, ipaddr, gateway, netmask);
	}

	return 0;
}

static int
add_lan_routes(char *lan_ifname)
{
	return add_routes("lan_", "route", lan_ifname);
}

static int
del_lan_routes(char *lan_ifname)
{
	return del_routes("lan_", "route", lan_ifname);
}

void
start_lan(void)
{
	char *lan_ifname = nvram_safe_get("lan_ifname");
	char name[80], *next;
	int s;
	struct ifreq ifr;

	dprintf("%s\n", lan_ifname);

 	/* Bring up bridged interfaces */
	if (strncmp(lan_ifname, "br", 2) == 0) {
		eval("brctl", "addbr", lan_ifname);
		eval("brctl", "setfd", lan_ifname, "0");
		if (nvram_match("router_disable", "1") || nvram_match("lan_stp", "0"))
			eval("brctl", "stp", lan_ifname, "dis");
#ifdef ASUS_EXT
		foreach(name, nvram_safe_get("lan_ifnames_t"), next) {
#else
		foreach(name, nvram_safe_get("lan_ifnames"), next) {
#endif
			/* Bring up interface */
			ifconfig(name, IFUP, NULL, NULL);
			/* Set the logical bridge address to that of the first interface */
			if ((s = socket(AF_INET, SOCK_RAW, IPPROTO_RAW)) < 0)
				continue;
			strncpy(ifr.ifr_name, lan_ifname, IFNAMSIZ);
			if (ioctl(s, SIOCGIFHWADDR, &ifr) == 0 &&
			    memcmp(ifr.ifr_hwaddr.sa_data, "\0\0\0\0\0\0", ETHER_ADDR_LEN) == 0) {
				strncpy(ifr.ifr_name, name, IFNAMSIZ);
				if (ioctl(s, SIOCGIFHWADDR, &ifr) == 0) {
					strncpy(ifr.ifr_name, lan_ifname, IFNAMSIZ);
					ifr.ifr_hwaddr.sa_family = ARPHRD_ETHER;
					ioctl(s, SIOCSIFHWADDR, &ifr);
				}
			}
			close(s);

#ifdef ASUS_EXT
			eval("brctl", "addif", lan_ifname, name);
#else
			/* If not a wl i/f then simply add it to the bridge */
			if (eval("wlconf", name, "up"))
				eval("brctl", "addif", lan_ifname, name);
			else {
				/* get the instance number of the wl i/f */
				char wl_name[] = "wlXXXXXXXXXX_mode";
				int unit;
#ifdef ASUS_EXT
				sync_mac(name, nvram_safe_get("et0macaddr"));
#endif
				wl_ioctl(name, WLC_GET_INSTANCE, &unit, sizeof(unit));
				snprintf(wl_name, sizeof(wl_name), "wl%d_mode", unit);
				/* Receive all multicast frames in WET mode */
				if (nvram_match(wl_name, "wet"))
					ifconfig(name, IFUP | IFF_ALLMULTI, NULL, NULL);
				/* Do not attach the main wl i/f if in wds mode */
				if (nvram_invmatch(wl_name, "wds"))
					eval("brctl", "addif", lan_ifname, name);
			}
#endif
		}
#ifdef WDS
		if (nvram_invmatch("wl_wdsapply_x", "0"))
		{
			int count;
			char wdsif[32];

			for(count=0;count<atoi(nvram_safe_get("wl_wdsnum_x"));count++)
			{
				sprintf(wdsif, "wlan0wds%d", count);
				eval("brctl","addif","br0", wdsif);
				eval("ifconfig", wdsif,"up");
			}
		}
#endif
	}
#ifdef REMOVE
	/* specific non-bridged lan i/f */
	else if (strcmp(lan_ifname, "")) {
		/* Bring up interface */
		ifconfig(lan_ifname, IFUP, NULL, NULL);
		/* config wireless i/f */
		if (!eval("wlconf", lan_ifname, "up")) {
			char tmp[100], prefix[] = "wanXXXXXXXXXX_";
			int unit;
			/* get the instance number of the wl i/f */
			wl_ioctl(lan_ifname, WLC_GET_INSTANCE, &unit, sizeof(unit));
			snprintf(prefix, sizeof(prefix), "wl%d_", unit);
			/* Receive all multicast frames in WET mode */
			if (nvram_match(strcat_r(prefix, "mode", tmp), "wet"))
				ifconfig(lan_ifname, IFUP | IFF_ALLMULTI, NULL, NULL);
		}
	}
#endif

	/* Get current LAN hardware address */
	if ((s = socket(AF_INET, SOCK_RAW, IPPROTO_RAW)) >= 0) {
		char eabuf[32];
		strncpy(ifr.ifr_name, lan_ifname, IFNAMSIZ);
		if (ioctl(s, SIOCGIFHWADDR, &ifr) == 0)
			nvram_set("lan_hwaddr", ether_etoa(ifr.ifr_hwaddr.sa_data, eabuf));
		close(s);
	}


#ifdef ASUS_EXT
	/* 
	* Configure DHCP connection. The DHCP client will run 
	* 'udhcpc bound'/'udhcpc deconfig' upon finishing IP address 
	* renew and release.
	*/
	if (nvram_match("router_disable", "1"))
	{
		if (nvram_match("lan_proto_x", "1")) 
		{
			char *dhcp_argv[] = { "udhcpc",
					      "-i", lan_ifname,
					      "-p", "/var/run/udhcpc_lan.pid",
					      "-s", "/tmp/landhcpc",
					      NULL
			};
			pid_t pid;

			symlink("/sbin/rc", "/tmp/landhcpc");

			/* Start dhcp daemon */
			_eval(dhcp_argv, NULL, 0, &pid);
		}
		else
		{
			/* Bring up and configure LAN interface */
			ifconfig(lan_ifname, IFUP,
		 		nvram_safe_get("lan_ipaddr"), nvram_safe_get("lan_netmask"));
			lan_up(lan_ifname);
		}
	}
	else
	{
		/* Bring up and configure LAN interface */
		ifconfig(lan_ifname, IFUP,
		 	nvram_safe_get("lan_ipaddr"), nvram_safe_get("lan_netmask"));
		/* Install lan specific static routes */
		add_lan_routes(lan_ifname);

		update_lan_status(1);
	}
#else
	/* Bring up and configure LAN interface */
	ifconfig(lan_ifname, IFUP,
		 nvram_safe_get("lan_ipaddr"), nvram_safe_get("lan_netmask"));

	/* Install lan specific static routes */
	add_lan_routes(lan_ifname);
#endif

#ifndef ASUS_EXT
	/* Start syslogd if either log_ipaddr or log_ram_enable is set */
	if (nvram_invmatch("log_ipaddr", "") || nvram_match("log_ram_enable", "1")) {
		char *argv[] = {
			"syslogd",
			NULL, 		/* -C */
			NULL, NULL,	/* -R host */
			NULL
		};
		int pid;
		int argc = 1;
		
		if (nvram_match("log_ram_enable", "1")) {
			argv[argc++] = "-C";
		}
		else if (!nvram_match("log_ram_enable", "0")) {
			nvram_set("log_ram_enable", "0");
		}
				
		if (nvram_invmatch("log_ipaddr", "")) {
			argv[argc++] = "-R";
			argv[argc++] = nvram_get("log_ipaddr");
		}

		_eval(argv, NULL, 0, &pid);
	}
#endif

	dprintf("%s %s\n",
		nvram_safe_get("lan_ipaddr"),
		nvram_safe_get("lan_netmask"));
}

void
stop_lan(void)
{
	char *lan_ifname = nvram_safe_get("lan_ifname");
	char name[80], *next;

	dprintf("%s\n", lan_ifname);

	/* Stop the syslogd daemon */
	eval("killall", "syslogd");

	/* Remove static routes */
	del_lan_routes(lan_ifname);

	/* Bring down LAN interface */
	ifconfig(lan_ifname, 0, NULL, NULL);

	/* Bring down bridged interfaces */
	if (strncmp(lan_ifname, "br", 2) == 0) {
#ifdef ASUS_EXT
		foreach(name, nvram_safe_get("lan_ifnames_t"), next) {
#else
		foreach(name, nvram_safe_get("lan_ifnames"), next) {
#endif
			eval("wlconf", name, "down");
			ifconfig(name, 0, NULL, NULL);
			eval("brctl", "delif", lan_ifname, name);
		}
		eval("brctl", "delbr", lan_ifname);
	}
	/* Bring down specific interface */
	else if (strcmp(lan_ifname, ""))
		eval("wlconf", lan_ifname, "down");
	
	dprintf("done\n");
}

static int
wan_prefix(char *ifname, char *prefix)
{
	int unit;
	
	if ((unit = wan_ifunit(ifname)) < 0)
		return -1;

	sprintf(prefix, "wan%d_", unit);
	return 0;
}

static int
add_wan_routes(char *wan_ifname)
{
	char prefix[] = "wanXXXXXXXXXX_";

	/* Figure out nvram variable name prefix for this i/f */
	if (wan_prefix(wan_ifname, prefix) < 0)
		return -1;

	return add_routes(prefix, "route", wan_ifname);
}

static int
del_wan_routes(char *wan_ifname)
{
	char prefix[] = "wanXXXXXXXXXX_";

	/* Figure out nvram variable name prefix for this i/f */
	if (wan_prefix(wan_ifname, prefix) < 0)
		return -1;

	return del_routes(prefix, "route", wan_ifname);
}

int
wan_valid(char *ifname)
{
	char name[80], *next;
	
	foreach(name, nvram_safe_get("wan_ifnames"), next)
		if (ifname && !strcmp(ifname, name))
			return 1;
	return 0;
}

void
start_wan(void)
{
	char *wan_ifname;
	char *wan_proto;
	int unit;
	char tmp[100], prefix[] = "wanXXXXXXXXXX_";
	char eabuf[32];
	int s;
	struct ifreq ifr;
	pid_t pid;

	/* check if we need to setup WAN */
	if (nvram_match("router_disable", "1"))
		return;

#ifdef ASUS_EXT
	update_wan_status(0);
	/* start connection independent firewall */
	//start_firewall_prev_ex();
	start_firewall();
#else
	/* start connection independent firewall */
	start_firewall();
#endif

	/* Create links */
	mkdir("/tmp/ppp", 0777);
	symlink("/sbin/rc", "/tmp/ppp/ip-up");
	symlink("/sbin/rc", "/tmp/ppp/ip-down");	
	symlink("/sbin/rc", "/tmp/udhcpc");

	//symlink("/dev/null", "/tmp/ppp/connect-errors");

	/* Start each configured and enabled wan connection and its undelying i/f */
	for (unit = 0; unit < MAX_NVPARSE; unit ++) 
	{
#ifdef ASUS_EXT // Only multiple pppoe is allowed 
		if (unit>0 && nvram_invmatch("wan_proto", "pppoe")) break;
#endif

		snprintf(prefix, sizeof(prefix), "wan%d_", unit);

		/* make sure the connection exists and is enabled */ 
		wan_ifname = nvram_get(strcat_r(prefix, "ifname", tmp));
		if (!wan_ifname)
			continue;
		wan_proto = nvram_get(strcat_r(prefix, "proto", tmp));
		if (!wan_proto || !strcmp(wan_proto, "disabled"))
			continue;

		/* disable the connection if the i/f is not in wan_ifnames */
		if (!wan_valid(wan_ifname)) {
			nvram_set(strcat_r(prefix, "proto", tmp), "disabled");
			continue;
		}

		dprintf("%s %s\n", wan_ifname, wan_proto);

		/* Set i/f hardware address before bringing it up */
		if ((s = socket(AF_INET, SOCK_RAW, IPPROTO_RAW)) < 0)
			continue;
		strncpy(ifr.ifr_name, wan_ifname, IFNAMSIZ);

		/* Since WAN interface may be already turned up (by vlan.c),
		   if WAN hardware address is specified (and different than the current one),
		   we need to make it down for synchronizing hwaddr. */
		if (ioctl(s, SIOCGIFHWADDR, &ifr)) {
			close(s);
			continue;
		}
		ether_atoe(nvram_safe_get(strcat_r(prefix, "hwaddr", tmp)), eabuf);
		if (bcmp(eabuf, ifr.ifr_hwaddr.sa_data, ETHER_ADDR_LEN))
		{
			/* current hardware address is different than user specified */
			ifconfig(wan_ifname, 0, NULL, NULL);
		}

		/* Configure i/f only once, specially for wireless i/f shared by multiple connections */
		if (ioctl(s, SIOCGIFFLAGS, &ifr)) {
			close(s);
			continue;
		}
		if (!(ifr.ifr_flags & IFF_UP)) {
			/* Sync connection nvram address and i/f hardware address */
			memset(ifr.ifr_hwaddr.sa_data, 0, ETHER_ADDR_LEN);
			if (!nvram_invmatch(strcat_r(prefix, "hwaddr", tmp), "") ||
			    !ether_atoe(nvram_safe_get(strcat_r(prefix, "hwaddr", tmp)), ifr.ifr_hwaddr.sa_data) ||
			    !memcmp(ifr.ifr_hwaddr.sa_data, "\0\0\0\0\0\0", ETHER_ADDR_LEN)) {
				if (ioctl(s, SIOCGIFHWADDR, &ifr)) {
					close(s);
					continue;
				}
				nvram_set(strcat_r(prefix, "hwaddr", tmp), ether_etoa(ifr.ifr_hwaddr.sa_data, eabuf));
			}
			else {
				ifr.ifr_hwaddr.sa_family = ARPHRD_ETHER;
				ioctl(s, SIOCSIFHWADDR, &ifr);
			}

			/* Bring up i/f */
			ifconfig(wan_ifname, IFUP, NULL, NULL);

#ifdef BRCM
			/* do wireless specific config */
			eval("wlconf", wan_ifname, "up");
#endif
		}
	
		close(s);

#ifndef ASUS_EXT
		if (strcmp(wan_proto, "pppoe")==0)
		{
		
		}
		else if (strcmp(wan_proto, "pptp")==0) 
		{
			start_pptp(prefix);
		}
#else
		if (unit==0) 
		{		
			FILE *fp;

			setup_ethernet(nvram_safe_get("wan_ifname"));
			start_pppoe_relay(nvram_safe_get("wan_ifname"));


			/* Enable Forwarding */
			if ((fp = fopen("/proc/sys/net/ipv4/ip_forward", "r+"))) 			{
				fputc('1', fp);
				fclose(fp);
			} else
			{	
				perror("/proc/sys/net/ipv4/ip_forward");
			}
		}

		if ((nvram_match("wan_proto", "pppoe") || 
( nvram_match("wan_proto", "pptp"))
#ifdef DHCP_PPTP
&& nvram_invmatch(strcat_r(prefix, "pppoe_gateway", tmp), ""))
#endif
) 
		{

			int demand = atoi(nvram_safe_get(strcat_r(prefix, "pppoe_idletime", tmp)));
			/* update demand option */
			nvram_set(strcat_r(prefix, "pppoe_demand", tmp), demand ? "1" : "0");
			/* Bring up  WAN interface */
			if (strcmp(wan_proto, "pptp") == 0) {
				ifconfig(wan_ifname, IFUP, 
					nvram_safe_get(strcat_r(prefix, "pppoe_ipaddr", tmp)), 
					nvram_safe_get(strcat_r(prefix, "pppoe_netmask", tmp)));

				/* add pptp server route */
				if (nvram_invmatch("wan_heartbeat_x", "")) {
					route_add(wan_ifname, 0, nvram_safe_get("wan_heartbeat_x"),
						nvram_get(strcat_r(prefix, "pppoe_gateway", tmp)), "255.255.255.255");
				} else {
					route_add(wan_ifname, 0, nvram_safe_get(strcat_r(prefix, "pppoe_gateway", tmp)),
						NULL, "255.255.255.255");
				}
 
		 	} else {
		 		/* do not use safe_get here, values are optional */
				ifconfig(wan_ifname, IFUP, 
					nvram_get("wan_ipaddr"), 
					nvram_get("wan_netmask"));
		 	}
		 	
		 	/* setup static wan routes via physical device */
			add_routes("wan_", "route", wan_ifname);
			
			start_pppd(prefix);

			/* ppp interface name is referenced from this point on */
			wan_ifname = nvram_safe_get(strcat_r(prefix, "pppoe_ifname", tmp));
			
			/* Pretend that the WAN interface is up */
			if (nvram_match(strcat_r(prefix, "pppoe_demand", tmp), "1")) 
			{
				int timeout = 5;
				/* Wait for pppx to be created */
				while (ifconfig(wan_ifname, IFUP, NULL, NULL) && timeout--)
					sleep(1);

				/* Retrieve IP info */
				if ((s = socket(AF_INET, SOCK_RAW, IPPROTO_RAW)) < 0)
					continue;
				strncpy(ifr.ifr_name, wan_ifname, IFNAMSIZ);

				/* Set temporary IP address */
				if (ioctl(s, SIOCGIFADDR, &ifr))
					perror(wan_ifname);

				nvram_set(strcat_r(prefix, "ipaddr", tmp), inet_ntoa(sin_addr(&ifr.ifr_addr)));
				nvram_set(strcat_r(prefix, "netmask", tmp), "255.255.255.255");

				/* Set temporary P-t-P address */
				if (ioctl(s, SIOCGIFDSTADDR, &ifr))
					perror(wan_ifname);
				nvram_set(strcat_r(prefix, "gateway", tmp), inet_ntoa(sin_addr(&ifr.ifr_dstaddr)));

				close(s);

				/* 
				* Preset routes so that traffic can be sent to proper pppx even before 
				* the link is brought up.
				*/
				preset_wan_routes(wan_ifname);
			}
		
		}
#ifdef REMOVE
		/* 
		* Configure PPPoE connection. The PPPoE client will run 
		* ip-up/ip-down scripts upon link's connect/disconnect.
		*/
		if (strcmp(wan_proto, "pppoe") == 0) {
			char *pppoe_argv[] = { "pppoecd",
					       nvram_safe_get(strcat_r(prefix, "ifname", tmp)),
					       "-u", nvram_safe_get(strcat_r(prefix, "pppoe_username", tmp)),
					       "-p", nvram_safe_get(strcat_r(prefix, "pppoe_passwd", tmp)),
					       "-r", nvram_safe_get(strcat_r(prefix, "pppoe_mru", tmp)),
					       "-t", nvram_safe_get(strcat_r(prefix, "pppoe_mtu", tmp)),
					       "-i", nvram_match(strcat_r(prefix, "pppoe_demand", tmp), "1") ?
					       		nvram_safe_get(strcat_r(prefix, "pppoe_idletime", tmp)) : "0",
#ifdef ASUS_EXT
						"-I", "30",
						"-T", "3",
						"-N", "5",
#endif
					       NULL, NULL,	/* pppoe_service */
					       NULL, NULL,	/* pppoe_ac */
					       NULL,		/* pppoe_keepalive */
					       NULL, NULL,	/* ppp unit requested */
					       NULL
			}, **arg;
			int timeout = 5;
			char pppunit[] = "XXXXXXXXXXXX";

			/* Add optional arguments */

			for (arg = pppoe_argv; *arg; arg++);

#ifdef ASUS_EXT
			if (nvram_invmatch(strcat_r(prefix, "pppoe_txonly_x", tmp), "0")) {
				*arg++ = "-o";
			}
#endif
			if (nvram_invmatch(strcat_r(prefix, "pppoe_service", tmp), "")) {
				*arg++ = "-s";
				*arg++ = nvram_safe_get(strcat_r(prefix, "pppoe_service", tmp));
			}
			if (nvram_invmatch(strcat_r(prefix, "pppoe_ac", tmp), "")) {
				*arg++ = "-a";
				*arg++ = nvram_safe_get(strcat_r(prefix, "pppoe_ac", tmp));
			}

#ifndef ASUS_EXT	// keep alive anyway
			if (nvram_match(strcat_r(prefix, "pppoe_demand", tmp), "1") || 
			    nvram_match(strcat_r(prefix, "pppoe_keepalive", tmp), "1"))
#endif
				*arg++ = "-k";
			snprintf(pppunit, sizeof(pppunit), "%d", unit);
			*arg++ = "-U";
			*arg++ = pppunit;

			/* launch pppoe client daemon */
			_eval(pppoe_argv, NULL, 0, &pid);

			/* ppp interface name is referenced from this point on */

			wan_ifname = nvram_safe_get(strcat_r(prefix, "pppoe_ifname", tmp));
			
			/* Pretend that the WAN interface is up */
			if (nvram_match(strcat_r(prefix, "pppoe_demand", tmp), "1")) {
				/* Wait for pppx to be created */
				while (ifconfig(wan_ifname, IFUP, NULL, NULL) && timeout--)
					sleep(1);

				/* Retrieve IP info */
				if ((s = socket(AF_INET, SOCK_RAW, IPPROTO_RAW)) < 0)
					continue;
				strncpy(ifr.ifr_name, wan_ifname, IFNAMSIZ);

				/* Set temporary IP address */
				if (ioctl(s, SIOCGIFADDR, &ifr))
					perror(wan_ifname);
				nvram_set(strcat_r(prefix, "ipaddr", tmp), inet_ntoa(sin_addr(&ifr.ifr_addr)));
				nvram_set(strcat_r(prefix, "netmask", tmp), "255.255.255.255");

				/* Set temporary P-t-P address */
				if (ioctl(s, SIOCGIFDSTADDR, &ifr))
					perror(wan_ifname);
				nvram_set(strcat_r(prefix, "gateway", tmp), inet_ntoa(sin_addr(&ifr.ifr_dstaddr)));

				close(s);

				/* 
				* Preset routes so that traffic can be sent to proper pppx even before 
				* the link is brought up.
				*/


				preset_wan_routes(wan_ifname);
			}
		}
#endif
#endif
		/* 
		* Configure DHCP connection. The DHCP client will run 
		* 'udhcpc bound'/'udhcpc deconfig' upon finishing IP address 
		* renew and release.
		*/
		else if (strcmp(wan_proto, "dhcp") == 0 ||
			 strcmp(wan_proto, "bigpond") ==0 
#ifdef DHCP_PPTP
|| (strcmp(wan_proto, "pptp")==0 && nvram_match(strcat_r(prefix, "pppoe_gateway", tmp), ""))		
#endif
) {
			char *wan_hostname = nvram_get(strcat_r(prefix, "hostname", tmp));
			char *dhcp_argv[] = { "udhcpc",
					      "-i", wan_ifname,
					      "-p", "/var/run/udhcpc0.pid",
					      "-s", "/tmp/udhcpc",
					      wan_hostname && *wan_hostname ? "-H" : NULL,
					      wan_hostname && *wan_hostname ? wan_hostname : NULL,
					      NULL
			};
			/* Start dhcp daemon */
			_eval(dhcp_argv, NULL, 0, &pid);
#ifdef ASUS_EXT
			wanmessage("Can not get IP from server");
#endif
		}
		/* Configure static IP connection. */
		else if (strcmp(wan_proto, "static") == 0) {
			/* Assign static IP address to i/f */
			ifconfig(wan_ifname, IFUP,
				 nvram_safe_get(strcat_r(prefix, "ipaddr", tmp)), 
				 nvram_safe_get(strcat_r(prefix, "netmask", tmp)));
			/* We are done configuration */
			wan_up(wan_ifname);
		}

		dprintf("%s %s\n",
			nvram_safe_get(strcat_r(prefix, "ipaddr", tmp)),
			nvram_safe_get(strcat_r(prefix, "netmask", tmp)));
	}

	/* Report stats */
	if (nvram_invmatch("stats_server", "")) {
		char *stats_argv[] = { "stats", nvram_get("stats_server"), NULL };
		_eval(stats_argv, NULL, 5, NULL);
	}
}

void
stop_wan(void)
{
	char name[80], *next, signal[] = "XXXX";
	
	eval("killall", "stats");
	eval("killall", "ntpclient");

	/* Shutdown and kill all possible tasks */
	eval("killall", "ip-up");
	eval("killall", "ip-down");
	snprintf(signal, sizeof(signal), "-%d", SIGHUP);
	eval("killall", signal, "pppd");
	eval("killall", "pppd");
	snprintf(signal, sizeof(signal), "-%d", SIGUSR2);
	eval("killall", signal, "udhcpc");
	eval("killall", "udhcpc");

	/* Bring down WAN interfaces */
	foreach(name, nvram_safe_get("wan_ifnames"), next)
		ifconfig(name, 0, NULL, NULL);

	/* Remove dynamically created links */
	unlink("/tmp/udhcpc");
	
	unlink("/tmp/ppp/ip-up");
	unlink("/tmp/ppp/ip-down");
	rmdir("/tmp/ppp");

	if (nvram_match("wan0_proto", "static"))
		wan_down(nvram_safe_get("wan0_ifname"));

	dprintf("done\n");
}

static int
add_ns(char *wan_ifname)
{
	FILE *fp;
	char tmp[100], prefix[] = "wanXXXXXXXXXX_";
	char word[100], *next;
	char line[100];

	/* Figure out nvram variable name prefix for this i/f */
	if (wan_prefix(wan_ifname, prefix) < 0)
		return -1;

	/* Open resolv.conf to read */
	if (!(fp = fopen("/tmp/resolv.conf", "r+"))) {
		perror("/tmp/resolv.conf");
		return errno;
	}

	/* Append only those not in the original list */
	foreach(word, nvram_safe_get(strcat_r(prefix, "dns", tmp)), next) 
	{
		fseek(fp, 0, SEEK_SET);
		while (fgets(line, sizeof(line), fp)) {
			char *token = strtok(line, " \t\n");

			if (!token || strcmp(token, "nameserver") != 0)
				continue;
			if (!(token = strtok(NULL, " \t\n")))
				continue;

			if (!strcmp(token, word))
				break;
		}
		if (feof(fp))
			fprintf(fp, "nameserver %s\n", word);
	}
	fclose(fp);

#ifdef ASUS_EXT
	stop_dns();
	start_dns();
#else
	/* notify dnsmasq */
	snprintf(tmp, sizeof(tmp), "-%d", SIGHUP);
	eval("killall", tmp, "dnsmasq");
#endif
	
	return 0;
}

static int
del_ns(char *wan_ifname)
{
	FILE *fp, *fp2;
	char tmp[100], prefix[] = "wanXXXXXXXXXX_";
	char word[100], *next;
	char line[100];

	/* Figure out nvram variable name prefix for this i/f */
	if (wan_prefix(wan_ifname, prefix) < 0)
		return -1;

	/* Open resolv.conf to read */
	if (!(fp = fopen("/tmp/resolv.conf", "r"))) {
		perror("fopen /tmp/resolv.conf");
		return errno;
	}
	/* Open resolv.tmp to save updated name server list */
	if (!(fp2 = fopen("/tmp/resolv.tmp", "w"))) {
		perror("fopen /tmp/resolv.tmp");
		fclose(fp);
		return errno;
	}
	/* Copy updated name servers */
	while (fgets(line, sizeof(line), fp)) {
		char *token = strtok(line, " \t\n");

		if (!token || strcmp(token, "nameserver") != 0)
			continue;
		if (!(token = strtok(NULL, " \t\n")))
			continue;

		foreach(word, nvram_safe_get(strcat_r(prefix, "dns", tmp)), next)
			if (!strcmp(word, token))
				break;
		if (!next)
			fprintf(fp2, "nameserver %s\n", token);
	}
	fclose(fp);
	fclose(fp2);
	/* Use updated file as resolv.conf */
	unlink("/tmp/resolv.conf");
	rename("/tmp/resolv.tmp", "/tmp/resolv.conf");

#ifdef ASUS_EXT
	stop_dns();
	start_dns();
#else	
	/* notify dnsmasq */
	snprintf(tmp, sizeof(tmp), "-%d", SIGHUP);
	eval("killall", tmp, "dnsmasq");
#endif
	
	return 0;
}

void
wan_up(char *wan_ifname)
{
	char tmp[100], tmp1[100], prefix[] = "wanXXXXXXXXXX_";
	char *wan_proto;

	/* Figure out nvram variable name prefix for this i/f */
	if (wan_prefix(wan_ifname, prefix) < 0)
		return;

	wan_proto = nvram_safe_get(strcat_r(prefix, "proto", tmp));	

	dprintf("%s %s\n", wan_ifname, wan_proto);

	/* Set default route to gateway if specified */
	if (nvram_match(strcat_r(prefix, "primary", tmp), "1"))
		route_add(wan_ifname, 0, "0.0.0.0", 
			nvram_safe_get(strcat_r(prefix, "gateway", tmp)),
			"0.0.0.0");

	/* Install interface dependent static routes */
	add_wan_routes(wan_ifname);

	/* Add dns servers to resolv.conf */
	add_ns(wan_ifname);

	/* Sync time */
	//start_ntpc();

#ifdef ASUS_EXT
	update_wan_status(1);

	if (strcmp(wan_proto, "dhcp")==0 ||
	    strcmp(wan_proto, "bigpond")==0 ||
	    strcmp(wan_proto, "pppoe")==0 ||
	    strcmp(wan_proto, "pptp")==0) 
		start_firewall();

	/* Start connection dependent firewall */
	start_firewall2(wan_ifname);
	//start_firewall_ex(wan_ifname, nvram_safe_get(strcat_r(prefix, "ipaddr", tmp)), "br0", nvram_safe_get("lan_ipaddr"));
	start_ddns();

	if (strcmp(wan_proto, "bigpond")==0) start_bpalogin();
	
#ifndef REMOVE
	if (strcmp(wan_proto, "pptp")==0)
	{
		eval("insmod", "ip_conntrack_proto_gre.o");
		eval("insmod", "ip_conntrack_pptp.o");
		eval("insmod", "ip_nat_proto_gre.o");
		eval("insmod", "ip_nat_pptp.o");	
	}
#endif
#endif

#ifdef DHCP_PPTP
	if (strcmp(wan_proto, "pptp")==0 && nvram_match(strcat_r(prefix, "pppoe_gateway", tmp), ""))
	{
		nvram_set(strcat_r(prefix, "pppoe_ipaddr", tmp), nvram_safe_get(strcat_r(prefix, "ipaddr", tmp1)));
		nvram_set(strcat_r(prefix, "pppoe_network", tmp), nvram_safe_get(strcat_r(prefix, "network", tmp1)));
		nvram_set(strcat_r(prefix, "pppoe_gateway", tmp), nvram_safe_get(strcat_r(prefix, "gateway", tmp1)));
		start_wan();
	}
#endif
	
	dprintf("done\n");
}

void
wan_down(char *wan_ifname)
{
	char tmp[100], prefix[] = "wanXXXXXXXXXX_";
	char *wan_proto;

	/* Figure out nvram variable name prefix for this i/f */
	if (wan_prefix(wan_ifname, prefix) < 0)
		return;

	wan_proto = nvram_safe_get(strcat_r(prefix, "proto", tmp));
	
	/* Remove default route to gateway if specified */
	if (nvram_match(strcat_r(prefix, "primary", tmp), "1"))
		route_del(wan_ifname, 0, "0.0.0.0", 
			nvram_safe_get(strcat_r(prefix, "gateway", tmp)),
			"0.0.0.0");

	/* Remove interface dependent static routes */
	del_wan_routes(wan_ifname);

	/* Update resolv.conf */
	del_ns(wan_ifname);

#ifdef ASUS_EXT
	update_wan_status(0);

	if (strcmp(wan_proto, "bigpond")==0) stop_bpalogin();

#ifndef REMOVE
	if (strcmp(wan_proto, "pptp")==0)
	{
		eval("rmmod", "ip_nat_pptp");
		eval("rmmod", "ip_nat_proto_gre");
		eval("rmmod", "ip_conntrack_pptp");
		eval("rmmod", "ip_conntrack_proto_gre");
	}
#endif
#endif

	dprintf("done\n");
}

#ifdef ASUS_EXT
void
lan_up(char *lan_ifname)
{
	FILE *fp;
	char word[100], *next;
	char line[100];

	/* Set default route to gateway if specified */
	route_add(lan_ifname, 0, "0.0.0.0", 
			nvram_safe_get("lan_gateway"),
			"0.0.0.0");

	/* Open resolv.conf to read */
	if (!(fp = fopen("/tmp/resolv.conf", "w"))) {
		perror("/tmp/resolv.conf");
		return errno;
	}

	if (nvram_invmatch("lan_gateway", ""))
		fprintf(fp, "nameserver %s\n", nvram_safe_get("lan_gateway"));

	foreach(word, nvram_safe_get("lan_dns"), next)
	{
		fprintf(fp, "nameserver %s\n", word);
	}
	fclose(fp);

	/* Sync time */
	//start_ntpc();

	update_lan_status(1);
}

void
lan_down(char *lan_ifname)
{
	/* Remove default route to gateway if specified */
	route_del(lan_ifname, 0, "0.0.0.0", 
			nvram_safe_get("lan_gateway"),
			"0.0.0.0");

	/* remove resolv.conf */
	unlink("/tmp/resolv.conf");

	update_lan_status(0);
}
#endif

#ifdef REMOVE
static int
notify_nas(char *type, char *ifname, char *action)
{
	char *argv[] = {"nas4not", type, ifname, action, 
			NULL,	/* role */
			NULL,	/* crypto */
			NULL,	/* auth */
			NULL,	/* passphrase */
			NULL,	/* ssid */
			NULL};
	char *str = NULL;
	int retries = 10;
	char tmp[100], prefix[] = "wlXXXXXXXXXX_";
	int unit;
	char remote[ETHER_ADDR_LEN];
	char ssid[48], pass[80], auth[16], crypto[16], role[8];
	int i;

	/* the wireless interface must be configured to do WPA */
	wl_ioctl(ifname, WLC_GET_INSTANCE, &unit, sizeof(unit));
	snprintf(prefix, sizeof(prefix), "wl%d_", unit);
	if (nvram_match(strcat_r(prefix, "auth_mode", tmp), "open") ||
	    nvram_match(strcat_r(prefix, "auth_mode", tmp), "shared"))
		return 0;

	/* find WDS link configuration */
	wl_ioctl(ifname, WLC_WDS_GET_REMOTE_HWADDR, remote, ETHER_ADDR_LEN);

	for(i=0;i<ETHER_ADDR_LEN;i++)
	{
		sprintf(tmp, "%s %x", tmp, remote[i]);
	}
	nvram_set("wl0_nas_hwaddr", tmp);

	
	for (i = 0; i < MAX_NVPARSE; i ++) {
		char mac[ETHER_ADDR_STR_LEN];
		uint8 ea[ETHER_ADDR_LEN];

		if (get_wds_wsec(unit, i, mac, role, crypto, auth, ssid, pass) &&
		    ether_atoe(mac, ea) && !bcmp(ea, remote, ETHER_ADDR_LEN)) {
			argv[4] = role;
			argv[5] = crypto;
			argv[6] = auth;
			argv[7] = pass;
			argv[8] = ssid;
			break;
		}
	}

	/* did not find WDS link configuration, use wireless' */
	if (i == MAX_NVPARSE) {
		/* role */
		argv[4] = "auto";
		/* crypto */
		argv[5] = nvram_safe_get(strcat_r(prefix, "crypto", tmp));
		/* auth mode */
		argv[6] = nvram_safe_get(strcat_r(prefix, "auth_mode", tmp));
		/* passphrase */
		argv[7] = nvram_safe_get(strcat_r(prefix, "wpa_psk", tmp));
		/* ssid */
		argv[8] = nvram_safe_get(strcat_r(prefix, "ssid", tmp));
	}


	for(i=0;argv[i]!=NULL;i++)
	{
		char *nv[32];
		sprintf(nv, "wl0_nas_msg%d", i);
		nvram_set(nv, argv[i]);
	}
	
	/* wait till nas is started */
	while (retries -- > 0 && !(str = file2str("/tmp/nas.lan.pid")))
		sleep(1);
	if (str) {
		int pid;
		free(str);
		nvram_set("wl0_nas_msg99", "ok");
		return _eval(argv, ">/dev/console", 0, &pid);
	}
	return -1;
}
#endif

int
hotplug_net(void)
{
#ifdef REMOVE
	char *lan_ifname = nvram_safe_get("lan_ifname");
	char *interface, *action;

	if (!(interface = getenv("INTERFACE")) ||
	    !(action = getenv("ACTION")))
		return EINVAL;

	if (strncmp(interface, "wds", 3))
		return 0;

	if (!strcmp(action, "register")) {
		/* Bring up the interface and add to the bridge */
		ifconfig(interface, IFUP, NULL, NULL);
		
		/* Bridge WDS interfaces */
		if (!strncmp(lan_ifname, "br", 2) && 
		    eval("brctl", "addif", lan_ifname, interface))
		    return 0;

		nvram_set("wl0_nas_msg1", "nas");
		/* Notify NAS of adding the interface */
		notify_nas("lan", interface, "up");
	}
#endif
	return 0;
}

int
wan_ifunit(char *wan_ifname)
{
	int unit;
	char tmp[100], prefix[] = "wanXXXXXXXXXX_";

	if ((unit = ppp_ifunit(wan_ifname)) >= 0)
		return unit;
	else {
		for (unit = 0; unit < MAX_NVPARSE; unit ++) {
			snprintf(prefix, sizeof(prefix), "wan%d_", unit);
			if (nvram_match(strcat_r(prefix, "ifname", tmp), wan_ifname) &&
			    (nvram_match(strcat_r(prefix, "proto", tmp), "dhcp") ||
			     nvram_match(strcat_r(prefix, "proto", tmp), "bigpond") ||
#ifdef DHCP_PPTP
			     nvram_match(strcat_r(prefix, "proto", tmp), "pptp") ||
#endif
			     nvram_match(strcat_r(prefix, "proto", tmp), "static")))
				return unit;
		}
	}
	return -1;
}

int
preset_wan_routes(char *wan_ifname)
{
	char tmp[100], prefix[] = "wanXXXXXXXXXX_";


	/* Figure out nvram variable name prefix for this i/f */
	if (wan_prefix(wan_ifname, prefix) < 0)
		return -1;

	/* Set default route to gateway if specified */
	if (nvram_match(strcat_r(prefix, "primary", tmp), "1"))
	{
		route_add(wan_ifname, 0, "0.0.0.0", "0.0.0.0", "0.0.0.0");
	}

	/* Install interface dependent static routes */
	add_wan_routes(wan_ifname);
	return 0;
}

int
wan_primary_ifunit(void)
{
	int unit;
	
	for (unit = 0; unit < MAX_NVPARSE; unit ++) {
		char tmp[100], prefix[] = "wanXXXXXXXXXX_";
		snprintf(prefix, sizeof(prefix), "wan%d_", unit);
		if (nvram_match(strcat_r(prefix, "primary", tmp), "1"))
			return unit;
	}

	return 0;
}

