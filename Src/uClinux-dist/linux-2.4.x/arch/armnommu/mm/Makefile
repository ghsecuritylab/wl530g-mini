#
# Makefile for the linux arm-specific parts of the memory manager.
#
# Note! Dependencies are done automagically by 'make dep', which also
# removes any old dependencies. DON'T put your own dependencies here
# unless it's something special (ie not a .c file).
#
# Note 2! The CFLAGS definition is now in the main makefile...

USE_STANDARD_AS_RULE := true

O_TARGET	:= mm.o

# Object file lists.

obj-y		:= init.o
obj-m		:=
obj-n		:=
obj-		:=
export-objs	:= proc-syms.o discontig.o

cpu32-y		:= consistent.o fault-armv.o ioremap.o mm-armv.o
cpu32-$(CONFIG_MODULES) += proc-syms.o

obj-y		+= extable.o fault-common.o
obj-$(CONFIG_CPU_26) += fault-armo.o mm-armo.o small_page.o
obj-$(CONFIG_CPU_32) += $(cpu32-y)

obj-$(CONFIG_DISCONTIGMEM) += discontig.o

obj-$(MAGIC_ROM_PTR) += memory.o

# Select the processor-specific files
p-$(CONFIG_CPU_26)	+= proc-arm2,3.o
p-$(CONFIG_CPU_ARM7V3)	+= proc-arm6,7.o
p-$(CONFIG_CPU_ARM610)	+= proc-arm6,7.o
p-$(CONFIG_CPU_ARM710)	+= proc-arm6,7.o
p-$(CONFIG_CPU_ARM720T)	+= proc-arm720.o
p-$(CONFIG_CPU_ARM740T) += proc-arm740.o
p-$(CONFIG_CPU_ARM920T)	+= proc-arm920.o
p-$(CONFIG_CPU_ARM940T)	+= proc-arm940.o
p-$(CONFIG_CPU_ARM946)	+= proc-arm946.o
p-$(CONFIG_CPU_ARM1020)	+= proc-arm1020.o
p-$(CONFIG_CPU_SA110)	+= proc-sa110.o
p-$(CONFIG_CPU_SA1100)	+= proc-sa110.o

# Integrator follows "new style"
# Soon, others will do too, and we can get rid of this
MMMACH		:= mm-$(MACHINE).c
ifeq ($(MMMACH),$(wildcard $(MMMACH)))
obj-$(CONFIG_CPU_32)	+= $(MMMACH:.c=.o)
endif

obj-y		+= $(sort $(p-y))

include $(TOPDIR)/Rules.make

# Special dependencies
$(p-y):	$(TOPDIR)/include/asm/constants.h
