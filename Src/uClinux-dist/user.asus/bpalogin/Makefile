###########################################################################
# Makefile for BPALogin v2.0
##

##
# Install locations as determined by configure
prefix=/usr/local
exec_prefix=${prefix}
SBINPATH=${exec_prefix}/sbin
ETCPATH=${prefix}/etc

##
# Locations of system utilities as determined by configure
CC=arm-elf-gcc
CHKCONFIG=/sbin/chkconfig
INSTALL=/usr/bin/install -c
SED=/bin/sed

##
#
CFLAGS=-g -O2 -Wall 
#LIBS=-lnsl 
LDFLAGS += -L. -Wl,-elf2flt="-s 64000"

OBJS = bpalogin.o protocol.o transaction.o gen_md5.o unixmain.o

bpalogin: $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) $(LDFLAGS)

.c.o:
	$(CC) $(CFLAGS) -c $<

clean:
	rm -fr *.o bpalogin *.gdb

distclean: clean
	rm -f bpalogin config.log config.cache config.status Makefile bpalogin.h

bpalogin.h: bpalogin.h.in
	$(SED) 's#@@BPALOGIN_CONF@@#$(ETCPATH)/bpalogin.conf#' < bpalogin.h.in > bpalogin.h

$(OBJS): bpalogin.h

install: bpalogin
	install bpalogin  $(INSTALLDIR)/usr/sbin
	$(STRIP) $(INSTALLDIR)/usr/sbin/bpalogin
