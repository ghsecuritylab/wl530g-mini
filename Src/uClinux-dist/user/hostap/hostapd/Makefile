CC=gcc

ifndef CFLAGS
CFLAGS = -MMD -O2 -Wall -g
endif

# define HOSTAPD_DUMP_STATE to include SIGUSR1 handler for dumping state to
# a file (undefine it, if you want to save in binary size)
CFLAGS += -DHOSTAPD_DUMP_STATE

CFLAGS += -I../driver/modules -I../utils

# Uncomment following line and set the path to your kernel tree include
# directory if your C library does not include all header files.
# CFLAGS += -DUSE_KERNEL_HEADERS -I/usr/src/linux/include

OBJS =	hostapd.o eloop.o ieee802_1x.o eapol_sm.o radius.o md5.o rc4.o \
	common.o iapp.o ieee802_11.o config.o ieee802_11_auth.o accounting.o \
	sta_info.o driver.o receive.o radius_client.o

all: hostapd

hostapd: $(OBJS)
	$(CC) -o hostapd $(OBJS)

clean:
	rm -f core *~ *.o hostapd *.d

-include $(OBJS:%.o=%.d)
