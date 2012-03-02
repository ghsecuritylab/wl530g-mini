#!/bin/sh
# Copyright (C) John H Terpstra 1998
#
RPMDIR=`rpm --showrc | awk '/^rpmdir/ { print $3}'`
SPECDIR=`rpm --showrc | awk '/^specdir/ { print $3}'`
SRCDIR=`rpm --showrc | awk '/^sourcedir/ { print $3}'`
USERID=`id -u`
GRPID=`id -g`

( cd ../../.. ; chown -R ${USERID}.${GRPID} ${SRCDIR}/samba-2.0.4b )
( cd ../../.. ; tar czvf ${SRCDIR}/samba-2.0.4b.tar.gz samba-2.0.4b )
cp -a *.spec $SPECDIR
cp -a *.patch smb.* samba.log $SRCDIR
cd $SPECDIR
rpm -ba -v samba2.spec
