# Generated automatically from Makefile.in by configure.
# Generated automatically from Makefile.in by configure.
#***********************************************************************
#
# Makefile
#
# Makefile for Roaring Penguin's Linux user-space PPPoE client.
#
# Copyright (C) 2000 Roaring Penguin Software Inc.
#
# This program may be distributed according to the terms of the GNU
# General Public License, version 2 or (at your option) any later version.
#
# LIC: GPL
#
# $Id: Makefile.in,v 1.84 2002/07/05 19:32:50 dfs Exp $
#***********************************************************************

# Version is set ONLY IN THE MAKEFILE!  Don't delete this!
VERSION=3.5

CC=arm-elf-gcc
STRIP=arm-elf-strip
INSTALL=install


DEFINES=
# Plugin for pppd on Linux
LINUX_KERNELMODE_PLUGIN=
PPPD_INCDIR=

# PPPoE relay -- currently only supported on Linux
PPPOE_RELAY=pppoe-relay

# Include ServPoET version if we're building for ServPoET

CFLAGS= -s -O2 -Wl,-elf2flt="" -I. -DVERSION=3.5
TARGET=pppoe-relay

all: $(TARGET)
	#$(STRIP) $(TARGET)
	#$(INSTALL) $(TARGET) /root/broadcom/target/usr/sbin/

pppoe-relay: relay.o if.o debug.o common.o
	$(CC) -o $@ $^ $(CFLAGS) -o pppoe-relay

clean:
	rm -rf *.o
