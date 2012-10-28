# WAN network interface
ext_ifname=ppp0
# if the WAN interface has several IP addresses, you
# can specify the one to use below
#ext_ip=

# LAN network interfaces IPs / networks
# there can be multiple listening ips for SSDP traffic.
# should be under the form nnn.nnn.nnn.nnn/nn
# HTTP is available on all interfaces
# When MULTIPLE_EXTERNAL_IP is enabled, the external ip
# address associated with the subnet follows. for example :
#  listening_ip=192.168.0.1/24 88.22.44.13
listening_ip=<?subnet_ip_prefix?>.<?router_ipaddr?>/24
#listening_ip=
# port for HTTP (descriptions and SOAP) traffic. set 0 for autoselect.
port=0

# path to the unix socket used to communicate with MiniSSDPd
# If running, MiniSSDPd will manage M-SEARCH answering.
# default is /var/run/minissdpd.sock
#minissdpdsocket=/var/run/minissdpd.sock

# enable NAT-PMP support (default is no)
enable_natpmp=yes

# enable UPNP support (default is yes)
enable_upnp=yes

# chain names for netfilter (not used for pf or ipf).
# default is MINIUPNPD for both
#upnp_forward_chain=forwardUPnP
#upnp_nat_chain=UPnP

# lease file location
#lease_file=/var/log/upnp.leases

# name of this service, default is "`uname -s` Router"
#friendly_name=MiniUPnPd router

# bitrates reported by daemon in bits per second
bitrate_up=1000000
bitrate_down=10000000

# "secure" mode : when enabled, UPnP client are allowed to add mappings only
# to their IP.
#secure_mode=yes
secure_mode=no

# default presentation url is http address on port 80
# If set to an empty string, no presentationURL element will appear
# in the XML description of the device, which prevents MS Windows
# from displaying an icon in the "Network Connections" panel.
#presentation_url=http://www.mylan/index.php

# report system uptime instead of daemon uptime
system_uptime=yes

# notify interval in seconds. default is 30 seconds.
#notify_interval=240
notify_interval=60

# unused rules cleaning.
# never remove any rule before this threshold for the number
# of redirections is exceeded. default to 20
#clean_ruleset_threshold=10
# clean process work interval in seconds. default to 0 (disabled).
# a 600 seconds (10 minutes) interval makes sense
clean_ruleset_interval=600

# log packets in pf (default is no)
#packet_log=no

# anchor name in pf (default is miniupnpd)
#anchor=miniupnpd

# ALTQ queue in pf
# filter rules must be used for this to be used.
# compile with PF_ENABLE_FILTER_RULES (see config.h file)
#queue=queue_name1

# tag name in pf
#tag=tag_name1

# make filter rules in pf quick or not. default is yes
# active when compiled with PF_ENABLE_FILTER_RULES (see config.h file)
#quickrules=no

# uuid : generate your own with "make genuuid"
uuid=3d3cec3a-8cf0-11e0-98ee-001a6bd2d07b

# serial and model number the daemon will report to clients
# in its XML description
serial=12345678
model_number=1

# UPnP permission rules
# (allow|deny) (external port range) ip/mask (internal port range)
# A port range is <min port>-<max port> or <port> if there is only
# one port in the range.
# ip/mask format must be nn.nn.nn.nn/nn
# it is advised to only allow redirection of port above 1024
# and to finish the rule set with "deny 0-65535 0.0.0.0/0 0-65535"
#allow 1024-65535 192.168.0.0/24 1024-65535
#allow 1024-65535 192.168.1.0/24 1024-65535
#allow 1024-65535 192.168.0.0/23 22
#allow 12345 192.168.7.113/32 54321
#deny 0-65535 0.0.0.0/0 0-65535
allow 0-65535 0.0.0.0/0 0-65535

