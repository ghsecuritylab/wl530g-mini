VERSION = 0.1

prefix = @prefix@
exec_prefix = @exec_prefix@
libdir = @libdir@
bindir = @bindir@
includedir = @includedir@

VPATH = @srcdir@

CC = gcc
CPPFLAGS = -I. -O3 -funroll-all-loops
CFLAGS = -I. -O3 -funroll-all-loops
LDFLAGS = 
RANLIB = ranlib
AR = ar
INSTALL = 
INSTALL_DATA = 

DISTNAME = lzfx-$(VERSION)
DISTFILES = README LICENSE lzfx.c lzfx.h tests/*.test tests/test.c lzfx-util.c \
            configure Makefile.in install-sh

TESTDIR = tests
TESTFILES = $(TESTDIR)/empty.test \
            $(TESTDIR)/random.test

all: Makefile liblzfx.a util

clean:
	-rm -f *.o *.a lzfx tests/test

lzfx.o: lzfx.c lzfx.h
	$(CC) $(CFLAGS) lzfx.c -c

liblzfx.a: lzfx.o
	rm -f $@
	$(AR) rc $@ $^
	$(RANLIB) $@

test: tests/test.c
	$(CC) $(CFLAGS) $(TESTDIR)/test.c lzfx.c -llzf -o $(TESTDIR)/test

check: test
	dd if=/dev/zero of=$(TESTDIR)/empty.test bs=1M count=4 > /dev/null 2>&1
	dd if=/dev/urandom of=$(TESTDIR)/random.test bs=1M count=1 > /dev/null 2>&1
	$(TESTDIR)/test $(TESTDIR)/*.test
	-rm -f $(TESTFILES)

install: all
	$(INSTALL) -d $(includedir)
	$(INSTALL_DATA) lzfx.h $(includedir)
	$(INSTALL) -d $(libdir)
	$(INSTALL_DATA) liblzfx.a $(libdir)
	$(INSTALL) -d $(bindir)
	$(INSTALL) -m 755 lzfx $(bindir)

util: lzfx-util.c lzfx.c
	$(CC) $(CFLAGS) lzfx-util.c lzfx.c -o lzfx

dist:
	mkdir $(DISTNAME)
	tar c $(DISTFILES) | tar xpC $(DISTNAME)
	-chown -R root.root $(DISTNAME)
	chmod -R u=rwX,go=rX $(DISTNAME)
	tar cvf - $(DISTNAME) | gzip -9 > $(DISTNAME).tar.gz
	rm -rf $(DISTNAME)
	ls -l $(DISTNAME).tar.gz

Makefile: Makefile.in
	./config.status

