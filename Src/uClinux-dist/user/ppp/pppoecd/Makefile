#
# PPPoEcd Makefile
#
# Copyright 2006, Broadcom Corporation
# All Rights Reserved.
# 
# THIS SOFTWARE IS OFFERED "AS IS", AND BROADCOM GRANTS NO WARRANTIES OF ANY
# KIND, EXPRESS OR IMPLIED, BY STATUTE, COMMUNICATION OR OTHERWISE. BROADCOM
# SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A SPECIFIC PURPOSE OR NONINFRINGEMENT CONCERNING THIS SOFTWARE.
#
# $Id: Makefile,v 1.11 2006/03/02 12:33:44 honor Exp $
# 
ifneq ($(wildcard $(SRCBASE)/cy_conf.mak),)
  include $(SRCBASE)/cy_conf.mak
endif

CC = arm-elf-gcc
LD = arm-elf-gcc
LIBDIR = ../../../uClibc/lib
# Uncomment the following line to enable CCP compression
# CCP_SUPPORT=y

# Uncomment the following line to enable standard CHAP authentication
CHAP_SUPPORT=y

# Uncomment the following line to enable MS CHAP authentication
CHAPMS_SUPPORT=y

# Uncomment the following to enable debugging
DFLAGS	+= -g -DDEBUG -DDEBUGALL
ifeq ($(LOG_PPPOE),2)
DFLAGS += -DDEBUG -DDEBUGALL
endif

ifeq ($(MPPPOE_SUPPORT),1)
DFLAGS += -DMPPPOE_SUPPORT
endif

CFLAGS	:= -D_linux_=1 -DHAVE_PATHS_H -DHAVE_MMAP
CFLAGS	+= -I ../../../ -I../../../uClibc/include/ -I. -I../pppd $(COPTS) -Wall
CFLAGS	+= $(DFLAGS)

vpath	%.c ../pppd
OBJS	:= magic.o fsm.o lcp.o ipcp.o upap.o
vpath	%.c ../pppd/plugins/pppoe
OBJS	+= pppoehash.o pppoe_client.o libpppoe.o
OBJS	+= main.o auth.o options.o demand.o utils.o sys-linux.o pppoe.o

ifdef CCP_SUPPORT
CFLAGS	+= -DCCP_SUPPORT=1
OBJS	+= ccp.o
endif

ifdef CHAP_SUPPORT
CFLAGS	+= -DCHAP_SUPPORT=1
OBJS	+= md5.o chap.o
endif

ifdef CHAPMS_SUPPORT
CFLAGS	+= -DCHAPMS=1 -DUSE_CRYPT=1 -DHAVE_CRYPT_H=1
OBJS	+= md4.o chap_ms.o
endif

ifneq ($(wildcard $(LIBDIR)/libcrypt.a),)
LIBCRYPT := $(LIBDIR)/libcrypt.a
else
LIBCRYPT := $(USRLIBDIR)/libcrypt.a
endif

all: pppoecd

install: all
	install -d $(INSTALLDIR)/usr/sbin
	install -m 755 pppoecd $(INSTALLDIR)/usr/sbin
	$(STRIP) $(INSTALLDIR)/usr/sbin/pppoecd

pppoecd: $(OBJS)
	$(CC) -Wl,-elf2flt -o $@ $^ $(LIBCRYPT)
	cp $@ ../../../romfs/bin/
##$(CC) -Wl,-elf2flt -o $@ .$@
##rm -f .$@

clean:
	rm -f *.o pppoecd

$(OBJS): $(CY_DEPS)
