/* setjmp for PowerPC.
   Copyright (C) 1995, 1996, 1997, 1999, 2000 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

#include <features.h>
#include "ppc_asm.h"
#define _ASM
#define _SETJMP_H
#include <bits/setjmp.h>

#ifdef __UCLIBC_HAS_FLOATS__
#define FP(x...) x
#else
#define FP(x...)
#endif

.globl      __sigsetjmp;
.type      __sigsetjmp, @function;
.align  2;        

__sigsetjmp:   
	stw  r1,(JB_GPR1*4)(3)
	mflr r0
	stw  r2,(JB_GPR2*4)(3)
	stw  r14,((JB_GPRS+0)*4)(3)
FP(	stfd fp14,((JB_FPRS+0*2)*4)(3))
	stw  r0,(JB_LR*4)(3)
	stw  r15,((JB_GPRS+1)*4)(3)
FP(	stfd fp15,((JB_FPRS+1*2)*4)(3))
	mfcr r0
	stw  r16,((JB_GPRS+2)*4)(3)
FP(	stfd fp16,((JB_FPRS+2*2)*4)(3))
	stw  r0,(JB_CR*4)(3)
	stw  r17,((JB_GPRS+3)*4)(3)
FP(	stfd fp17,((JB_FPRS+3*2)*4)(3))
	stw  r18,((JB_GPRS+4)*4)(3)
FP(	stfd fp18,((JB_FPRS+4*2)*4)(3))
	stw  r19,((JB_GPRS+5)*4)(3)
FP(	stfd fp19,((JB_FPRS+5*2)*4)(3))
	stw  r20,((JB_GPRS+6)*4)(3)
FP(	stfd fp20,((JB_FPRS+6*2)*4)(3))
	stw  r21,((JB_GPRS+7)*4)(3)
FP(	stfd fp21,((JB_FPRS+7*2)*4)(3))
	stw  r22,((JB_GPRS+8)*4)(3)
FP(	stfd fp22,((JB_FPRS+8*2)*4)(3))
	stw  r23,((JB_GPRS+9)*4)(3)
FP(	stfd fp23,((JB_FPRS+9*2)*4)(3))
	stw  r24,((JB_GPRS+10)*4)(3)
FP(	stfd fp24,((JB_FPRS+10*2)*4)(3))
	stw  r25,((JB_GPRS+11)*4)(3)
FP(	stfd fp25,((JB_FPRS+11*2)*4)(3))
	stw  r26,((JB_GPRS+12)*4)(3)
FP(	stfd fp26,((JB_FPRS+12*2)*4)(3))
	stw  r27,((JB_GPRS+13)*4)(3)
FP(	stfd fp27,((JB_FPRS+13*2)*4)(3))
	stw  r28,((JB_GPRS+14)*4)(3)
FP(	stfd fp28,((JB_FPRS+14*2)*4)(3))
	stw  r29,((JB_GPRS+15)*4)(3)
FP(	stfd fp29,((JB_FPRS+15*2)*4)(3))
	stw  r30,((JB_GPRS+16)*4)(3)
FP(	stfd fp30,((JB_FPRS+16*2)*4)(3))
	stw  r31,((JB_GPRS+17)*4)(3)
FP(	stfd fp31,((JB_FPRS+17*2)*4)(3))
#ifdef __PIC__
	b __sigjmp_save@plt
#else
	b __sigjmp_save
#endif
.size     __sigsetjmp,.-__sigsetjmp
