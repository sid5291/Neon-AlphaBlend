	.syntax unified
	.cpu cortex-a8
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu neon
	.eabi_attribute 23, 1
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"main.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	alphaBlend_c
	.thumb
	.thumb_func
	.type	alphaBlend_c, %function
alphaBlend_c:
.LFB1881:
	.file 1 "../main.c"
	.loc 1 18 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	push	{r4, r5, r6}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 5, -8
	.cfi_offset 6, -4
	.loc 1 19 0
#APP
@ 19 "../main.c" 1
	movs      r3,#0
	movs      r4,r0
	movs      r5,r1
	movs      r6,r2
	.loop:
	pld       [r4,#0x800] 
	pld       [r5,#0x800]
	pld       [r5,#0x00]
	adds      r3,r3,#64
	vld4.8    {d20-d23},[r4]!
	cmp       r3,#1048576
	pld       [r4,#0x820] 
	pld       [r5,#0x820]
	vmvn      d29,d23
	vmull.u8  q1,d22,d23
	vld4.8    {d24-d27},[r5]!
	vmull.u8  q3,d21,d23
	vmull.u8  q5,d20,d23
	vmull.u8  q2,d26,d29
	vmull.u8  q4,d25,d29
	vmull.u8  q6,d24,d29
	vadd.u16  q1,q1,q2
	vadd.u16  q3,q3,q4
	vadd.u16  q5,q5,q6
	vshr.u16  q1,q1,#8
	vshr.u16  q3,q3,#8
	vshr.u16  q5,q5,#8
	vmovn.u16 d22,q1
	vmovn.u16 d21,q3
	vmovn.u16 d20,q5
	vmov.u8   d23,#0xff
	vst4.8   {d20-d23},[r6]!
	pld       [r4,#0x0]
	pld       [r5,#0x0]
	pld       [r4,#0x800] 
	pld       [r5,#0x800]
	vld4.8    {d20-d23},[r4]!
	pld       [r4,#0x820] 
	pld       [r5,#0x820]
	vmvn      d29,d23
	vmull.u8  q1,d22,d23
	vld4.8    {d24-d27},[r5]!
	vmull.u8  q3,d21,d23
	vmull.u8  q5,d20,d23
	vmull.u8  q2,d26,d29
	vmull.u8  q4,d25,d29
	vmull.u8  q6,d24,d29
	vadd.u16  q1,q1,q2
	vadd.u16  q3,q3,q4
	vadd.u16  q5,q5,q6
	vshr.u16  q1,q1,#8
	vshr.u16  q3,q3,#8
	vshr.u16  q5,q5,#8
	vmovn.u16 d22,q1
	vmovn.u16 d21,q3
	vmovn.u16 d20,q5
	vmov.u8   d23,#0xff
	pld       [r4,#0x840]
	pld       [r5,#0x840]
	vst4.8   {d20-d23},[r6]!
	bne      .loop
	
@ 0 "" 2
	.loc 1 88 0
	.thumb
	pop	{r4, r5, r6}
	.cfi_restore 6
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE1881:
	.size	alphaBlend_c, .-alphaBlend_c
	.align	2
	.global	enable_runfast
	.thumb
	.thumb_func
	.type	enable_runfast, %function
enable_runfast:
.LFB1882:
	.loc 1 91 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 95 0
	movw	r3, #24672
	mov	r2, #50331648
	movt	r3, 1032
#APP
@ 95 "../main.c" 1
	fmrx r3, fpscr
	and  r3, r3, r3
	orr  r3, r3, r2
	fmxr fpscr, r3
	
@ 0 "" 2
.LVL1:
	.thumb
	bx	lr
	.cfi_endproc
.LFE1882:
	.size	enable_runfast, .-enable_runfast
	.align	2
	.global	print_vec
	.thumb
	.thumb_func
	.type	print_vec, %function
print_vec:
.LFB1883:
	.loc 1 106 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL2:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 109 0
	movw	r4, #:lower16:.LC0
	.loc 1 106 0
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
.LVL3:
	.loc 1 109 0
	movt	r4, #:upper16:.LC0
	mov	r0, r4
.LBB6:
.LBB7:
	.file 2 "c:\\program files\\ds-5\\sw\\gcc\\lib\\gcc\\arm-linux-gnueabihf\\4.8.3\\include\\arm_neon.h"
	.loc 2 8681 0
	vst1.8	{d0}, [sp:64]
.LBE7:
.LBE6:
	.loc 1 109 0
	ldrb	r1, [sp]	@ zero_extendqisi2
	bl	printf
.LVL4:
	.loc 1 110 0
	ldrb	r1, [sp, #1]	@ zero_extendqisi2
	mov	r0, r4
	bl	printf
.LVL5:
	.loc 1 111 0
	ldrb	r1, [sp, #2]	@ zero_extendqisi2
	mov	r0, r4
	bl	printf
.LVL6:
	.loc 1 112 0
	ldrb	r1, [sp, #3]	@ zero_extendqisi2
	mov	r0, r4
	bl	printf
.LVL7:
	.loc 1 113 0
	ldrb	r1, [sp, #4]	@ zero_extendqisi2
	mov	r0, r4
	bl	printf
.LVL8:
	.loc 1 114 0
	ldrb	r1, [sp, #5]	@ zero_extendqisi2
	mov	r0, r4
	bl	printf
.LVL9:
	.loc 1 115 0
	ldrb	r1, [sp, #6]	@ zero_extendqisi2
	mov	r0, r4
	bl	printf
.LVL10:
	.loc 1 116 0
	mov	r0, r4
	ldrb	r1, [sp, #7]	@ zero_extendqisi2
	bl	printf
.LVL11:
	.loc 1 117 0
	add	sp, sp, #8
	.cfi_def_cfa_offset 8
.LVL12:
	@ sp needed
	pop	{r4, pc}
	.cfi_endproc
.LFE1883:
	.size	print_vec, .-print_vec
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.thumb
	.thumb_func
	.type	main, %function
main:
.LFB1884:
	.loc 1 121 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL13:
	.loc 1 130 0
	cmp	r0, #4
	.loc 1 121 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.cfi_def_cfa_offset 36
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	mov	r4, r1
	sub	sp, sp, #28
	.cfi_def_cfa_offset 64
	.loc 1 130 0
	beq	.L7
	.loc 1 131 0
	movw	r6, #:lower16:stderr
	movw	r1, #:lower16:.LC1
.LVL14:
	movt	r6, #:upper16:stderr
	ldr	r2, [r4]
	ldr	r0, [r6]
.LVL15:
	movt	r1, #:upper16:.LC1
	bl	fprintf
.LVL16:
	.loc 1 132 0
	movs	r0, #1
.LVL17:
.L8:
	.loc 1 187 0
	add	sp, sp, #28
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.LVL18:
.L7:
	.cfi_restore_state
	.loc 1 134 0
	movw	r1, #:lower16:.LC2
.LVL19:
	ldr	r0, [r4, #4]
.LVL20:
	movt	r1, #:upper16:.LC2
	bl	fopen
.LVL21:
	.loc 1 135 0
	movw	r1, #:lower16:.LC2
	movt	r1, #:upper16:.LC2
	.loc 1 134 0
	mov	r5, r0
.LVL22:
	.loc 1 135 0
	ldr	r0, [r4, #8]
.LVL23:
	bl	fopen
.LVL24:
	.loc 1 136 0
	movw	r1, #:lower16:.LC3
	movt	r1, #:upper16:.LC3
	.loc 1 135 0
	mov	r6, r0
.LVL25:
	.loc 1 136 0
	ldr	r0, [r4, #12]
.LVL26:
	bl	fopen
.LVL27:
.LBB8:
.LBB9:
	.loc 1 95 0
	movw	r2, #24672
	mov	r1, #50331648
	movt	r2, 1032
.LBE9:
.LBE8:
	.loc 1 136 0
	mov	r4, r0
.LVL28:
.LBB11:
.LBB10:
	.loc 1 95 0
#APP
@ 95 "../main.c" 1
	fmrx r2, fpscr
	and  r2, r2, r2
	orr  r2, r2, r1
	fmxr fpscr, r2
	
@ 0 "" 2
.LVL29:
	.thumb
.LBE10:
.LBE11:
	.loc 1 138 0
	cbz	r5, .L9
	cbz	r6, .L9
	.loc 1 138 0 is_stmt 0 discriminator 1
	cbz	r0, .L9
	.loc 1 139 0 is_stmt 1
	movw	r0, #:lower16:backImage
.LVL30:
	mov	r2, #512
	mov	r1, #2048
	movt	r0, #:upper16:backImage
	mov	r3, r6
	bl	fread
.LVL31:
	.loc 1 140 0
	cmp	r0, #512
	.loc 1 139 0
	mov	r2, r0
.LVL32:
	.loc 1 140 0
	beq	.L10
	.loc 1 141 0
	movw	lr, #:lower16:stderr
	movw	r0, #:lower16:.LC4
.LVL33:
	movt	lr, #:upper16:stderr
	movt	r0, #:upper16:.LC4
	ldr	r3, [lr]
	movs	r1, #1
	movs	r2, #21
.LVL34:
	bl	fwrite
.LVL35:
	.loc 1 142 0
	movs	r0, #3
	b	.L8
.LVL36:
.L9:
	.loc 1 185 0
	movw	r5, #:lower16:stderr
.LVL37:
	movw	r0, #:lower16:.LC9
.LVL38:
	movt	r5, #:upper16:stderr
	movt	r0, #:upper16:.LC9
	ldr	r3, [r5]
	movs	r1, #1
	movs	r2, #23
	bl	fwrite
.LVL39:
	.loc 1 186 0
	movs	r0, #2
	b	.L8
.LVL40:
.L10:
	.loc 1 144 0
	movw	r0, #:lower16:foreImage
.LVL41:
	mov	r1, #2048
	movt	r0, #:upper16:foreImage
	mov	r3, r5
	bl	fread
.LVL42:
	.loc 1 145 0
	cmp	r0, #512
	beq	.L11
	.loc 1 146 0
	movw	ip, #:lower16:stderr
	movw	r0, #:lower16:.LC5
.LVL43:
	movt	ip, #:upper16:stderr
	movt	r0, #:upper16:.LC5
	ldr	r3, [ip]
	movs	r1, #1
	movs	r2, #21
	bl	fwrite
.LVL44:
	.loc 1 147 0
	movs	r0, #4
	b	.L8
.LVL45:
.L11:
	movw	fp, #:lower16:.LANCHOR0
	movw	r8, #:lower16:.LANCHOR1
	movt	fp, #:upper16:.LANCHOR0
	movt	r8, #:upper16:.LANCHOR1
	.loc 1 164 0
	mov	r10, fp
	.loc 1 162 0
	mov	r9, r8
	.loc 1 145 0
	movs	r7, #0
	b	.L16
.LVL46:
.L12:
	.loc 1 161 0
	ldr	r1, [fp]
	.loc 1 162 0
	ldr	r2, [r8]
	.loc 1 164 0
	ldr	r3, [fp, #4]
	.loc 1 161 0
	add	r1, r1, r0
	.loc 1 162 0
	cmp	r0, r2
	.loc 1 161 0
	str	r1, [fp]
	.loc 1 163 0
	it	lt
	strlt	r0, [r9]
	.loc 1 164 0
	cmp	r0, r3
	.loc 1 165 0
	it	gt
	strgt	r0, [r10, #4]
.L13:
	.loc 1 150 0
	adds	r7, r7, #1
.LVL47:
	cmp	r7, #99
	bgt	.L28
.LVL48:
.L16:
	.loc 1 152 0
	movs	r1, #0
	add	r0, sp, #8
	bl	gettimeofday
.LVL49:
	.loc 1 153 0
	movw	r0, #:lower16:foreImage
	movw	r1, #:lower16:backImage
	movw	r2, #:lower16:newImage
	movt	r0, #:upper16:foreImage
	movt	r1, #:upper16:backImage
	movt	r2, #:upper16:newImage
	bl	alphaBlend_c
.LVL50:
	.loc 1 154 0
	add	r0, sp, #16
	movs	r1, #0
	bl	gettimeofday
.LVL51:
	.loc 1 155 0
	ldr	r0, [sp, #20]
	ldr	r3, [sp, #12]
.LVL52:
	.loc 1 156 0
	subs	r0, r0, r3
.LVL53:
	bpl	.L12
	.loc 1 158 0
	subs	r7, r7, #1
.LVL54:
	.loc 1 159 0
	b	.L13
.L28:
.LVL55:
	.loc 1 167 0
	fmsr	s13, r7	@ int
	.loc 1 168 0
	ldr	r7, [fp]
.LVL56:
	movw	r10, #:lower16:stdout
	movw	r1, #:lower16:.LC6
	.loc 1 167 0
	fsitos	s15, s13
	.loc 1 168 0
	movt	r10, #:upper16:stdout
	.loc 1 167 0
	fmsr	s0, r7	@ int
	.loc 1 168 0
	movt	r1, #:upper16:.LC6
	str	r7, [sp]
	ldr	r0, [r10]
.LVL57:
	.loc 1 167 0
	fsitos	s14, s0
	fdivs	s1, s14, s15
.LVL58:
	.loc 1 168 0
	fcvtds	d16, s1
	fmrrd	r2, r3, d16
	bl	fprintf
.LVL59:
	.loc 1 169 0
	movw	r1, #:lower16:.LC7
	ldr	r2, [fp, #4]
	movt	r1, #:upper16:.LC7
	ldr	r0, [r10]
	bl	fprintf
.LVL60:
	.loc 1 170 0
	movw	r1, #:lower16:.LC8
	movt	r1, #:upper16:.LC8
	ldr	r2, [r8]
	ldr	r0, [r10]
	bl	fprintf
.LVL61:
	.loc 1 179 0
	movw	r0, #:lower16:newImage
	mov	r1, #2048
	mov	r2, #512
	mov	r3, r4
	movt	r0, #:upper16:newImage
	bl	fwrite
.LVL62:
	.loc 1 180 0
	mov	r0, r5
	bl	fclose
.LVL63:
	.loc 1 181 0
	mov	r0, r6
	bl	fclose
.LVL64:
	.loc 1 182 0
	mov	r0, r4
	bl	fclose
.LVL65:
	.loc 1 183 0
	movs	r0, #0
	b	.L8
	.cfi_endproc
.LFE1884:
	.size	main, .-main
	.comm	newImage,1048576,4
	.comm	foreImage,1048576,4
	.comm	backImage,1048576,4
	.data
	.align	2
.LANCHOR1 = . + 0
	.type	min.14620, %object
	.size	min.14620, 4
min.14620:
	.word	999999
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%#x\012\000"
	.space	3
.LC1:
	.ascii	"Usage:%s foreground background outFile\012\000"
.LC2:
	.ascii	"rb\000"
	.space	1
.LC3:
	.ascii	"wb\000"
	.space	1
.LC4:
	.ascii	"Error with backImage\012\000"
	.space	2
.LC5:
	.ascii	"Error with foreImage\012\000"
	.space	2
.LC6:
	.ascii	"Routine took avg of %f microseconds\012\000"
	.space	3
.LC7:
	.ascii	"Routine took max of %d microseconds\012\000"
	.space	3
.LC8:
	.ascii	"Routine took min of %d microseconds\012\000"
	.space	3
.LC9:
	.ascii	"Problem opening a file\012\000"
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	sum.14618, %object
	.size	sum.14618, 4
sum.14618:
	.space	4
	.type	max.14619, %object
	.size	max.14619, 4
max.14619:
	.space	4
	.text
.Letext0:
	.file 3 "c:\\program files\\ds-5\\sw\\gcc\\lib\\gcc\\arm-linux-gnueabihf\\4.8.3\\include\\stddef.h"
	.file 4 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\bits\\types.h"
	.file 5 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\stdio.h"
	.file 6 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\libio.h"
	.file 7 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\bits\\time.h"
	.file 8 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\sys\\time.h"
	.file 9 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\stdint.h"
	.file 10 "<built-in>"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xa28
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF928
	.byte	0x1
	.4byte	.LASF929
	.4byte	.LASF930
	.4byte	.Ldebug_ranges0+0x18
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF827
	.uleb128 0x4
	.4byte	.LASF836
	.byte	0x3
	.byte	0xd4
	.4byte	0x42
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF828
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF829
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF830
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF831
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF832
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF833
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF834
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF835
	.uleb128 0x4
	.4byte	.LASF837
	.byte	0x4
	.byte	0x37
	.4byte	0x6c
	.uleb128 0x4
	.4byte	.LASF838
	.byte	0x4
	.byte	0x83
	.4byte	0x90
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF839
	.uleb128 0x4
	.4byte	.LASF840
	.byte	0x4
	.byte	0x84
	.4byte	0x7a
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF841
	.uleb128 0x4
	.4byte	.LASF842
	.byte	0x4
	.byte	0x8b
	.4byte	0x90
	.uleb128 0x4
	.4byte	.LASF843
	.byte	0x4
	.byte	0x8d
	.4byte	0x90
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x6
	.byte	0x4
	.4byte	0xc7
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF844
	.uleb128 0x4
	.4byte	.LASF845
	.byte	0x5
	.byte	0x30
	.4byte	0xd9
	.uleb128 0x7
	.4byte	.LASF875
	.byte	0x98
	.byte	0x6
	.byte	0xf5
	.4byte	0x259
	.uleb128 0x8
	.4byte	.LASF846
	.byte	0x6
	.byte	0xf6
	.4byte	0x29
	.byte	0
	.uleb128 0x8
	.4byte	.LASF847
	.byte	0x6
	.byte	0xfb
	.4byte	0xc1
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF848
	.byte	0x6
	.byte	0xfc
	.4byte	0xc1
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF849
	.byte	0x6
	.byte	0xfd
	.4byte	0xc1
	.byte	0xc
	.uleb128 0x8
	.4byte	.LASF850
	.byte	0x6
	.byte	0xfe
	.4byte	0xc1
	.byte	0x10
	.uleb128 0x8
	.4byte	.LASF851
	.byte	0x6
	.byte	0xff
	.4byte	0xc1
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF852
	.byte	0x6
	.2byte	0x100
	.4byte	0xc1
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF853
	.byte	0x6
	.2byte	0x101
	.4byte	0xc1
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF854
	.byte	0x6
	.2byte	0x102
	.4byte	0xc1
	.byte	0x20
	.uleb128 0x9
	.4byte	.LASF855
	.byte	0x6
	.2byte	0x104
	.4byte	0xc1
	.byte	0x24
	.uleb128 0x9
	.4byte	.LASF856
	.byte	0x6
	.2byte	0x105
	.4byte	0xc1
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF857
	.byte	0x6
	.2byte	0x106
	.4byte	0xc1
	.byte	0x2c
	.uleb128 0x9
	.4byte	.LASF858
	.byte	0x6
	.2byte	0x108
	.4byte	0x291
	.byte	0x30
	.uleb128 0x9
	.4byte	.LASF859
	.byte	0x6
	.2byte	0x10a
	.4byte	0x297
	.byte	0x34
	.uleb128 0x9
	.4byte	.LASF860
	.byte	0x6
	.2byte	0x10c
	.4byte	0x29
	.byte	0x38
	.uleb128 0x9
	.4byte	.LASF861
	.byte	0x6
	.2byte	0x110
	.4byte	0x29
	.byte	0x3c
	.uleb128 0x9
	.4byte	.LASF862
	.byte	0x6
	.2byte	0x112
	.4byte	0x85
	.byte	0x40
	.uleb128 0x9
	.4byte	.LASF863
	.byte	0x6
	.2byte	0x116
	.4byte	0x50
	.byte	0x44
	.uleb128 0x9
	.4byte	.LASF864
	.byte	0x6
	.2byte	0x117
	.4byte	0x5e
	.byte	0x46
	.uleb128 0x9
	.4byte	.LASF865
	.byte	0x6
	.2byte	0x118
	.4byte	0x29d
	.byte	0x47
	.uleb128 0x9
	.4byte	.LASF866
	.byte	0x6
	.2byte	0x11c
	.4byte	0x2ad
	.byte	0x48
	.uleb128 0x9
	.4byte	.LASF867
	.byte	0x6
	.2byte	0x125
	.4byte	0x97
	.byte	0x50
	.uleb128 0x9
	.4byte	.LASF868
	.byte	0x6
	.2byte	0x12e
	.4byte	0xbf
	.byte	0x58
	.uleb128 0x9
	.4byte	.LASF869
	.byte	0x6
	.2byte	0x12f
	.4byte	0xbf
	.byte	0x5c
	.uleb128 0x9
	.4byte	.LASF870
	.byte	0x6
	.2byte	0x130
	.4byte	0xbf
	.byte	0x60
	.uleb128 0x9
	.4byte	.LASF871
	.byte	0x6
	.2byte	0x131
	.4byte	0xbf
	.byte	0x64
	.uleb128 0x9
	.4byte	.LASF872
	.byte	0x6
	.2byte	0x132
	.4byte	0x37
	.byte	0x68
	.uleb128 0x9
	.4byte	.LASF873
	.byte	0x6
	.2byte	0x134
	.4byte	0x29
	.byte	0x6c
	.uleb128 0x9
	.4byte	.LASF874
	.byte	0x6
	.2byte	0x136
	.4byte	0x2b3
	.byte	0x70
	.byte	0
	.uleb128 0xa
	.4byte	.LASF931
	.byte	0x6
	.byte	0x9a
	.uleb128 0x7
	.4byte	.LASF876
	.byte	0xc
	.byte	0x6
	.byte	0xa0
	.4byte	0x291
	.uleb128 0x8
	.4byte	.LASF877
	.byte	0x6
	.byte	0xa1
	.4byte	0x291
	.byte	0
	.uleb128 0x8
	.4byte	.LASF878
	.byte	0x6
	.byte	0xa2
	.4byte	0x297
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF879
	.byte	0x6
	.byte	0xa6
	.4byte	0x29
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x260
	.uleb128 0x6
	.byte	0x4
	.4byte	0xd9
	.uleb128 0xb
	.4byte	0xc7
	.4byte	0x2ad
	.uleb128 0xc
	.4byte	0xa2
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x259
	.uleb128 0xb
	.4byte	0xc7
	.4byte	0x2c3
	.uleb128 0xc
	.4byte	0xa2
	.byte	0x27
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2c9
	.uleb128 0xd
	.4byte	0xc7
	.uleb128 0x7
	.4byte	.LASF880
	.byte	0x8
	.byte	0x7
	.byte	0x1e
	.4byte	0x2f3
	.uleb128 0x8
	.4byte	.LASF881
	.byte	0x7
	.byte	0x20
	.4byte	0xa9
	.byte	0
	.uleb128 0x8
	.4byte	.LASF882
	.byte	0x7
	.byte	0x21
	.4byte	0xb4
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF883
	.byte	0x8
	.byte	0x8
	.byte	0x37
	.4byte	0x318
	.uleb128 0x8
	.4byte	.LASF884
	.byte	0x8
	.byte	0x39
	.4byte	0x29
	.byte	0
	.uleb128 0x8
	.4byte	.LASF885
	.byte	0x8
	.byte	0x3a
	.4byte	0x29
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF886
	.byte	0x9
	.byte	0x30
	.4byte	0x49
	.uleb128 0x4
	.4byte	.LASF887
	.byte	0x2
	.byte	0x29
	.4byte	0x32e
	.uleb128 0xe
	.4byte	0x33a
	.4byte	0x33a
	.uleb128 0xf
	.byte	0x7
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x5
	.4byte	.LASF888
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF889
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF890
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF891
	.uleb128 0x3
	.byte	0x2
	.byte	0x4
	.4byte	.LASF892
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF893
	.uleb128 0x3
	.byte	0x1
	.byte	0x5
	.4byte	.LASF894
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF895
	.uleb128 0x4
	.4byte	.LASF896
	.byte	0x2
	.byte	0x34
	.4byte	0x37d
	.uleb128 0xe
	.4byte	0x389
	.4byte	0x389
	.uleb128 0xf
	.byte	0x7
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x7
	.4byte	.LASF897
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF898
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF899
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF900
	.uleb128 0x10
	.4byte	.LASF932
	.byte	0x2
	.2byte	0x21e7
	.byte	0x3
	.4byte	0x3cb
	.uleb128 0x11
	.ascii	"__a\000"
	.byte	0x2
	.2byte	0x21e7
	.4byte	0x3cb
	.uleb128 0x11
	.ascii	"__b\000"
	.byte	0x2
	.2byte	0x21e7
	.4byte	0x372
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x318
	.uleb128 0x12
	.4byte	.LASF933
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.4byte	0x401
	.uleb128 0x13
	.ascii	"x\000"
	.byte	0x1
	.byte	0x5c
	.4byte	0x401
	.4byte	0x4086060
	.uleb128 0x13
	.ascii	"y\000"
	.byte	0x1
	.byte	0x5d
	.4byte	0x401
	.4byte	0x3000000
	.uleb128 0x14
	.ascii	"r\000"
	.byte	0x1
	.byte	0x5e
	.4byte	0x29
	.byte	0
	.uleb128 0xd
	.4byte	0x42
	.uleb128 0x15
	.4byte	.LASF904
	.byte	0x1
	.byte	0x11
	.4byte	.LFB1881
	.4byte	.LFE1881-.LFB1881
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x443
	.uleb128 0x16
	.4byte	.LASF901
	.byte	0x1
	.byte	0x11
	.4byte	0x3cb
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x16
	.4byte	.LASF902
	.byte	0x1
	.byte	0x11
	.4byte	0x3cb
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x16
	.4byte	.LASF903
	.byte	0x1
	.byte	0x11
	.4byte	0x3cb
	.uleb128 0x1
	.byte	0x52
	.byte	0
	.uleb128 0x17
	.4byte	0x3d1
	.4byte	.LFB1882
	.4byte	.LFE1882-.LFB1882
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x46e
	.uleb128 0x18
	.4byte	0x3dd
	.4byte	0x4086060
	.uleb128 0x18
	.4byte	0x3ea
	.4byte	0x3000000
	.uleb128 0x19
	.4byte	0x3f7
	.byte	0
	.uleb128 0x15
	.4byte	.LASF905
	.byte	0x1
	.byte	0x69
	.4byte	.LFB1883
	.4byte	.LFE1883-.LFB1883
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x561
	.uleb128 0x1a
	.ascii	"v\000"
	.byte	0x1
	.byte	0x69
	.4byte	0x372
	.4byte	.LLST0
	.uleb128 0x1b
	.4byte	.LASF906
	.byte	0x1
	.byte	0x6b
	.4byte	0x561
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.4byte	0x3a5
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.byte	0x1
	.byte	0x6c
	.4byte	0x4c4
	.uleb128 0x1d
	.4byte	0x3be
	.4byte	.LLST1
	.uleb128 0x1d
	.4byte	0x3b2
	.4byte	.LLST2
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL4
	.4byte	0x92d
	.4byte	0x4d8
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL5
	.4byte	0x92d
	.4byte	0x4ec
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL6
	.4byte	0x92d
	.4byte	0x500
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL7
	.4byte	0x92d
	.4byte	0x514
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL8
	.4byte	0x92d
	.4byte	0x528
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL9
	.4byte	0x92d
	.4byte	0x53c
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL10
	.4byte	0x92d
	.4byte	0x550
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.4byte	.LVL11
	.4byte	0x92d
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	0x318
	.4byte	0x571
	.uleb128 0xc
	.4byte	0xa2
	.byte	0x7
	.byte	0
	.uleb128 0x21
	.4byte	.LASF934
	.byte	0x1
	.byte	0x78
	.4byte	0x29
	.4byte	.LFB1884
	.4byte	.LFE1884-.LFB1884
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8ba
	.uleb128 0x22
	.4byte	.LASF907
	.byte	0x1
	.byte	0x78
	.4byte	0x29
	.4byte	.LLST3
	.uleb128 0x22
	.4byte	.LASF908
	.byte	0x1
	.byte	0x78
	.4byte	0x8ba
	.4byte	.LLST4
	.uleb128 0x23
	.4byte	.LASF909
	.byte	0x1
	.byte	0x7a
	.4byte	0x8c0
	.4byte	.LLST5
	.uleb128 0x23
	.4byte	.LASF910
	.byte	0x1
	.byte	0x7a
	.4byte	0x8c0
	.4byte	.LLST6
	.uleb128 0x23
	.4byte	.LASF911
	.byte	0x1
	.byte	0x7a
	.4byte	0x8c0
	.4byte	.LLST7
	.uleb128 0x23
	.4byte	.LASF912
	.byte	0x1
	.byte	0x7b
	.4byte	0x29
	.4byte	.LLST8
	.uleb128 0x14
	.ascii	"x\000"
	.byte	0x1
	.byte	0x7b
	.4byte	0x29
	.uleb128 0x14
	.ascii	"y\000"
	.byte	0x1
	.byte	0x7b
	.4byte	0x29
	.uleb128 0x24
	.ascii	"i\000"
	.byte	0x1
	.byte	0x7b
	.4byte	0x29
	.4byte	.LLST9
	.uleb128 0x23
	.4byte	.LASF913
	.byte	0x1
	.byte	0x7b
	.4byte	0x29
	.4byte	.LLST10
	.uleb128 0x25
	.ascii	"sum\000"
	.byte	0x1
	.byte	0x7c
	.4byte	0x29
	.uleb128 0x5
	.byte	0x3
	.4byte	sum.14618
	.uleb128 0x25
	.ascii	"max\000"
	.byte	0x1
	.byte	0x7d
	.4byte	0x29
	.uleb128 0x5
	.byte	0x3
	.4byte	max.14619
	.uleb128 0x25
	.ascii	"min\000"
	.byte	0x1
	.byte	0x7e
	.4byte	0x29
	.uleb128 0x5
	.byte	0x3
	.4byte	min.14620
	.uleb128 0x24
	.ascii	"avg\000"
	.byte	0x1
	.byte	0x7f
	.4byte	0x30
	.4byte	.LLST11
	.uleb128 0x1b
	.4byte	.LASF914
	.byte	0x1
	.byte	0x80
	.4byte	0x2ce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1b
	.4byte	.LASF915
	.byte	0x1
	.byte	0x80
	.4byte	0x2ce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x26
	.4byte	0x3d1
	.4byte	.LBB8
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x89
	.4byte	0x6a1
	.uleb128 0x27
	.4byte	.Ldebug_ranges0+0
	.uleb128 0x19
	.4byte	0x3f7
	.uleb128 0x18
	.4byte	0x3dd
	.4byte	0x4086060
	.uleb128 0x18
	.4byte	0x3ea
	.4byte	0x3000000
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL16
	.4byte	0x944
	.4byte	0x6b8
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL21
	.4byte	0x960
	.4byte	0x6cf
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL24
	.4byte	0x960
	.4byte	0x6e6
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL27
	.4byte	0x960
	.4byte	0x6fd
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL31
	.4byte	0x97b
	.4byte	0x728
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xa
	.2byte	0x200
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa
	.2byte	0x800
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	backImage
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL35
	.4byte	0x9a0
	.4byte	0x749
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x45
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC4
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL39
	.4byte	0x9a0
	.4byte	0x76a
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x47
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC9
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL42
	.4byte	0x97b
	.4byte	0x78e
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa
	.2byte	0x800
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	foreImage
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL44
	.4byte	0x9a0
	.4byte	0x7af
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x45
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC5
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL49
	.4byte	0x9cf
	.4byte	0x7c8
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL50
	.4byte	0x406
	.4byte	0x7f1
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	newImage
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	backImage
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	foreImage
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL51
	.4byte	0x9cf
	.4byte	0x80a
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL59
	.4byte	0x944
	.4byte	0x828
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC6
	.uleb128 0x1f
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL60
	.4byte	0x944
	.4byte	0x83f
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC7
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL61
	.4byte	0x944
	.4byte	0x856
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC8
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL62
	.4byte	0x9f5
	.4byte	0x881
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xa
	.2byte	0x200
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa
	.2byte	0x800
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	newImage
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL63
	.4byte	0xa1a
	.4byte	0x895
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.4byte	.LVL64
	.4byte	0xa1a
	.4byte	0x8a9
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.4byte	.LVL65
	.4byte	0xa1a
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xc1
	.uleb128 0x6
	.byte	0x4
	.4byte	0xce
	.uleb128 0x28
	.4byte	.LASF916
	.byte	0x5
	.byte	0xa8
	.4byte	0x297
	.uleb128 0x28
	.4byte	.LASF917
	.byte	0x5
	.byte	0xa9
	.4byte	0x297
	.uleb128 0x28
	.4byte	.LASF918
	.byte	0x5
	.byte	0xaa
	.4byte	0x297
	.uleb128 0xb
	.4byte	0x29
	.4byte	0x8fa
	.uleb128 0x29
	.4byte	0xa2
	.4byte	0x3ffff
	.byte	0
	.uleb128 0x2a
	.4byte	.LASF919
	.byte	0x1
	.byte	0xd
	.4byte	0x8e7
	.uleb128 0x5
	.byte	0x3
	.4byte	backImage
	.uleb128 0x2a
	.4byte	.LASF920
	.byte	0x1
	.byte	0xe
	.4byte	0x8e7
	.uleb128 0x5
	.byte	0x3
	.4byte	foreImage
	.uleb128 0x2a
	.4byte	.LASF921
	.byte	0x1
	.byte	0xf
	.4byte	0x8e7
	.uleb128 0x5
	.byte	0x3
	.4byte	newImage
	.uleb128 0x2b
	.4byte	.LASF922
	.byte	0x5
	.2byte	0x16a
	.4byte	0x29
	.4byte	0x944
	.uleb128 0x2c
	.4byte	0x2c3
	.uleb128 0x2d
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF923
	.byte	0x5
	.2byte	0x164
	.4byte	0x29
	.4byte	0x960
	.uleb128 0x2c
	.4byte	0x8c0
	.uleb128 0x2c
	.4byte	0x2c3
	.uleb128 0x2d
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF924
	.byte	0x5
	.2byte	0x110
	.4byte	0x8c0
	.4byte	0x97b
	.uleb128 0x2c
	.4byte	0x2c3
	.uleb128 0x2c
	.4byte	0x2c3
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF925
	.byte	0x5
	.2byte	0x2c5
	.4byte	0x37
	.4byte	0x9a0
	.uleb128 0x2c
	.4byte	0xbf
	.uleb128 0x2c
	.4byte	0x37
	.uleb128 0x2c
	.4byte	0x37
	.uleb128 0x2c
	.4byte	0x8c0
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF935
	.byte	0xa
	.byte	0
	.4byte	.LASF927
	.4byte	0x42
	.4byte	0x9c8
	.uleb128 0x2c
	.4byte	0x9c8
	.uleb128 0x2c
	.4byte	0x42
	.uleb128 0x2c
	.4byte	0x42
	.uleb128 0x2c
	.4byte	0xbf
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x9ce
	.uleb128 0x2f
	.uleb128 0x30
	.4byte	.LASF926
	.byte	0x8
	.byte	0x47
	.4byte	0x29
	.4byte	0x9e9
	.uleb128 0x2c
	.4byte	0x9e9
	.uleb128 0x2c
	.4byte	0x9ef
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2ce
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2f3
	.uleb128 0x2b
	.4byte	.LASF927
	.byte	0x5
	.2byte	0x2cb
	.4byte	0x37
	.4byte	0xa1a
	.uleb128 0x2c
	.4byte	0x9c8
	.uleb128 0x2c
	.4byte	0x37
	.uleb128 0x2c
	.4byte	0x37
	.uleb128 0x2c
	.4byte	0x8c0
	.byte	0
	.uleb128 0x31
	.4byte	.LASF936
	.byte	0x5
	.byte	0xed
	.4byte	0x29
	.uleb128 0x2c
	.4byte	0x8c0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x2119
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x2107
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL2
	.4byte	.LVL4-1
	.2byte	0x8
	.byte	0x90
	.uleb128 0x40
	.byte	0x93
	.uleb128 0x4
	.byte	0x90
	.uleb128 0x41
	.byte	0x93
	.uleb128 0x4
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL3
	.4byte	.LVL4-1
	.2byte	0x8
	.byte	0x90
	.uleb128 0x40
	.byte	0x93
	.uleb128 0x4
	.byte	0x90
	.uleb128 0x41
	.byte	0x93
	.uleb128 0x4
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL3
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL12
	.4byte	.LFE1883
	.2byte	0x3
	.byte	0x91
	.sleb128 -16
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL13
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL15
	.4byte	.LVL18
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL18
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL20
	.4byte	.LFE1884
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL14
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL17
	.4byte	.LVL18
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL19
	.4byte	.LVL28
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL28
	.4byte	.LFE1884
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL22
	.4byte	.LVL23
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL23
	.4byte	.LVL37
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL40
	.4byte	.LFE1884
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL25
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL26
	.4byte	.LFE1884
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL28
	.4byte	.LVL30
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL30
	.4byte	.LVL36
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL36
	.4byte	.LVL38
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL38
	.4byte	.LFE1884
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL32
	.4byte	.LVL33
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL33
	.4byte	.LVL34
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL40
	.4byte	.LVL41
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL41
	.4byte	.LVL42-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL42
	.4byte	.LVL43
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL45
	.4byte	.LVL46
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL46
	.4byte	.LVL56
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL56
	.4byte	.LVL59-1
	.2byte	0x2
	.byte	0x90
	.uleb128 0x4d
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL46
	.4byte	.LVL48
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL52
	.4byte	.LVL53
	.2byte	0x6
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL53
	.4byte	.LVL57
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL57
	.4byte	.LVL59-1
	.2byte	0x8
	.byte	0x91
	.sleb128 -44
	.byte	0x6
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL55
	.4byte	.LVL56
	.2byte	0x12
	.byte	0x3
	.4byte	sum.14618
	.byte	0x6
	.byte	0xf7
	.uleb128 0x29
	.byte	0xf7
	.uleb128 0x30
	.byte	0x77
	.sleb128 0
	.byte	0xf7
	.uleb128 0x29
	.byte	0xf7
	.uleb128 0x30
	.byte	0x1b
	.byte	0x9f
	.4byte	.LVL56
	.4byte	.LVL58
	.2byte	0x13
	.byte	0x3
	.4byte	sum.14618
	.byte	0x6
	.byte	0xf7
	.uleb128 0x29
	.byte	0xf7
	.uleb128 0x30
	.byte	0x92
	.uleb128 0x4d
	.sleb128 0
	.byte	0xf7
	.uleb128 0x29
	.byte	0xf7
	.uleb128 0x30
	.byte	0x1b
	.byte	0x9f
	.4byte	.LVL58
	.4byte	.LVL59-1
	.2byte	0x2
	.byte	0x90
	.uleb128 0x41
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB1884
	.4byte	.LFE1884-.LFB1884
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB8
	.4byte	.LBE8
	.4byte	.LBB11
	.4byte	.LBE11
	.4byte	0
	.4byte	0
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.LFB1884
	.4byte	.LFE1884
	.4byte	0
	.4byte	0
	.section	.debug_macro,"",%progbits
.Ldebug_macro0:
	.2byte	0x4
	.byte	0x2
	.4byte	.Ldebug_line0
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF1
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF2
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF3
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF4
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF5
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF6
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF7
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF8
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF9
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF10
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF11
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF12
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF13
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF14
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF15
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF16
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF17
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF18
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF19
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF20
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF21
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF22
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF23
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF25
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF26
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF27
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF32
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF33
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF34
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF36
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF37
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF38
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF39
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF40
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF41
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF42
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF43
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF44
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF45
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF46
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF48
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF49
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF50
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF51
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF52
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF53
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF54
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF55
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF56
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF57
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF58
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF59
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF60
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF61
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF62
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF63
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF64
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF65
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF66
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF67
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF68
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF69
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF70
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF71
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF72
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF73
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF74
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF75
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF76
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF77
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF78
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF79
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF80
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF81
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF82
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF83
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF84
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF85
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF86
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF87
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF88
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF89
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF90
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF91
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF92
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF93
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF94
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF95
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF96
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF97
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF98
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF99
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF100
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF101
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF102
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF103
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF104
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF105
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF106
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF107
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF108
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF109
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF110
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF111
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF112
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF113
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF114
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF115
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF116
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF117
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF118
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF119
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF120
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF121
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF122
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF123
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF124
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF125
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF126
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF127
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF128
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF129
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF130
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF131
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF132
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF133
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF134
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF135
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF136
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF137
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF138
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF139
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF140
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF141
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF142
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF143
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF144
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF145
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF146
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF147
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF148
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF149
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF150
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF151
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF152
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF153
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF154
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF155
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF156
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF157
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF158
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF159
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF160
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF161
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF162
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF163
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF164
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF165
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF166
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF167
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF168
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF169
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF170
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF171
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF172
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF173
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF174
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF175
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF176
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF177
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF178
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF179
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF180
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF181
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF182
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF183
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF184
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF185
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF186
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF187
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF188
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF189
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF190
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF191
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF192
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF193
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF194
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF195
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF196
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF197
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF198
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF199
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF200
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF201
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF202
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF203
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF204
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF205
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF206
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF207
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF208
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF209
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF210
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF211
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF212
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF213
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF214
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF215
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF216
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF217
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF218
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF219
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF220
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF221
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF222
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF223
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF224
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF225
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF226
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF227
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF228
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF229
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF230
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF231
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF232
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF233
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF234
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF235
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF236
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF237
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF238
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF239
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF240
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF241
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF242
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF243
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF244
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF245
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF246
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF247
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF248
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF249
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF250
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF251
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF252
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF253
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF254
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF255
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF256
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF257
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF258
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF259
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF260
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF261
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF262
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF263
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF264
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF265
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF266
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF267
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF268
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF269
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF270
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF271
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF272
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF273
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF274
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF275
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF276
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF277
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF278
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF279
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF280
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF281
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF282
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF283
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF284
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF285
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF286
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF287
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF288
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF289
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF290
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF291
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF292
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF293
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF294
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF295
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF296
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF297
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF298
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF299
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF300
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF301
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF302
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF303
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF304
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF305
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF306
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF307
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF308
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF309
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF310
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF311
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF312
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF313
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF314
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF315
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF316
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF317
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF318
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF319
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF320
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF321
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF322
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF323
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF324
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF325
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF326
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF327
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF328
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF329
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF330
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF331
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF332
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF333
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF334
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF335
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF336
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF337
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF338
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF339
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF340
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF341
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF342
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF343
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF344
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF345
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF346
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF347
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF348
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF349
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF350
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF351
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF352
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF353
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF354
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF355
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF356
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF357
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF358
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF359
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF360
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF361
	.file 11 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\stdc-predef.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0xb
	.byte	0x7
	.4byte	.Ldebug_macro1
	.byte	0x4
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x5
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF367
	.file 12 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\features.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xc
	.byte	0x7
	.4byte	.Ldebug_macro2
	.file 13 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\sys\\cdefs.h"
	.byte	0x3
	.uleb128 0x17a
	.uleb128 0xd
	.byte	0x7
	.4byte	.Ldebug_macro3
	.file 14 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\bits\\wordsize.h"
	.byte	0x3
	.uleb128 0x181
	.uleb128 0xe
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF482
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro4
	.byte	0x4
	.byte	0x5
	.uleb128 0x18a
	.4byte	.LASF490
	.file 15 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\gnu\\stubs.h"
	.byte	0x3
	.uleb128 0x192
	.uleb128 0xf
	.file 16 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\gnu\\stubs-hard.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0x10
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro6
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x3
	.byte	0x7
	.4byte	.Ldebug_macro7
	.byte	0x4
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x4
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF534
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xe
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF482
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro8
	.file 17 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\bits\\typesizes.h"
	.byte	0x3
	.uleb128 0x79
	.uleb128 0x11
	.byte	0x7
	.4byte	.Ldebug_macro9
	.byte	0x4
	.byte	0x6
	.uleb128 0xc0
	.4byte	.LASF585
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro10
	.byte	0x3
	.uleb128 0x4a
	.uleb128 0x6
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF593
	.file 18 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\_g_config.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x12
	.byte	0x7
	.4byte	.Ldebug_macro11
	.byte	0x3
	.uleb128 0xf
	.uleb128 0x3
	.byte	0x7
	.4byte	.Ldebug_macro12
	.byte	0x4
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF595
	.file 19 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\wchar.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x13
	.byte	0x7
	.4byte	.Ldebug_macro13
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro14
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro15
	.file 20 "c:\\program files\\ds-5\\sw\\gcc\\lib\\gcc\\arm-linux-gnueabihf\\4.8.3\\include\\stdarg.h"
	.byte	0x3
	.uleb128 0x31
	.uleb128 0x14
	.byte	0x7
	.4byte	.Ldebug_macro16
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro17
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro18
	.file 21 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\bits\\stdio_lim.h"
	.byte	0x3
	.uleb128 0xa4
	.uleb128 0x15
	.byte	0x7
	.4byte	.Ldebug_macro19
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro20
	.file 22 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\bits\\sys_errlist.h"
	.byte	0x3
	.uleb128 0x355
	.uleb128 0x16
	.byte	0x4
	.file 23 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\bits\\stdio.h"
	.byte	0x3
	.uleb128 0x3a6
	.uleb128 0x17
	.byte	0x7
	.4byte	.Ldebug_macro21
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x8
	.uleb128 0x8
	.byte	0x7
	.4byte	.Ldebug_macro22
	.file 24 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\time.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x18
	.byte	0x7
	.4byte	.Ldebug_macro23
	.byte	0x4
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF724
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x7
	.byte	0x7
	.4byte	.Ldebug_macro24
	.byte	0x4
	.file 25 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\sys\\select.h"
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0x19
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF727
	.file 26 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\bits\\select.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x1a
	.byte	0x7
	.4byte	.Ldebug_macro25
	.byte	0x4
	.file 27 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\bits\\sigset.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x1b
	.byte	0x7
	.4byte	.Ldebug_macro26
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro27
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x18
	.byte	0x7
	.4byte	.Ldebug_macro28
	.byte	0x4
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF724
	.byte	0x3
	.uleb128 0x2d
	.uleb128 0x7
	.byte	0x6
	.uleb128 0x63
	.4byte	.LASF726
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro29
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro30
	.byte	0x4
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF757
	.file 28 "c:\\program files\\ds-5\\sw\\gcc\\lib\\gcc\\arm-linux-gnueabihf\\4.8.3\\include\\stdint.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x1c
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x9
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF758
	.file 29 "c:\\program files\\ds-5\\sw\\gcc\\arm-linux-gnueabihf\\libc\\usr\\include\\bits\\wchar.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x1d
	.byte	0x7
	.4byte	.Ldebug_macro31
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xe
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF482
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro32
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF826
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdcpredef.h.19.13d357f53e03e35e37f3aa674f978c59,comdat
.Ldebug_macro1:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.4byte	.LASF362
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF363
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF364
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF365
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF366
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.features.h.19.222f0b0188d12d0a6541da5effaae25c,comdat
.Ldebug_macro2:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.4byte	.LASF368
	.byte	0x6
	.uleb128 0x65
	.4byte	.LASF369
	.byte	0x6
	.uleb128 0x66
	.4byte	.LASF370
	.byte	0x6
	.uleb128 0x67
	.4byte	.LASF371
	.byte	0x6
	.uleb128 0x68
	.4byte	.LASF372
	.byte	0x6
	.uleb128 0x69
	.4byte	.LASF373
	.byte	0x6
	.uleb128 0x6a
	.4byte	.LASF374
	.byte	0x6
	.uleb128 0x6b
	.4byte	.LASF375
	.byte	0x6
	.uleb128 0x6c
	.4byte	.LASF376
	.byte	0x6
	.uleb128 0x6d
	.4byte	.LASF377
	.byte	0x6
	.uleb128 0x6e
	.4byte	.LASF378
	.byte	0x6
	.uleb128 0x6f
	.4byte	.LASF379
	.byte	0x6
	.uleb128 0x70
	.4byte	.LASF380
	.byte	0x6
	.uleb128 0x71
	.4byte	.LASF381
	.byte	0x6
	.uleb128 0x72
	.4byte	.LASF382
	.byte	0x6
	.uleb128 0x73
	.4byte	.LASF383
	.byte	0x6
	.uleb128 0x74
	.4byte	.LASF384
	.byte	0x6
	.uleb128 0x75
	.4byte	.LASF385
	.byte	0x6
	.uleb128 0x76
	.4byte	.LASF386
	.byte	0x6
	.uleb128 0x77
	.4byte	.LASF387
	.byte	0x6
	.uleb128 0x78
	.4byte	.LASF388
	.byte	0x6
	.uleb128 0x79
	.4byte	.LASF389
	.byte	0x6
	.uleb128 0x7a
	.4byte	.LASF390
	.byte	0x6
	.uleb128 0x7b
	.4byte	.LASF391
	.byte	0x6
	.uleb128 0x7c
	.4byte	.LASF392
	.byte	0x6
	.uleb128 0x7d
	.4byte	.LASF393
	.byte	0x6
	.uleb128 0x7e
	.4byte	.LASF394
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF395
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF396
	.byte	0x6
	.uleb128 0xb9
	.4byte	.LASF397
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF398
	.byte	0x6
	.uleb128 0xbb
	.4byte	.LASF399
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF400
	.byte	0x6
	.uleb128 0xbd
	.4byte	.LASF401
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF402
	.byte	0x5
	.uleb128 0xe1
	.4byte	.LASF403
	.byte	0x6
	.uleb128 0xe3
	.4byte	.LASF404
	.byte	0x5
	.uleb128 0xe4
	.4byte	.LASF405
	.byte	0x6
	.uleb128 0xe5
	.4byte	.LASF406
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF407
	.byte	0x5
	.uleb128 0xf8
	.4byte	.LASF408
	.byte	0x5
	.uleb128 0xfc
	.4byte	.LASF409
	.byte	0x5
	.uleb128 0x100
	.4byte	.LASF410
	.byte	0x5
	.uleb128 0x104
	.4byte	.LASF411
	.byte	0x5
	.uleb128 0x108
	.4byte	.LASF412
	.byte	0x6
	.uleb128 0x109
	.4byte	.LASF371
	.byte	0x5
	.uleb128 0x10a
	.4byte	.LASF413
	.byte	0x6
	.uleb128 0x10b
	.4byte	.LASF370
	.byte	0x5
	.uleb128 0x10c
	.4byte	.LASF414
	.byte	0x5
	.uleb128 0x110
	.4byte	.LASF415
	.byte	0x6
	.uleb128 0x111
	.4byte	.LASF416
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF417
	.byte	0x5
	.uleb128 0x13c
	.4byte	.LASF418
	.byte	0x5
	.uleb128 0x140
	.4byte	.LASF419
	.byte	0x5
	.uleb128 0x144
	.4byte	.LASF420
	.byte	0x5
	.uleb128 0x148
	.4byte	.LASF421
	.byte	0x5
	.uleb128 0x15f
	.4byte	.LASF422
	.byte	0x6
	.uleb128 0x16c
	.4byte	.LASF423
	.byte	0x5
	.uleb128 0x16d
	.4byte	.LASF424
	.byte	0x5
	.uleb128 0x171
	.4byte	.LASF425
	.byte	0x5
	.uleb128 0x172
	.4byte	.LASF426
	.byte	0x5
	.uleb128 0x174
	.4byte	.LASF427
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.cdefs.h.19.deed8300036fdf53f6654237d4653cad,comdat
.Ldebug_macro3:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.4byte	.LASF428
	.byte	0x2
	.uleb128 0x22
	.ascii	"__P\000"
	.byte	0x6
	.uleb128 0x23
	.4byte	.LASF429
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF430
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF431
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF432
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF433
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF434
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF435
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF436
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF437
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF438
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF439
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF440
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF441
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF442
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF443
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF444
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF445
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF446
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF447
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF448
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF449
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF450
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF451
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF452
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF453
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF454
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF455
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF456
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF457
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF458
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF459
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF460
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF461
	.byte	0x5
	.uleb128 0xdc
	.4byte	.LASF462
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF463
	.byte	0x5
	.uleb128 0xed
	.4byte	.LASF464
	.byte	0x5
	.uleb128 0xf6
	.4byte	.LASF465
	.byte	0x5
	.uleb128 0xf7
	.4byte	.LASF466
	.byte	0x5
	.uleb128 0xff
	.4byte	.LASF467
	.byte	0x5
	.uleb128 0x10b
	.4byte	.LASF468
	.byte	0x5
	.uleb128 0x115
	.4byte	.LASF469
	.byte	0x5
	.uleb128 0x11e
	.4byte	.LASF470
	.byte	0x5
	.uleb128 0x126
	.4byte	.LASF471
	.byte	0x5
	.uleb128 0x12f
	.4byte	.LASF472
	.byte	0x5
	.uleb128 0x134
	.4byte	.LASF473
	.byte	0x5
	.uleb128 0x13c
	.4byte	.LASF474
	.byte	0x5
	.uleb128 0x147
	.4byte	.LASF475
	.byte	0x5
	.uleb128 0x148
	.4byte	.LASF476
	.byte	0x5
	.uleb128 0x156
	.4byte	.LASF477
	.byte	0x5
	.uleb128 0x157
	.4byte	.LASF478
	.byte	0x5
	.uleb128 0x16b
	.4byte	.LASF479
	.byte	0x5
	.uleb128 0x17a
	.4byte	.LASF480
	.byte	0x5
	.uleb128 0x17b
	.4byte	.LASF481
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.cdefs.h.407.c122ddb2157a4c1fbd957332b50319ec,comdat
.Ldebug_macro4:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x197
	.4byte	.LASF483
	.byte	0x5
	.uleb128 0x198
	.4byte	.LASF484
	.byte	0x5
	.uleb128 0x199
	.4byte	.LASF485
	.byte	0x5
	.uleb128 0x19a
	.4byte	.LASF486
	.byte	0x5
	.uleb128 0x19b
	.4byte	.LASF487
	.byte	0x5
	.uleb128 0x19d
	.4byte	.LASF488
	.byte	0x5
	.uleb128 0x19e
	.4byte	.LASF489
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stubshard.h.10.f345199155dd326dd0d8d8f7bb011cdd,comdat
.Ldebug_macro5:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF491
	.byte	0x5
	.uleb128 0xb
	.4byte	.LASF492
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF493
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF494
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF495
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF496
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF497
	.byte	0x5
	.uleb128 0x11
	.4byte	.LASF498
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF499
	.byte	0x5
	.uleb128 0x13
	.4byte	.LASF500
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF501
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF502
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF503
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF504
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF505
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF506
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF507
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF508
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF509
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF510
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdio.h.31.e39a94e203ad4e1d978c0fc68ce016ee,comdat
.Ldebug_macro6:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF511
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF512
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stddef.h.184.159df79b4ca79c76561572a55985524c,comdat
.Ldebug_macro7:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF513
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF514
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF515
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF516
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF517
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF518
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF519
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF520
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF521
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF522
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF523
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF524
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF525
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF526
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF527
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF528
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF529
	.byte	0x6
	.uleb128 0xea
	.4byte	.LASF530
	.byte	0x6
	.uleb128 0x18d
	.4byte	.LASF531
	.byte	0x5
	.uleb128 0x192
	.4byte	.LASF532
	.byte	0x6
	.uleb128 0x198
	.4byte	.LASF533
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.types.h.89.4d6fd2ae30c22e96d2f6820288d98fd1,comdat
.Ldebug_macro8:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF535
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF536
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF537
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF538
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF539
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF540
	.byte	0x5
	.uleb128 0x60
	.4byte	.LASF541
	.byte	0x5
	.uleb128 0x61
	.4byte	.LASF542
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF543
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF544
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF545
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF546
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF547
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF548
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF549
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.typesizes.h.24.2d14ad3b2b7de983a3c88949abdb786c,comdat
.Ldebug_macro9:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF550
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF551
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF552
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF553
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF554
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF555
	.byte	0x5
	.uleb128 0x22
	.4byte	.LASF556
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF557
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF558
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF559
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF560
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF561
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF562
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF563
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF564
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF565
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF566
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF567
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF568
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF569
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF570
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF571
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF572
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF573
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF574
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF575
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF576
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF577
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF578
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF579
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF580
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF581
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF582
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF583
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF584
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdio.h.36.2dd12c1fd035242ad5cfd0152a01be5a,comdat
.Ldebug_macro10:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF586
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF587
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF588
	.byte	0x6
	.uleb128 0x3a
	.4byte	.LASF589
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF590
	.byte	0x6
	.uleb128 0x44
	.4byte	.LASF591
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF592
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4._g_config.h.5.b0f37d9e474454cf6e459063458db32f,comdat
.Ldebug_macro11:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x5
	.4byte	.LASF594
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF511
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF512
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stddef.h.234.5fa44232df77937e0d1fcac1468785aa,comdat
.Ldebug_macro12:
	.2byte	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xea
	.4byte	.LASF530
	.byte	0x6
	.uleb128 0x18d
	.4byte	.LASF531
	.byte	0x5
	.uleb128 0x192
	.4byte	.LASF532
	.byte	0x6
	.uleb128 0x198
	.4byte	.LASF533
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.wchar.h.80.628010d306c9ecbd260f9d4475ab1db1,comdat
.Ldebug_macro13:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF596
	.byte	0x6
	.uleb128 0x60
	.4byte	.LASF597
	.byte	0x6
	.uleb128 0x383
	.4byte	.LASF597
	.byte	0x6
	.uleb128 0x384
	.4byte	.LASF598
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4._g_config.h.46.5187c97b14fd664662cb32e6b94fc49e,comdat
.Ldebug_macro14:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF599
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF600
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF601
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF602
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF603
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF604
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.libio.h.33.a775b9ecae273f33bc59931e9891e4ca,comdat
.Ldebug_macro15:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF605
	.byte	0x5
	.uleb128 0x22
	.4byte	.LASF606
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF607
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF608
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF609
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF610
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF611
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF612
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF613
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF614
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF615
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF616
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF617
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF618
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdarg.h.34.3a23a216c0c293b3d2ea2e89281481e6,comdat
.Ldebug_macro16:
	.2byte	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x22
	.4byte	.LASF619
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF620
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.libio.h.51.981a9f406a7830caa4638ead01d5e3e6,comdat
.Ldebug_macro17:
	.2byte	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x33
	.4byte	.LASF621
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF622
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF623
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF624
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF625
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF626
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF627
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF628
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF629
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF630
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF631
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF632
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF633
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF634
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF635
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF636
	.byte	0x5
	.uleb128 0x60
	.4byte	.LASF637
	.byte	0x5
	.uleb128 0x61
	.4byte	.LASF638
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF639
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF640
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF641
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF642
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF643
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF644
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF645
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF646
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF647
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF648
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF649
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF650
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF651
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF652
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF653
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF654
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF655
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF656
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF657
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF658
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF659
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF660
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF661
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF662
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF663
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF664
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF665
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF666
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF667
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF668
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF669
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF670
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF671
	.byte	0x5
	.uleb128 0xf7
	.4byte	.LASF672
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF673
	.byte	0x5
	.uleb128 0x144
	.4byte	.LASF674
	.byte	0x5
	.uleb128 0x145
	.4byte	.LASF675
	.byte	0x5
	.uleb128 0x146
	.4byte	.LASF676
	.byte	0x5
	.uleb128 0x190
	.4byte	.LASF677
	.byte	0x5
	.uleb128 0x195
	.4byte	.LASF678
	.byte	0x5
	.uleb128 0x198
	.4byte	.LASF679
	.byte	0x5
	.uleb128 0x19c
	.4byte	.LASF680
	.byte	0x5
	.uleb128 0x1af
	.4byte	.LASF681
	.byte	0x5
	.uleb128 0x1b0
	.4byte	.LASF682
	.byte	0x5
	.uleb128 0x1ba
	.4byte	.LASF683
	.byte	0x5
	.uleb128 0x1c8
	.4byte	.LASF684
	.byte	0x5
	.uleb128 0x1c9
	.4byte	.LASF685
	.byte	0x5
	.uleb128 0x1ca
	.4byte	.LASF686
	.byte	0x5
	.uleb128 0x1cb
	.4byte	.LASF687
	.byte	0x5
	.uleb128 0x1cc
	.4byte	.LASF688
	.byte	0x5
	.uleb128 0x1cd
	.4byte	.LASF689
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdio.h.80.2c0b67e94eb93fd8dd1cc22c150ce71c,comdat
.Ldebug_macro18:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF690
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF691
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF692
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF693
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF694
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF695
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF696
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF697
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF698
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF699
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF700
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdio_lim.h.23.557290a6cddeba0587f574f29e3a5fb9,comdat
.Ldebug_macro19:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF701
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF702
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF703
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF704
	.byte	0x6
	.uleb128 0x24
	.4byte	.LASF705
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF706
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdio.h.172.df21df34a7396d7da2e08f9b617d582f,comdat
.Ldebug_macro20:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF707
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF708
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF709
	.byte	0x5
	.uleb128 0x21f
	.4byte	.LASF710
	.byte	0x5
	.uleb128 0x249
	.4byte	.LASF711
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdio.h.26.cae64f7ada9bb8327a89dba6a5e93655,comdat
.Ldebug_macro21:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF712
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF713
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF714
	.byte	0x6
	.uleb128 0xbe
	.4byte	.LASF715
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.time.h.19.6377dec83381c3d889358cb2a9520705,comdat
.Ldebug_macro22:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.4byte	.LASF716
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF717
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.time.h.66.fabbe98e49a6888799357034317bd924,comdat
.Ldebug_macro23:
	.2byte	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x42
	.4byte	.LASF718
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF719
	.byte	0x6
	.uleb128 0x52
	.4byte	.LASF720
	.byte	0x6
	.uleb128 0x5e
	.4byte	.LASF721
	.byte	0x6
	.uleb128 0x6a
	.4byte	.LASF722
	.byte	0x6
	.uleb128 0x7f
	.4byte	.LASF723
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.time.h.25.72fdfa5826e4e33a45f01b6b43c97e79,comdat
.Ldebug_macro24:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF725
	.byte	0x6
	.uleb128 0x63
	.4byte	.LASF726
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.select.h.25.df647f04fce2d846f134ede6a14ddf91,comdat
.Ldebug_macro25:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF728
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF729
	.byte	0x5
	.uleb128 0x22
	.4byte	.LASF730
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF731
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.sigset.h.20.f36413b6d2364ad847d3db53fb03e683,comdat
.Ldebug_macro26:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF732
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF733
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.select.h.36.f76c3b9e55c871743863013cc4cc14c9,comdat
.Ldebug_macro27:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF734
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF717
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF735
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.time.h.66.e70ce69790c975f0efb369340c432e0b,comdat
.Ldebug_macro28:
	.2byte	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x42
	.4byte	.LASF718
	.byte	0x6
	.uleb128 0x52
	.4byte	.LASF720
	.byte	0x6
	.uleb128 0x5e
	.4byte	.LASF721
	.byte	0x6
	.uleb128 0x6a
	.4byte	.LASF722
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF736
	.byte	0x6
	.uleb128 0x7f
	.4byte	.LASF723
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.select.h.49.5062e7117766526526e41607c5714bde,comdat
.Ldebug_macro29:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF737
	.byte	0x6
	.uleb128 0x39
	.4byte	.LASF738
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF739
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF740
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF741
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF742
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF743
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF744
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF745
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF746
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF747
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF748
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.time.h.95.19e19be2f6af7176753b7f579b4c0939,comdat
.Ldebug_macro30:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF749
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF750
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF751
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF752
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF753
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF754
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF755
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF756
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro31:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF759
	.byte	0x5
	.uleb128 0x22
	.4byte	.LASF760
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF761
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdint.h.35.9f025416f1ed612f8b49c3a99c465d1b,comdat
.Ldebug_macro32:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF762
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF763
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF764
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF99
	.byte	0x5
	.uleb128 0x95
	.4byte	.LASF107
	.byte	0x5
	.uleb128 0x9b
	.4byte	.LASF765
	.byte	0x5
	.uleb128 0x9c
	.4byte	.LASF766
	.byte	0x5
	.uleb128 0x9d
	.4byte	.LASF767
	.byte	0x5
	.uleb128 0x9e
	.4byte	.LASF768
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF769
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF770
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF771
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF772
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF773
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF774
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF775
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF776
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF777
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF778
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF779
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF780
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF781
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF782
	.byte	0x5
	.uleb128 0xb4
	.4byte	.LASF783
	.byte	0x5
	.uleb128 0xb5
	.4byte	.LASF784
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF785
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF786
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF787
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF788
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF789
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF790
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF791
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF792
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF793
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF794
	.byte	0x5
	.uleb128 0xcf
	.4byte	.LASF795
	.byte	0x5
	.uleb128 0xd1
	.4byte	.LASF796
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF797
	.byte	0x5
	.uleb128 0xd9
	.4byte	.LASF798
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF799
	.byte	0x5
	.uleb128 0xdc
	.4byte	.LASF800
	.byte	0x5
	.uleb128 0xe5
	.4byte	.LASF801
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF802
	.byte	0x5
	.uleb128 0xe7
	.4byte	.LASF803
	.byte	0x5
	.uleb128 0xec
	.4byte	.LASF804
	.byte	0x5
	.uleb128 0xee
	.4byte	.LASF805
	.byte	0x5
	.uleb128 0xf1
	.4byte	.LASF806
	.byte	0x5
	.uleb128 0xfb
	.4byte	.LASF807
	.byte	0x5
	.uleb128 0xfc
	.4byte	.LASF808
	.byte	0x5
	.uleb128 0x100
	.4byte	.LASF809
	.byte	0x5
	.uleb128 0x101
	.4byte	.LASF810
	.byte	0x5
	.uleb128 0x107
	.4byte	.LASF811
	.byte	0x5
	.uleb128 0x10d
	.4byte	.LASF812
	.byte	0x5
	.uleb128 0x10e
	.4byte	.LASF813
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF814
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF815
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF816
	.byte	0x5
	.uleb128 0x117
	.4byte	.LASF817
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF818
	.byte	0x5
	.uleb128 0x11c
	.4byte	.LASF819
	.byte	0x5
	.uleb128 0x120
	.4byte	.LASF820
	.byte	0x5
	.uleb128 0x121
	.4byte	.LASF821
	.byte	0x5
	.uleb128 0x122
	.4byte	.LASF822
	.byte	0x5
	.uleb128 0x126
	.4byte	.LASF823
	.byte	0x5
	.uleb128 0x12e
	.4byte	.LASF824
	.byte	0x5
	.uleb128 0x12f
	.4byte	.LASF825
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF693:
	.ascii	"_IOFBF 0\000"
.LASF356:
	.ascii	"__linux__ 1\000"
.LASF631:
	.ascii	"_IOS_NOREPLACE 64\000"
.LASF182:
	.ascii	"__DEC128_EPSILON__ 1E-33DL\000"
.LASF629:
	.ascii	"_IOS_TRUNC 16\000"
.LASF604:
	.ascii	"_G_BUFSIZ 8192\000"
.LASF73:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF46:
	.ascii	"__UINT32_TYPE__ unsigned int\000"
.LASF312:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2\000"
.LASF303:
	.ascii	"__CHAR_UNSIGNED__ 1\000"
.LASF836:
	.ascii	"size_t\000"
.LASF184:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF841:
	.ascii	"sizetype\000"
.LASF71:
	.ascii	"__LONG_LONG_MAX__ 9223372036854775807LL\000"
.LASF334:
	.ascii	"__ARM_ARCH_PROFILE 65\000"
.LASF256:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF726:
	.ascii	"__need_timeval\000"
.LASF248:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF825:
	.ascii	"UINTMAX_C(c) c ## ULL\000"
.LASF181:
	.ascii	"__DEC128_MAX__ 9.999999999999999999999999999999999E"
	.ascii	"6144DL\000"
.LASF226:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF75:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF471:
	.ascii	"__attribute_warn_unused_result__ __attribute__ ((__"
	.ascii	"warn_unused_result__))\000"
.LASF383:
	.ascii	"__USE_XOPEN2K8XSI\000"
.LASF697:
	.ascii	"SEEK_SET 0\000"
.LASF559:
	.ascii	"__OFF64_T_TYPE __SQUAD_TYPE\000"
.LASF249:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF541:
	.ascii	"__SQUAD_TYPE __quad_t\000"
.LASF542:
	.ascii	"__UQUAD_TYPE __u_quad_t\000"
.LASF455:
	.ascii	"__flexarr []\000"
.LASF561:
	.ascii	"__RLIM_T_TYPE __ULONGWORD_TYPE\000"
.LASF817:
	.ascii	"INT16_C(c) c\000"
.LASF121:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF423:
	.ascii	"__GNU_LIBRARY__\000"
.LASF140:
	.ascii	"__DBL_MAX_10_EXP__ 308\000"
.LASF196:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF622:
	.ascii	"_IO_va_list __gnuc_va_list\000"
.LASF262:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF661:
	.ascii	"_IO_HEX 0100\000"
.LASF232:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF857:
	.ascii	"_IO_save_end\000"
.LASF348:
	.ascii	"__ARM_NEON_FP 4\000"
.LASF269:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF27:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF31:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF172:
	.ascii	"__DEC64_MAX_EXP__ 385\000"
.LASF799:
	.ascii	"UINT_FAST32_MAX (4294967295U)\000"
.LASF132:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF40:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF546:
	.ascii	"__ULONG32_TYPE unsigned long int\000"
.LASF231:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF155:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF151:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF149:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF101:
	.ascii	"__UINT8_C(c) c\000"
.LASF811:
	.ascii	"SIZE_MAX (4294967295U)\000"
.LASF41:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF357:
	.ascii	"linux 1\000"
.LASF930:
	.ascii	"D:\\\\NCSU\\\\Courses\\\\ECE 785 ACD\\\\Workspace\\"
	.ascii	"\\AlphaBlend\\\\Debug\000"
.LASF802:
	.ascii	"INTPTR_MAX (2147483647)\000"
.LASF786:
	.ascii	"UINT_LEAST16_MAX (65535)\000"
.LASF850:
	.ascii	"_IO_write_base\000"
.LASF466:
	.ascii	"__attribute_noinline__ __attribute__ ((__noinline__"
	.ascii	"))\000"
.LASF304:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1\000"
.LASF849:
	.ascii	"_IO_read_base\000"
.LASF1:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF585:
	.ascii	"__STD_TYPE\000"
.LASF728:
	.ascii	"__FD_ZERO(s) do { unsigned int __i; fd_set *__arr ="
	.ascii	" (s); for (__i = 0; __i < sizeof (fd_set) / sizeof "
	.ascii	"(__fd_mask); ++__i) __FDS_BITS (__arr)[__i] = 0; } "
	.ascii	"while (0)\000"
.LASF694:
	.ascii	"_IOLBF 1\000"
.LASF796:
	.ascii	"INT_FAST64_MAX (__INT64_C(9223372036854775807))\000"
.LASF59:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF34:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF866:
	.ascii	"_lock\000"
.LASF514:
	.ascii	"__SIZE_T__ \000"
.LASF17:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF888:
	.ascii	"__builtin_neon_qi\000"
.LASF618:
	.ascii	"__need___va_list \000"
.LASF91:
	.ascii	"__UINT64_MAX__ 18446744073709551615ULL\000"
.LASF373:
	.ascii	"__USE_POSIX\000"
.LASF192:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF754:
	.ascii	"timercmp(a,b,CMP) (((a)->tv_sec == (b)->tv_sec) ? ("
	.ascii	"(a)->tv_usec CMP (b)->tv_usec) : ((a)->tv_sec CMP ("
	.ascii	"b)->tv_sec))\000"
.LASF686:
	.ascii	"_IO_funlockfile(_fp) \000"
.LASF425:
	.ascii	"__GLIBC__ 2\000"
.LASF743:
	.ascii	"FD_SETSIZE __FD_SETSIZE\000"
.LASF682:
	.ascii	"_IO_ferror_unlocked(__fp) (((__fp)->_flags & _IO_ER"
	.ascii	"R_SEEN) != 0)\000"
.LASF800:
	.ascii	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))\000"
.LASF790:
	.ascii	"INT_FAST16_MIN (-2147483647-1)\000"
.LASF855:
	.ascii	"_IO_save_base\000"
.LASF898:
	.ascii	"__builtin_neon_uhi\000"
.LASF628:
	.ascii	"_IOS_APPEND 8\000"
.LASF539:
	.ascii	"__SLONGWORD_TYPE long int\000"
.LASF529:
	.ascii	"__size_t \000"
.LASF765:
	.ascii	"INT8_MIN (-128)\000"
.LASF803:
	.ascii	"UINTPTR_MAX (4294967295U)\000"
.LASF427:
	.ascii	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIB"
	.ascii	"C_MINOR__ >= ((maj) << 16) + (min))\000"
.LASF188:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF456:
	.ascii	"__REDIRECT(name,proto,alias) name proto __asm__ (__"
	.ascii	"ASMNAME (#alias))\000"
.LASF518:
	.ascii	"_T_SIZE \000"
.LASF605:
	.ascii	"_IO_fpos_t _G_fpos_t\000"
.LASF278:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF26:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF268:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF774:
	.ascii	"UINT16_MAX (65535)\000"
.LASF685:
	.ascii	"_IO_flockfile(_fp) \000"
.LASF859:
	.ascii	"_chain\000"
.LASF919:
	.ascii	"backImage\000"
.LASF273:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF787:
	.ascii	"UINT_LEAST32_MAX (4294967295U)\000"
.LASF696:
	.ascii	"BUFSIZ _IO_BUFSIZ\000"
.LASF276:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF386:
	.ascii	"__USE_FILE_OFFSET64\000"
.LASF863:
	.ascii	"_cur_column\000"
.LASF609:
	.ascii	"_IO_off_t __off_t\000"
.LASF67:
	.ascii	"__SCHAR_MAX__ 127\000"
.LASF168:
	.ascii	"__DEC32_EPSILON__ 1E-6DF\000"
.LASF531:
	.ascii	"NULL\000"
.LASF245:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF732:
	.ascii	"_SIGSET_H_types 1\000"
.LASF649:
	.ascii	"_IO_IS_FILEBUF 0x2000\000"
.LASF85:
	.ascii	"__INT16_MAX__ 32767\000"
.LASF676:
	.ascii	"_IO_stderr ((_IO_FILE*)(&_IO_2_1_stderr_))\000"
.LASF344:
	.ascii	"__VFP_FP__ 1\000"
.LASF216:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF108:
	.ascii	"__INT_FAST8_MAX__ 127\000"
.LASF494:
	.ascii	"__stub_fchflags \000"
.LASF912:
	.ascii	"result\000"
.LASF568:
	.ascii	"__FSFILCNT64_T_TYPE __UQUAD_TYPE\000"
.LASF927:
	.ascii	"fwrite\000"
.LASF740:
	.ascii	"__FD_ELT(d) ((d) / __NFDBITS)\000"
.LASF396:
	.ascii	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_M"
	.ascii	"INOR__ >= ((maj) << 16) + (min))\000"
.LASF377:
	.ascii	"__USE_XOPEN\000"
.LASF430:
	.ascii	"__LEAF , __leaf__\000"
.LASF902:
	.ascii	"bgimage\000"
.LASF382:
	.ascii	"__USE_XOPEN2K8\000"
.LASF678:
	.ascii	"_IO_getc_unlocked(_fp) (_IO_BE ((_fp)->_IO_read_ptr"
	.ascii	" >= (_fp)->_IO_read_end, 0) ? __uflow (_fp) : *(uns"
	.ascii	"igned char *) (_fp)->_IO_read_ptr++)\000"
.LASF333:
	.ascii	"__ARM_SIZEOF_WCHAR_T 32\000"
.LASF893:
	.ascii	"__builtin_neon_sf\000"
.LASF52:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF890:
	.ascii	"__builtin_neon_si\000"
.LASF767:
	.ascii	"INT32_MIN (-2147483647-1)\000"
.LASF234:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF240:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF839:
	.ascii	"long int\000"
.LASF115:
	.ascii	"__UINT_FAST64_MAX__ 18446744073709551615ULL\000"
.LASF756:
	.ascii	"timersub(a,b,result) do { (result)->tv_sec = (a)->t"
	.ascii	"v_sec - (b)->tv_sec; (result)->tv_usec = (a)->tv_us"
	.ascii	"ec - (b)->tv_usec; if ((result)->tv_usec < 0) { --("
	.ascii	"result)->tv_sec; (result)->tv_usec += 1000000; } } "
	.ascii	"while (0)\000"
.LASF143:
	.ascii	"__DBL_MIN__ ((double)2.2250738585072014e-308L)\000"
.LASF734:
	.ascii	"__sigset_t_defined \000"
.LASF415:
	.ascii	"__USE_XOPEN2K8 1\000"
.LASF577:
	.ascii	"__CLOCKID_T_TYPE __S32_TYPE\000"
.LASF636:
	.ascii	"_IO_USER_BUF 1\000"
.LASF72:
	.ascii	"__WCHAR_MAX__ 4294967295U\000"
.LASF178:
	.ascii	"__DEC128_MIN_EXP__ (-6142)\000"
.LASF725:
	.ascii	"_STRUCT_TIMEVAL 1\000"
.LASF296:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF513:
	.ascii	"__size_t__ \000"
.LASF81:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF30:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF48:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF578:
	.ascii	"__TIMER_T_TYPE void *\000"
.LASF932:
	.ascii	"vst1_u8\000"
.LASF584:
	.ascii	"__FD_SETSIZE 1024\000"
.LASF876:
	.ascii	"_IO_marker\000"
.LASF109:
	.ascii	"__INT_FAST16_MAX__ 2147483647\000"
.LASF290:
	.ascii	"__TA_FBIT__ 63\000"
.LASF349:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF222:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF674:
	.ascii	"_IO_stdin ((_IO_FILE*)(&_IO_2_1_stdin_))\000"
.LASF84:
	.ascii	"__INT8_MAX__ 127\000"
.LASF566:
	.ascii	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE\000"
.LASF762:
	.ascii	"__int8_t_defined \000"
.LASF525:
	.ascii	"_SIZE_T_DECLARED \000"
.LASF437:
	.ascii	"__CONCAT(x,y) x ## y\000"
.LASF488:
	.ascii	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name,"
	.ascii	" proto, alias)\000"
.LASF407:
	.ascii	"_POSIX_C_SOURCE 200809L\000"
.LASF125:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF16:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF565:
	.ascii	"__FSBLKCNT_T_TYPE __ULONGWORD_TYPE\000"
.LASF365:
	.ascii	"__STDC_ISO_10646__ 201103L\000"
.LASF463:
	.ascii	"__attribute_pure__ __attribute__ ((__pure__))\000"
.LASF809:
	.ascii	"SIG_ATOMIC_MIN (-2147483647-1)\000"
.LASF485:
	.ascii	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __TH"
	.ascii	"ROW\000"
.LASF20:
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
.LASF681:
	.ascii	"_IO_feof_unlocked(__fp) (((__fp)->_flags & _IO_EOF_"
	.ascii	"SEEN) != 0)\000"
.LASF362:
	.ascii	"_STDC_PREDEF_H 1\000"
.LASF910:
	.ascii	"bgFile\000"
.LASF815:
	.ascii	"WINT_MAX (4294967295u)\000"
.LASF174:
	.ascii	"__DEC64_MAX__ 9.999999999999999E384DD\000"
.LASF457:
	.ascii	"__REDIRECT_NTH(name,proto,alias) name proto __asm__"
	.ascii	" (__ASMNAME (#alias)) __THROW\000"
.LASF595:
	.ascii	"__need_mbstate_t \000"
.LASF298:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF698:
	.ascii	"SEEK_CUR 1\000"
.LASF127:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF798:
	.ascii	"UINT_FAST16_MAX (4294967295U)\000"
.LASF714:
	.ascii	"fwrite_unlocked(ptr,size,n,stream) (__extension__ ("
	.ascii	"(__builtin_constant_p (size) && __builtin_constant_"
	.ascii	"p (n) && (size_t) (size) * (size_t) (n) <= 8 && (si"
	.ascii	"ze_t) (size) != 0) ? ({ const char *__ptr = (const "
	.ascii	"char *) (ptr); FILE *__stream = (stream); size_t __"
	.ascii	"cnt; for (__cnt = (size_t) (size) * (size_t) (n); _"
	.ascii	"_cnt > 0; --__cnt) if (_IO_putc_unlocked (*__ptr++,"
	.ascii	" __stream) == EOF) break; ((size_t) (size) * (size_"
	.ascii	"t) (n) - __cnt) / (size_t) (size); }) : (((__builti"
	.ascii	"n_constant_p (size) && (size_t) (size) == 0) || (__"
	.ascii	"builtin_constant_p (n) && (size_t) (n) == 0)) ? ((v"
	.ascii	"oid) (ptr), (void) (stream), (void) (size), (void) "
	.ascii	"(n), (size_t) 0) : fwrite_unlocked (ptr, size, n, s"
	.ascii	"tream))))\000"
.LASF832:
	.ascii	"signed char\000"
.LASF886:
	.ascii	"uint8_t\000"
.LASF617:
	.ascii	"_IO_wint_t wint_t\000"
.LASF536:
	.ascii	"__U16_TYPE unsigned short int\000"
.LASF439:
	.ascii	"__ptr_t void *\000"
.LASF194:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF702:
	.ascii	"TMP_MAX 238328\000"
.LASF258:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF582:
	.ascii	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE\000"
.LASF311:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2\000"
.LASF4:
	.ascii	"__GNUC_PATCHLEVEL__ 3\000"
.LASF145:
	.ascii	"__DBL_DENORM_MIN__ ((double)4.9406564584124654e-324"
	.ascii	"L)\000"
.LASF680:
	.ascii	"_IO_putc_unlocked(_ch,_fp) (_IO_BE ((_fp)->_IO_writ"
	.ascii	"e_ptr >= (_fp)->_IO_write_end, 0) ? __overflow (_fp"
	.ascii	", (unsigned char) (_ch)) : (unsigned char) (*(_fp)-"
	.ascii	">_IO_write_ptr++ = (_ch)))\000"
.LASF564:
	.ascii	"__BLKCNT64_T_TYPE __SQUAD_TYPE\000"
.LASF621:
	.ascii	"_IO_va_list\000"
.LASF670:
	.ascii	"_IO_DONT_CLOSE 0100000\000"
.LASF337:
	.ascii	"__ARM_ARCH_ISA_ARM 1\000"
.LASF524:
	.ascii	"_BSD_SIZE_T_DEFINED_ \000"
.LASF62:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF526:
	.ascii	"___int_size_t_h \000"
.LASF660:
	.ascii	"_IO_OCT 040\000"
.LASF414:
	.ascii	"__USE_ISOC99 1\000"
.LASF225:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF309:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 2\000"
.LASF436:
	.ascii	"__PMT(args) args\000"
.LASF197:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF547:
	.ascii	"__S64_TYPE __quad_t\000"
.LASF644:
	.ascii	"_IO_IN_BACKUP 0x100\000"
.LASF936:
	.ascii	"fclose\000"
.LASF7:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF598:
	.ascii	"__need_wint_t\000"
.LASF746:
	.ascii	"FD_CLR(fd,fdsetp) __FD_CLR (fd, fdsetp)\000"
.LASF139:
	.ascii	"__DBL_MAX_EXP__ 1024\000"
.LASF272:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF105:
	.ascii	"__UINT32_C(c) c ## U\000"
.LASF840:
	.ascii	"__off64_t\000"
.LASF691:
	.ascii	"__off_t_defined \000"
.LASF766:
	.ascii	"INT16_MIN (-32767-1)\000"
.LASF18:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF259:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF747:
	.ascii	"FD_ISSET(fd,fdsetp) __FD_ISSET (fd, fdsetp)\000"
.LASF721:
	.ascii	"__clockid_time_t\000"
.LASF96:
	.ascii	"__INT_LEAST32_MAX__ 2147483647\000"
.LASF435:
	.ascii	"__P(args) args\000"
.LASF426:
	.ascii	"__GLIBC_MINOR__ 19\000"
.LASF522:
	.ascii	"_SIZE_T_DEFINED_ \000"
.LASF452:
	.ascii	"__warndecl(name,msg) extern void name (void) __attr"
	.ascii	"ibute__((__warning__ (msg)))\000"
.LASF575:
	.ascii	"__DADDR_T_TYPE __S32_TYPE\000"
.LASF391:
	.ascii	"__USE_GNU\000"
.LASF320:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF33:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF501:
	.ascii	"__stub_process_vm_readv \000"
.LASF464:
	.ascii	"__attribute_const__ __attribute__ ((__const__))\000"
.LASF295:
	.ascii	"__USA_IBIT__ 16\000"
.LASF780:
	.ascii	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
	.ascii	"\000"
.LASF305:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1\000"
.LASF66:
	.ascii	"__GXX_ABI_VERSION 1002\000"
.LASF63:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF782:
	.ascii	"INT_LEAST16_MAX (32767)\000"
.LASF129:
	.ascii	"__FLT_MIN__ 1.1754943508222875e-38F\000"
.LASF511:
	.ascii	"__need_size_t \000"
.LASF284:
	.ascii	"__HA_FBIT__ 7\000"
.LASF201:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF394:
	.ascii	"__KERNEL_STRICT_NAMES\000"
.LASF822:
	.ascii	"UINT32_C(c) c ## U\000"
.LASF904:
	.ascii	"alphaBlend_c\000"
.LASF451:
	.ascii	"__fortify_function __extern_always_inline __attribu"
	.ascii	"te_artificial__\000"
.LASF695:
	.ascii	"_IONBF 2\000"
.LASF640:
	.ascii	"_IO_EOF_SEEN 0x10\000"
.LASF358:
	.ascii	"__unix 1\000"
.LASF931:
	.ascii	"_IO_lock_t\000"
.LASF190:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF158:
	.ascii	"__LDBL_EPSILON__ 2.2204460492503131e-16L\000"
.LASF380:
	.ascii	"__USE_XOPEN2K\000"
.LASF191:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF381:
	.ascii	"__USE_XOPEN2KXSI\000"
.LASF880:
	.ascii	"timeval\000"
.LASF153:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF475:
	.ascii	"__extern_inline extern __inline __attribute__ ((__g"
	.ascii	"nu_inline__))\000"
.LASF146:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF688:
	.ascii	"_IO_cleanup_region_start(_fct,_fp) \000"
.LASF883:
	.ascii	"timezone\000"
.LASF410:
	.ascii	"__USE_POSIX199309 1\000"
.LASF653:
	.ascii	"_IO_FLAGS2_NOTCANCEL 2\000"
.LASF793:
	.ascii	"INT_FAST8_MAX (127)\000"
.LASF794:
	.ascii	"INT_FAST16_MAX (2147483647)\000"
.LASF781:
	.ascii	"INT_LEAST8_MAX (127)\000"
.LASF288:
	.ascii	"__DA_FBIT__ 31\000"
.LASF250:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF847:
	.ascii	"_IO_read_ptr\000"
.LASF131:
	.ascii	"__FLT_DENORM_MIN__ 1.4012984643248171e-45F\000"
.LASF807:
	.ascii	"PTRDIFF_MIN (-2147483647-1)\000"
.LASF94:
	.ascii	"__INT_LEAST16_MAX__ 32767\000"
.LASF375:
	.ascii	"__USE_POSIX199309\000"
.LASF772:
	.ascii	"INT64_MAX (__INT64_C(9223372036854775807))\000"
.LASF588:
	.ascii	"__FILE_defined 1\000"
.LASF87:
	.ascii	"__INT64_MAX__ 9223372036854775807LL\000"
.LASF879:
	.ascii	"_pos\000"
.LASF130:
	.ascii	"__FLT_EPSILON__ 1.1920928955078125e-7F\000"
.LASF916:
	.ascii	"stdin\000"
.LASF804:
	.ascii	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)\000"
.LASF379:
	.ascii	"__USE_UNIX98\000"
.LASF56:
	.ascii	"__INT_FAST8_TYPE__ signed char\000"
.LASF32:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF395:
	.ascii	"__KERNEL_STRICT_NAMES \000"
.LASF742:
	.ascii	"__FDS_BITS(set) ((set)->__fds_bits)\000"
.LASF481:
	.ascii	"__glibc_likely(cond) __builtin_expect ((cond), 1)\000"
.LASF594:
	.ascii	"_G_config_h 1\000"
.LASF751:
	.ascii	"ITIMER_PROF ITIMER_PROF\000"
.LASF553:
	.ascii	"__GID_T_TYPE __U32_TYPE\000"
.LASF651:
	.ascii	"_IO_USER_LOCK 0x8000\000"
.LASF313:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 2\000"
.LASF218:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF540:
	.ascii	"__ULONGWORD_TYPE unsigned long int\000"
.LASF229:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF530:
	.ascii	"__need_size_t\000"
.LASF317:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF858:
	.ascii	"_markers\000"
.LASF244:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF690:
	.ascii	"_VA_LIST_DEFINED \000"
.LASF641:
	.ascii	"_IO_ERR_SEEN 0x20\000"
.LASF915:
	.ascii	"newTv\000"
.LASF715:
	.ascii	"__STDIO_INLINE\000"
.LASF717:
	.ascii	"__need_time_t \000"
.LASF703:
	.ascii	"FILENAME_MAX 4096\000"
.LASF789:
	.ascii	"INT_FAST8_MIN (-128)\000"
.LASF161:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF706:
	.ascii	"FOPEN_MAX 16\000"
.LASF507:
	.ascii	"__stub_setlogin \000"
.LASF167:
	.ascii	"__DEC32_MAX__ 9.999999E96DF\000"
.LASF602:
	.ascii	"_G_IO_IO_FILE_VERSION 0x20001\000"
.LASF687:
	.ascii	"_IO_ftrylockfile(_fp) \000"
.LASF620:
	.ascii	"__GNUC_VA_LIST \000"
.LASF750:
	.ascii	"ITIMER_VIRTUAL ITIMER_VIRTUAL\000"
.LASF922:
	.ascii	"printf\000"
.LASF83:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF241:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF562:
	.ascii	"__RLIM64_T_TYPE __UQUAD_TYPE\000"
.LASF610:
	.ascii	"_IO_off64_t __off64_t\000"
.LASF773:
	.ascii	"UINT8_MAX (255)\000"
.LASF592:
	.ascii	"_STDIO_USES_IOSTREAM \000"
.LASF882:
	.ascii	"tv_usec\000"
.LASF587:
	.ascii	"__need___FILE \000"
.LASF615:
	.ascii	"_IO_BUFSIZ _G_BUFSIZ\000"
.LASF596:
	.ascii	"____mbstate_t_defined 1\000"
.LASF209:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF119:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF112:
	.ascii	"__UINT_FAST8_MAX__ 255\000"
.LASF792:
	.ascii	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)\000"
.LASF176:
	.ascii	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD\000"
.LASF193:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF532:
	.ascii	"NULL ((void *)0)\000"
.LASF111:
	.ascii	"__INT_FAST64_MAX__ 9223372036854775807LL\000"
.LASF189:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF257:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF497:
	.ascii	"__stub_getmsg \000"
.LASF867:
	.ascii	"_offset\000"
.LASF354:
	.ascii	"__gnu_linux__ 1\000"
.LASF411:
	.ascii	"__USE_POSIX199506 1\000"
.LASF86:
	.ascii	"__INT32_MAX__ 2147483647\000"
.LASF236:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF586:
	.ascii	"__need_FILE \000"
.LASF416:
	.ascii	"_ATFILE_SOURCE\000"
.LASF400:
	.ascii	"_BSD_SOURCE 1\000"
.LASF612:
	.ascii	"_IO_uid_t __uid_t\000"
.LASF264:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF656:
	.ascii	"_IO_LEFT 02\000"
.LASF318:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 2\000"
.LASF325:
	.ascii	"__ARM_FEATURE_QBIT 1\000"
.LASF330:
	.ascii	"__ARM_FEATURE_CLZ 1\000"
.LASF8:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF829:
	.ascii	"unsigned char\000"
.LASF639:
	.ascii	"_IO_NO_WRITES 8\000"
.LASF104:
	.ascii	"__UINT_LEAST32_MAX__ 4294967295U\000"
.LASF738:
	.ascii	"__NFDBITS\000"
.LASF744:
	.ascii	"NFDBITS __NFDBITS\000"
.LASF599:
	.ascii	"_G_va_list __gnuc_va_list\000"
.LASF657:
	.ascii	"_IO_RIGHT 04\000"
.LASF144:
	.ascii	"__DBL_EPSILON__ ((double)2.2204460492503131e-16L)\000"
.LASF748:
	.ascii	"FD_ZERO(fdsetp) __FD_ZERO (fdsetp)\000"
.LASF206:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF935:
	.ascii	"__builtin_fwrite\000"
.LASF11:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF133:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF364:
	.ascii	"__STDC_IEC_559_COMPLEX__ 1\000"
.LASF237:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF627:
	.ascii	"_IOS_ATEND 4\000"
.LASF152:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF805:
	.ascii	"INTMAX_MAX (__INT64_C(9223372036854775807))\000"
.LASF78:
	.ascii	"__INTMAX_MAX__ 9223372036854775807LL\000"
.LASF387:
	.ascii	"__USE_BSD\000"
.LASF319:
	.ascii	"__GCC_HAVE_DWARF2_CFI_ASM 1\000"
.LASF186:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF534:
	.ascii	"_BITS_TYPES_H 1\000"
.LASF287:
	.ascii	"__SA_IBIT__ 16\000"
.LASF810:
	.ascii	"SIG_ATOMIC_MAX (2147483647)\000"
.LASF431:
	.ascii	"__LEAF_ATTR __attribute__ ((__leaf__))\000"
.LASF654:
	.ascii	"_IO_FLAGS2_USER_WBUF 8\000"
.LASF45:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF404:
	.ascii	"_POSIX_SOURCE\000"
.LASF679:
	.ascii	"_IO_peekc_unlocked(_fp) (_IO_BE ((_fp)->_IO_read_pt"
	.ascii	"r >= (_fp)->_IO_read_end, 0) && __underflow (_fp) ="
	.ascii	"= EOF ? EOF : *(unsigned char *) (_fp)->_IO_read_pt"
	.ascii	"r)\000"
.LASF413:
	.ascii	"__USE_ISOC95 1\000"
.LASF544:
	.ascii	"__UWORD_TYPE unsigned int\000"
.LASF506:
	.ascii	"__stub_revoke \000"
.LASF165:
	.ascii	"__DEC32_MAX_EXP__ 97\000"
.LASF517:
	.ascii	"_T_SIZE_ \000"
.LASF707:
	.ascii	"stdin stdin\000"
.LASF611:
	.ascii	"_IO_pid_t __pid_t\000"
.LASF255:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF198:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF770:
	.ascii	"INT16_MAX (32767)\000"
.LASF479:
	.ascii	"__restrict_arr __restrict\000"
.LASF350:
	.ascii	"__ARM_ARCH_7A__ 1\000"
.LASF88:
	.ascii	"__UINT8_MAX__ 255\000"
.LASF432:
	.ascii	"__THROW __attribute__ ((__nothrow__ __LEAF))\000"
.LASF512:
	.ascii	"__need_NULL \000"
.LASF368:
	.ascii	"_FEATURES_H 1\000"
.LASF398:
	.ascii	"_DEFAULT_SOURCE 1\000"
.LASF874:
	.ascii	"_unused2\000"
.LASF814:
	.ascii	"WINT_MIN (0u)\000"
.LASF837:
	.ascii	"__quad_t\000"
.LASF69:
	.ascii	"__INT_MAX__ 2147483647\000"
.LASF483:
	.ascii	"__LDBL_REDIR1(name,proto,alias) name proto\000"
.LASF761:
	.ascii	"__WCHAR_MIN __WCHAR_MIN__\000"
.LASF55:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF465:
	.ascii	"__attribute_used__ __attribute__ ((__used__))\000"
.LASF643:
	.ascii	"_IO_LINKED 0x80\000"
.LASF310:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2\000"
.LASF550:
	.ascii	"_BITS_TYPESIZES_H 1\000"
.LASF9:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF899:
	.ascii	"__builtin_neon_usi\000"
.LASF405:
	.ascii	"_POSIX_SOURCE 1\000"
.LASF281:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF665:
	.ascii	"_IO_SHOWPOS 02000\000"
.LASF12:
	.ascii	"__OPTIMIZE__ 1\000"
.LASF672:
	.ascii	"_IO_file_flags _flags\000"
.LASF907:
	.ascii	"argc\000"
.LASF495:
	.ascii	"__stub_fdetach \000"
.LASF403:
	.ascii	"__USE_POSIX_IMPLICITLY 1\000"
.LASF710:
	.ascii	"getc(_fp) _IO_getc (_fp)\000"
.LASF862:
	.ascii	"_old_offset\000"
.LASF159:
	.ascii	"__LDBL_DENORM_MIN__ 4.9406564584124654e-324L\000"
.LASF326:
	.ascii	"__ARM_FEATURE_SAT 1\000"
.LASF220:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF908:
	.ascii	"argv\000"
.LASF557:
	.ascii	"__NLINK_T_TYPE __UWORD_TYPE\000"
.LASF607:
	.ascii	"_IO_size_t size_t\000"
.LASF307:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1\000"
.LASF821:
	.ascii	"UINT16_C(c) c\000"
.LASF727:
	.ascii	"_SYS_SELECT_H 1\000"
.LASF128:
	.ascii	"__FLT_MAX__ 3.4028234663852886e+38F\000"
.LASF239:
	.ascii	"__UACCUM_FBIT__ 16\000"
.LASF884:
	.ascii	"tz_minuteswest\000"
.LASF203:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF567:
	.ascii	"__FSFILCNT_T_TYPE __ULONGWORD_TYPE\000"
.LASF374:
	.ascii	"__USE_POSIX2\000"
.LASF275:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF173:
	.ascii	"__DEC64_MIN__ 1E-383DD\000"
.LASF315:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 2\000"
.LASF251:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF442:
	.ascii	"__END_DECLS \000"
.LASF156:
	.ascii	"__LDBL_MAX__ 1.7976931348623157e+308L\000"
.LASF336:
	.ascii	"__ARM_ARCH 7\000"
.LASF520:
	.ascii	"_SIZE_T_ \000"
.LASF669:
	.ascii	"_IO_STDIO 040000\000"
.LASF120:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF834:
	.ascii	"long long int\000"
.LASF38:
	.ascii	"__CHAR32_TYPE__ unsigned int\000"
.LASF74:
	.ascii	"__WINT_MAX__ 4294967295U\000"
.LASF533:
	.ascii	"__need_NULL\000"
.LASF700:
	.ascii	"P_tmpdir \"/tmp\"\000"
.LASF79:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF401:
	.ascii	"_SVID_SOURCE\000"
.LASF758:
	.ascii	"_STDINT_H 1\000"
.LASF58:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF347:
	.ascii	"__ARM_NEON 1\000"
.LASF285:
	.ascii	"__HA_IBIT__ 8\000"
.LASF445:
	.ascii	"__USING_NAMESPACE_STD(name) \000"
.LASF302:
	.ascii	"__GNUC_GNU_INLINE__ 1\000"
.LASF316:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 2\000"
.LASF683:
	.ascii	"_IO_PENDING_OUTPUT_COUNT(_fp) ((_fp)->_IO_write_ptr"
	.ascii	" - (_fp)->_IO_write_base)\000"
.LASF735:
	.ascii	"__need_timespec \000"
.LASF470:
	.ascii	"__nonnull(params) __attribute__ ((__nonnull__ param"
	.ascii	"s))\000"
.LASF736:
	.ascii	"__timespec_defined 1\000"
.LASF806:
	.ascii	"UINTMAX_MAX (__UINT64_C(18446744073709551615))\000"
.LASF699:
	.ascii	"SEEK_END 2\000"
.LASF549:
	.ascii	"__STD_TYPE __extension__ typedef\000"
.LASF816:
	.ascii	"INT8_C(c) c\000"
.LASF496:
	.ascii	"__stub_get_kernel_syms \000"
.LASF852:
	.ascii	"_IO_write_end\000"
.LASF43:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF204:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF23:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF468:
	.ascii	"__attribute_format_arg__(x) __attribute__ ((__forma"
	.ascii	"t_arg__ (x)))\000"
.LASF321:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF429:
	.ascii	"__PMT\000"
.LASF648:
	.ascii	"_IO_IS_APPENDING 0x1000\000"
.LASF202:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF292:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF500:
	.ascii	"__stub_lchmod \000"
.LASF570:
	.ascii	"__ID_T_TYPE __U32_TYPE\000"
.LASF579:
	.ascii	"__BLKSIZE_T_TYPE __SLONGWORD_TYPE\000"
.LASF704:
	.ascii	"L_ctermid 9\000"
.LASF28:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF97:
	.ascii	"__INT32_C(c) c\000"
.LASF630:
	.ascii	"_IOS_NOCREATE 32\000"
.LASF819:
	.ascii	"INT64_C(c) c ## LL\000"
.LASF624:
	.ascii	"EOF (-1)\000"
.LASF301:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF110:
	.ascii	"__INT_FAST32_MAX__ 2147483647\000"
.LASF199:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF280:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF548:
	.ascii	"__U64_TYPE __u_quad_t\000"
.LASF154:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF712:
	.ascii	"__STDIO_INLINE __extern_inline\000"
.LASF801:
	.ascii	"INTPTR_MIN (-2147483647-1)\000"
.LASF769:
	.ascii	"INT8_MAX (127)\000"
.LASF853:
	.ascii	"_IO_buf_base\000"
.LASF861:
	.ascii	"_flags2\000"
.LASF633:
	.ascii	"_IO_MAGIC 0xFBAD0000\000"
.LASF877:
	.ascii	"_next\000"
.LASF828:
	.ascii	"unsigned int\000"
.LASF503:
	.ascii	"__stub_putmsg \000"
.LASF123:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF573:
	.ascii	"__USECONDS_T_TYPE __U32_TYPE\000"
.LASF230:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF389:
	.ascii	"__USE_MISC\000"
.LASF117:
	.ascii	"__UINTPTR_MAX__ 4294967295U\000"
.LASF384:
	.ascii	"__USE_LARGEFILE\000"
.LASF122:
	.ascii	"__FLT_DIG__ 6\000"
.LASF243:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF905:
	.ascii	"print_vec\000"
.LASF412:
	.ascii	"__USE_XOPEN2K 1\000"
.LASF118:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF711:
	.ascii	"putc(_ch,_fp) _IO_putc (_ch, _fp)\000"
.LASF576:
	.ascii	"__KEY_T_TYPE __S32_TYPE\000"
.LASF868:
	.ascii	"__pad1\000"
.LASF869:
	.ascii	"__pad2\000"
.LASF870:
	.ascii	"__pad3\000"
.LASF871:
	.ascii	"__pad4\000"
.LASF872:
	.ascii	"__pad5\000"
.LASF538:
	.ascii	"__U32_TYPE unsigned int\000"
.LASF878:
	.ascii	"_sbuf\000"
.LASF274:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF462:
	.ascii	"__attribute_alloc_size__(params) __attribute__ ((__"
	.ascii	"alloc_size__ params))\000"
.LASF171:
	.ascii	"__DEC64_MIN_EXP__ (-382)\000"
.LASF242:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF843:
	.ascii	"__suseconds_t\000"
.LASF677:
	.ascii	"_IO_BE(expr,res) __builtin_expect ((expr), res)\000"
.LASF207:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF323:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF499:
	.ascii	"__stub_gtty \000"
.LASF0:
	.ascii	"__STDC__ 1\000"
.LASF784:
	.ascii	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))\000"
.LASF777:
	.ascii	"INT_LEAST8_MIN (-128)\000"
.LASF29:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF54:
	.ascii	"__UINT_LEAST32_TYPE__ unsigned int\000"
.LASF44:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF583:
	.ascii	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE\000"
.LASF363:
	.ascii	"__STDC_IEC_559__ 1\000"
.LASF472:
	.ascii	"__wur \000"
.LASF39:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF664:
	.ascii	"_IO_UPPERCASE 01000\000"
.LASF545:
	.ascii	"__SLONG32_TYPE long int\000"
.LASF731:
	.ascii	"__FD_ISSET(d,s) ((__FDS_BITS (s)[__FD_ELT (d)] & __"
	.ascii	"FD_MASK (d)) != 0)\000"
.LASF177:
	.ascii	"__DEC128_MANT_DIG__ 34\000"
.LASF846:
	.ascii	"_flags\000"
.LASF2:
	.ascii	"__GNUC__ 4\000"
.LASF294:
	.ascii	"__USA_FBIT__ 16\000"
.LASF709:
	.ascii	"stderr stderr\000"
.LASF424:
	.ascii	"__GNU_LIBRARY__ 6\000"
.LASF552:
	.ascii	"__UID_T_TYPE __U32_TYPE\000"
.LASF718:
	.ascii	"__need_clock_t\000"
.LASF134:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF933:
	.ascii	"enable_runfast\000"
.LASF492:
	.ascii	"__stub_create_module \000"
.LASF873:
	.ascii	"_mode\000"
.LASF208:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF433:
	.ascii	"__THROWNL __attribute__ ((__nothrow__))\000"
.LASF484:
	.ascii	"__LDBL_REDIR(name,proto) name proto\000"
.LASF438:
	.ascii	"__STRING(x) #x\000"
.LASF755:
	.ascii	"timeradd(a,b,result) do { (result)->tv_sec = (a)->t"
	.ascii	"v_sec + (b)->tv_sec; (result)->tv_usec = (a)->tv_us"
	.ascii	"ec + (b)->tv_usec; if ((result)->tv_usec >= 1000000"
	.ascii	") { ++(result)->tv_sec; (result)->tv_usec -= 100000"
	.ascii	"0; } } while (0)\000"
.LASF92:
	.ascii	"__INT_LEAST8_MAX__ 127\000"
.LASF332:
	.ascii	"__ARM_SIZEOF_MINIMAL_ENUM 4\000"
.LASF335:
	.ascii	"__arm__ 1\000"
.LASF730:
	.ascii	"__FD_CLR(d,s) ((void) (__FDS_BITS (s)[__FD_ELT(d)] "
	.ascii	"&= ~__FD_MASK(d)))\000"
.LASF482:
	.ascii	"__WORDSIZE 32\000"
.LASF163:
	.ascii	"__DEC32_MANT_DIG__ 7\000"
.LASF752:
	.ascii	"timerisset(tvp) ((tvp)->tv_sec || (tvp)->tv_usec)\000"
.LASF24:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF443:
	.ascii	"__BEGIN_NAMESPACE_STD \000"
.LASF291:
	.ascii	"__TA_IBIT__ 64\000"
.LASF487:
	.ascii	"__LDBL_REDIR_DECL(name) \000"
.LASF844:
	.ascii	"char\000"
.LASF113:
	.ascii	"__UINT_FAST16_MAX__ 4294967295U\000"
.LASF434:
	.ascii	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
	.ascii	"\000"
.LASF489:
	.ascii	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NT"
	.ascii	"H (name, proto, alias)\000"
.LASF515:
	.ascii	"_SIZE_T \000"
.LASF638:
	.ascii	"_IO_NO_READS 4\000"
.LASF763:
	.ascii	"__uint32_t_defined \000"
.LASF889:
	.ascii	"__builtin_neon_hi\000"
.LASF341:
	.ascii	"__ARM_ARCH_ISA_THUMB 2\000"
.LASF106:
	.ascii	"__UINT_LEAST64_MAX__ 18446744073709551615ULL\000"
.LASF590:
	.ascii	"____FILE_defined 1\000"
.LASF645:
	.ascii	"_IO_LINE_BUF 0x200\000"
.LASF896:
	.ascii	"uint8x8_t\000"
.LASF459:
	.ascii	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__,"
	.ascii	" cname)\000"
.LASF637:
	.ascii	"_IO_UNBUFFERED 2\000"
.LASF613:
	.ascii	"_IO_iconv_t _G_iconv_t\000"
.LASF560:
	.ascii	"__PID_T_TYPE __S32_TYPE\000"
.LASF614:
	.ascii	"_IO_HAVE_ST_BLKSIZE _G_HAVE_ST_BLKSIZE\000"
.LASF200:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF328:
	.ascii	"__ARM_32BIT_STATE 1\000"
.LASF891:
	.ascii	"__builtin_neon_di\000"
.LASF667:
	.ascii	"_IO_FIXED 010000\000"
.LASF93:
	.ascii	"__INT8_C(c) c\000"
.LASF205:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF830:
	.ascii	"short unsigned int\000"
.LASF623:
	.ascii	"_IO_UNIFIED_JUMPTABLES 1\000"
.LASF137:
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
.LASF519:
	.ascii	"__SIZE_T \000"
.LASF845:
	.ascii	"FILE\000"
.LASF42:
	.ascii	"__INT32_TYPE__ int\000"
.LASF901:
	.ascii	"fgimage\000"
.LASF729:
	.ascii	"__FD_SET(d,s) ((void) (__FDS_BITS (s)[__FD_ELT(d)] "
	.ascii	"|= __FD_MASK(d)))\000"
.LASF929:
	.ascii	"../main.c\000"
.LASF580:
	.ascii	"__FSID_T_TYPE struct { int __val[2]; }\000"
.LASF371:
	.ascii	"__USE_ISOC95\000"
.LASF658:
	.ascii	"_IO_INTERNAL 010\000"
.LASF370:
	.ascii	"__USE_ISOC99\000"
.LASF448:
	.ascii	"__USING_NAMESPACE_C99(name) \000"
.LASF701:
	.ascii	"L_tmpnam 20\000"
.LASF103:
	.ascii	"__UINT16_C(c) c\000"
.LASF378:
	.ascii	"__USE_XOPEN_EXTENDED\000"
.LASF749:
	.ascii	"ITIMER_REAL ITIMER_REAL\000"
.LASF160:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF473:
	.ascii	"__always_inline __inline __attribute__ ((__always_i"
	.ascii	"nline__))\000"
.LASF306:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1\000"
.LASF420:
	.ascii	"__USE_SVID 1\000"
.LASF441:
	.ascii	"__BEGIN_DECLS \000"
.LASF107:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF720:
	.ascii	"__need_time_t\000"
.LASF662:
	.ascii	"_IO_SHOWBASE 0200\000"
.LASF788:
	.ascii	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
	.ascii	"\000"
.LASF367:
	.ascii	"_STDIO_H 1\000"
.LASF195:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF764:
	.ascii	"__intptr_t_defined \000"
.LASF25:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF170:
	.ascii	"__DEC64_MANT_DIG__ 16\000"
.LASF835:
	.ascii	"long long unsigned int\000"
.LASF124:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF608:
	.ascii	"_IO_ssize_t __ssize_t\000"
.LASF372:
	.ascii	"__USE_ISOCXX11\000"
.LASF523:
	.ascii	"_SIZE_T_DEFINED \000"
.LASF329:
	.ascii	"__ARM_FEATURE_LDREX 15\000"
.LASF692:
	.ascii	"__ssize_t_defined \000"
.LASF270:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF277:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF444:
	.ascii	"__END_NAMESPACE_STD \000"
.LASF785:
	.ascii	"UINT_LEAST8_MAX (255)\000"
.LASF831:
	.ascii	"long unsigned int\000"
.LASF57:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF597:
	.ascii	"__need_mbstate_t\000"
.LASF212:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF53:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF247:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF37:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF684:
	.ascii	"_IO_peekc(_fp) _IO_peekc_unlocked (_fp)\000"
.LASF716:
	.ascii	"_SYS_TIME_H 1\000"
.LASF771:
	.ascii	"INT32_MAX (2147483647)\000"
.LASF102:
	.ascii	"__UINT_LEAST16_MAX__ 65535\000"
.LASF376:
	.ascii	"__USE_POSIX199506\000"
.LASF282:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF818:
	.ascii	"INT32_C(c) c\000"
.LASF838:
	.ascii	"__off_t\000"
.LASF260:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF14:
	.ascii	"__FINITE_MATH_ONLY__ 1\000"
.LASF911:
	.ascii	"outFile\000"
.LASF214:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF399:
	.ascii	"_BSD_SOURCE\000"
.LASF606:
	.ascii	"_IO_fpos64_t _G_fpos64_t\000"
.LASF642:
	.ascii	"_IO_DELETE_DONT_CLOSE 0x40\000"
.LASF689:
	.ascii	"_IO_cleanup_region_end(_Doit) \000"
.LASF252:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF655:
	.ascii	"_IO_SKIPWS 01\000"
.LASF510:
	.ascii	"__stub_stty \000"
.LASF504:
	.ascii	"__stub_putpmsg \000"
.LASF211:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF797:
	.ascii	"UINT_FAST8_MAX (255)\000"
.LASF271:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF169:
	.ascii	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF\000"
.LASF453:
	.ascii	"__warnattr(msg) __attribute__((__warning__ (msg)))\000"
.LASF402:
	.ascii	"_SVID_SOURCE 1\000"
.LASF842:
	.ascii	"__time_t\000"
.LASF521:
	.ascii	"_BSD_SIZE_T_ \000"
.LASF450:
	.ascii	"__bos0(ptr) __builtin_object_size (ptr, 0)\000"
.LASF626:
	.ascii	"_IOS_OUTPUT 2\000"
.LASF98:
	.ascii	"__INT_LEAST64_MAX__ 9223372036854775807LL\000"
.LASF663:
	.ascii	"_IO_SHOWPOINT 0400\000"
.LASF671:
	.ascii	"_IO_BOOLALPHA 0200000\000"
.LASF928:
	.ascii	"GNU C 4.8.3 20140401 (prerelease) -fpreprocessed -m"
	.ascii	"vectorize-with-neon-quad -march=armv7-a -mcpu=corte"
	.ascii	"x-a8 -mfloat-abi=hard -mfpu=neon -mthumb -mtls-dial"
	.ascii	"ect=gnu -g3 -O3 -ftree-vectorize -ftree-vectorizer-"
	.ascii	"verbose=2 -funsafe-math-optimizations -ffast-math -"
	.ascii	"funroll-loops -fmessage-length=0\000"
.LASF446:
	.ascii	"__BEGIN_NAMESPACE_C99 \000"
.LASF537:
	.ascii	"__S32_TYPE int\000"
.LASF345:
	.ascii	"__ARM_FP 12\000"
.LASF775:
	.ascii	"UINT32_MAX (4294967295U)\000"
.LASF77:
	.ascii	"__SIZE_MAX__ 4294967295U\000"
.LASF856:
	.ascii	"_IO_backup_base\000"
.LASF283:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF865:
	.ascii	"_shortbuf\000"
.LASF286:
	.ascii	"__SA_FBIT__ 15\000"
.LASF508:
	.ascii	"__stub_sigreturn \000"
.LASF554:
	.ascii	"__INO_T_TYPE __ULONGWORD_TYPE\000"
.LASF813:
	.ascii	"WCHAR_MAX __WCHAR_MAX\000"
.LASF759:
	.ascii	"_BITS_WCHAR_H 1\000"
.LASF361:
	.ascii	"__ELF__ 1\000"
.LASF343:
	.ascii	"__THUMBEL__ 1\000"
.LASF324:
	.ascii	"__ARM_FEATURE_DSP 1\000"
.LASF421:
	.ascii	"__USE_ATFILE 1\000"
.LASF369:
	.ascii	"__USE_ISOC11\000"
.LASF647:
	.ascii	"_IO_CURRENTLY_PUTTING 0x800\000"
.LASF265:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF116:
	.ascii	"__INTPTR_MAX__ 2147483647\000"
.LASF509:
	.ascii	"__stub_sstk \000"
.LASF650:
	.ascii	"_IO_BAD_SEEN 0x4000\000"
.LASF634:
	.ascii	"_OLD_STDIO_MAGIC 0xFABC0000\000"
.LASF913:
	.ascii	"time\000"
.LASF254:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF50:
	.ascii	"__INT_LEAST32_TYPE__ int\000"
.LASF80:
	.ascii	"__UINTMAX_MAX__ 18446744073709551615ULL\000"
.LASF36:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF126:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF346:
	.ascii	"__ARM_NEON__ 1\000"
.LASF279:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF914:
	.ascii	"oldTv\000"
.LASF3:
	.ascii	"__GNUC_MINOR__ 8\000"
.LASF753:
	.ascii	"timerclear(tvp) ((tvp)->tv_sec = (tvp)->tv_usec = 0"
	.ascii	")\000"
.LASF35:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF162:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF314:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 2\000"
.LASF924:
	.ascii	"fopen\000"
.LASF491:
	.ascii	"__stub_chflags \000"
.LASF739:
	.ascii	"__NFDBITS (8 * (int) sizeof (__fd_mask))\000"
.LASF892:
	.ascii	"__builtin_neon_hf\000"
.LASF528:
	.ascii	"_SIZET_ \000"
.LASF233:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF148:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF823:
	.ascii	"UINT64_C(c) c ## ULL\000"
.LASF217:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF179:
	.ascii	"__DEC128_MAX_EXP__ 6145\000"
.LASF76:
	.ascii	"__PTRDIFF_MAX__ 2147483647\000"
.LASF854:
	.ascii	"_IO_buf_end\000"
.LASF227:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF64:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF65:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF476:
	.ascii	"__extern_always_inline extern __always_inline __att"
	.ascii	"ribute__ ((__gnu_inline__))\000"
.LASF300:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF183:
	.ascii	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000"
	.ascii	"000000001E-6143DL\000"
.LASF136:
	.ascii	"__DBL_DIG__ 15\000"
.LASF213:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF571:
	.ascii	"__CLOCK_T_TYPE __SLONGWORD_TYPE\000"
.LASF469:
	.ascii	"__attribute_format_strfmon__(a,b) __attribute__ ((_"
	.ascii	"_format__ (__strfmon__, a, b)))\000"
.LASF22:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF47:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF180:
	.ascii	"__DEC128_MIN__ 1E-6143DL\000"
.LASF99:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF601:
	.ascii	"_G_HAVE_MREMAP 1\000"
.LASF923:
	.ascii	"fprintf\000"
.LASF826:
	.ascii	"_GCC_WRAP_STDINT_H \000"
.LASF921:
	.ascii	"newImage\000"
.LASF157:
	.ascii	"__LDBL_MIN__ 2.2250738585072014e-308L\000"
.LASF705:
	.ascii	"FOPEN_MAX\000"
.LASF418:
	.ascii	"__USE_MISC 1\000"
.LASF338:
	.ascii	"__APCS_32__ 1\000"
.LASF235:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF768:
	.ascii	"INT64_MIN (-__INT64_C(9223372036854775807)-1)\000"
.LASF60:
	.ascii	"__UINT_FAST8_TYPE__ unsigned char\000"
.LASF89:
	.ascii	"__UINT16_MAX__ 65535\000"
.LASF90:
	.ascii	"__UINT32_MAX__ 4294967295U\000"
.LASF447:
	.ascii	"__END_NAMESPACE_C99 \000"
.LASF918:
	.ascii	"stderr\000"
.LASF724:
	.ascii	"__need_timeval \000"
.LASF833:
	.ascii	"short int\000"
.LASF428:
	.ascii	"_SYS_CDEFS_H 1\000"
.LASF875:
	.ascii	"_IO_FILE\000"
.LASF516:
	.ascii	"_SYS_SIZE_T_H \000"
.LASF569:
	.ascii	"__FSWORD_T_TYPE __SWORD_TYPE\000"
.LASF795:
	.ascii	"INT_FAST32_MAX (2147483647)\000"
.LASF297:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF478:
	.ascii	"__va_arg_pack_len() __builtin_va_arg_pack_len ()\000"
.LASF6:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF460:
	.ascii	"__ASMNAME2(prefix,cname) __STRING (prefix) cname\000"
.LASF147:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF308:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 2\000"
.LASF505:
	.ascii	"__stub_query_module \000"
.LASF19:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF68:
	.ascii	"__SHRT_MAX__ 32767\000"
.LASF864:
	.ascii	"_vtable_offset\000"
.LASF141:
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
.LASF737:
	.ascii	"__suseconds_t_defined \000"
.LASF458:
	.ascii	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm"
	.ascii	"__ (__ASMNAME (#alias)) __THROWNL\000"
.LASF625:
	.ascii	"_IOS_INPUT 1\000"
.LASF493:
	.ascii	"__stub_fattach \000"
.LASF632:
	.ascii	"_IOS_BIN 128\000"
.LASF223:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF461:
	.ascii	"__attribute_malloc__ __attribute__ ((__malloc__))\000"
.LASF708:
	.ascii	"stdout stdout\000"
.LASF331:
	.ascii	"__ARM_FEATURE_SIMD32 1\000"
.LASF467:
	.ascii	"__attribute_deprecated__ __attribute__ ((__deprecat"
	.ascii	"ed__))\000"
.LASF70:
	.ascii	"__LONG_MAX__ 2147483647L\000"
.LASF722:
	.ascii	"__need_timer_t\000"
.LASF408:
	.ascii	"__USE_POSIX 1\000"
.LASF897:
	.ascii	"__builtin_neon_uqi\000"
.LASF713:
	.ascii	"fread_unlocked(ptr,size,n,stream) (__extension__ (("
	.ascii	"__builtin_constant_p (size) && __builtin_constant_p"
	.ascii	" (n) && (size_t) (size) * (size_t) (n) <= 8 && (siz"
	.ascii	"e_t) (size) != 0) ? ({ char *__ptr = (char *) (ptr)"
	.ascii	"; FILE *__stream = (stream); size_t __cnt; for (__c"
	.ascii	"nt = (size_t) (size) * (size_t) (n); __cnt > 0; --_"
	.ascii	"_cnt) { int __c = _IO_getc_unlocked (__stream); if "
	.ascii	"(__c == EOF) break; *__ptr++ = __c; } ((size_t) (si"
	.ascii	"ze) * (size_t) (n) - __cnt) / (size_t) (size); }) :"
	.ascii	" (((__builtin_constant_p (size) && (size_t) (size) "
	.ascii	"== 0) || (__builtin_constant_p (n) && (size_t) (n) "
	.ascii	"== 0)) ? ((void) (ptr), (void) (stream), (void) (si"
	.ascii	"ze), (void) (n), (size_t) 0) : fread_unlocked (ptr,"
	.ascii	" size, n, stream))))\000"
.LASF659:
	.ascii	"_IO_DEC 020\000"
.LASF299:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF166:
	.ascii	"__DEC32_MIN__ 1E-95DF\000"
.LASF603:
	.ascii	"_G_HAVE_ST_BLKSIZE defined (_STATBUF_ST_BLKSIZE)\000"
.LASF535:
	.ascii	"__S16_TYPE short int\000"
.LASF668:
	.ascii	"_IO_UNITBUF 020000\000"
.LASF322:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF719:
	.ascii	"__time_t_defined 1\000"
.LASF812:
	.ascii	"WCHAR_MIN __WCHAR_MIN\000"
.LASF327:
	.ascii	"__ARM_FEATURE_UNALIGNED 1\000"
.LASF353:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF934:
	.ascii	"main\000"
.LASF776:
	.ascii	"UINT64_MAX (__UINT64_C(18446744073709551615))\000"
.LASF246:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF666:
	.ascii	"_IO_SCIENTIFIC 04000\000"
.LASF474:
	.ascii	"__attribute_artificial__ __attribute__ ((__artifici"
	.ascii	"al__))\000"
.LASF635:
	.ascii	"_IO_MAGIC_MASK 0xFFFF0000\000"
.LASF820:
	.ascii	"UINT8_C(c) c\000"
.LASF164:
	.ascii	"__DEC32_MIN_EXP__ (-94)\000"
.LASF261:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF593:
	.ascii	"_IO_STDIO_H \000"
.LASF558:
	.ascii	"__OFF_T_TYPE __SLONGWORD_TYPE\000"
.LASF675:
	.ascii	"_IO_stdout ((_IO_FILE*)(&_IO_2_1_stdout_))\000"
.LASF572:
	.ascii	"__TIME_T_TYPE __SLONGWORD_TYPE\000"
.LASF486:
	.ascii	"__LDBL_REDIR_NTH(name,proto) name proto __THROW\000"
.LASF477:
	.ascii	"__va_arg_pack() __builtin_va_arg_pack ()\000"
.LASF574:
	.ascii	"__SUSECONDS_T_TYPE __SLONGWORD_TYPE\000"
.LASF393:
	.ascii	"__USE_FORTIFY_LEVEL\000"
.LASF848:
	.ascii	"_IO_read_end\000"
.LASF340:
	.ascii	"__thumb2__ 1\000"
.LASF600:
	.ascii	"_G_HAVE_MMAP 1\000"
.LASF388:
	.ascii	"__USE_SVID\000"
.LASF397:
	.ascii	"_DEFAULT_SOURCE\000"
.LASF351:
	.ascii	"__ARM_PCS_VFP 1\000"
.LASF527:
	.ascii	"_GCC_SIZE_T \000"
.LASF221:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF779:
	.ascii	"INT_LEAST32_MIN (-2147483647-1)\000"
.LASF757:
	.ascii	"_GCC_ARM_NEON_H 1\000"
.LASF15:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF741:
	.ascii	"__FD_MASK(d) ((__fd_mask) 1 << ((d) % __NFDBITS))\000"
.LASF215:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF591:
	.ascii	"__need___FILE\000"
.LASF551:
	.ascii	"__DEV_T_TYPE __UQUAD_TYPE\000"
.LASF778:
	.ascii	"INT_LEAST16_MIN (-32767-1)\000"
.LASF228:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF390:
	.ascii	"__USE_ATFILE\000"
.LASF860:
	.ascii	"_fileno\000"
.LASF449:
	.ascii	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIF"
	.ascii	"Y_LEVEL > 1)\000"
.LASF885:
	.ascii	"tz_dsttime\000"
.LASF82:
	.ascii	"__SIG_ATOMIC_MAX__ 2147483647\000"
.LASF409:
	.ascii	"__USE_POSIX2 1\000"
.LASF359:
	.ascii	"__unix__ 1\000"
.LASF61:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF293:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF238:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF253:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF723:
	.ascii	"__need_timespec\000"
.LASF150:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF419:
	.ascii	"__USE_BSD 1\000"
.LASF555:
	.ascii	"__INO64_T_TYPE __UQUAD_TYPE\000"
.LASF589:
	.ascii	"__need_FILE\000"
.LASF563:
	.ascii	"__BLKCNT_T_TYPE __SLONGWORD_TYPE\000"
.LASF5:
	.ascii	"__VERSION__ \"4.8.3 20140401 (prerelease)\"\000"
.LASF556:
	.ascii	"__MODE_T_TYPE __U32_TYPE\000"
.LASF646:
	.ascii	"_IO_TIED_PUT_GET 0x400\000"
.LASF175:
	.ascii	"__DEC64_EPSILON__ 1E-15DD\000"
.LASF440:
	.ascii	"__long_double_t long double\000"
.LASF49:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF263:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF360:
	.ascii	"unix 1\000"
.LASF142:
	.ascii	"__DBL_MAX__ ((double)1.7976931348623157e+308L)\000"
.LASF827:
	.ascii	"float\000"
.LASF917:
	.ascii	"stdout\000"
.LASF498:
	.ascii	"__stub_getpmsg \000"
.LASF339:
	.ascii	"__thumb__ 1\000"
.LASF733:
	.ascii	"_SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long i"
	.ascii	"nt)))\000"
.LASF342:
	.ascii	"__ARMEL__ 1\000"
.LASF422:
	.ascii	"__USE_FORTIFY_LEVEL 0\000"
.LASF925:
	.ascii	"fread\000"
.LASF266:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF783:
	.ascii	"INT_LEAST32_MAX (2147483647)\000"
.LASF581:
	.ascii	"__SSIZE_T_TYPE __SWORD_TYPE\000"
.LASF760:
	.ascii	"__WCHAR_MAX __WCHAR_MAX__\000"
.LASF619:
	.ascii	"__need___va_list\000"
.LASF894:
	.ascii	"__builtin_neon_poly8\000"
.LASF851:
	.ascii	"_IO_write_ptr\000"
.LASF791:
	.ascii	"INT_FAST32_MIN (-2147483647-1)\000"
.LASF13:
	.ascii	"__FAST_MATH__ 1\000"
.LASF392:
	.ascii	"__USE_REENTRANT\000"
.LASF185:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF926:
	.ascii	"gettimeofday\000"
.LASF454:
	.ascii	"__errordecl(name,msg) extern void name (void) __att"
	.ascii	"ribute__((__error__ (msg)))\000"
.LASF490:
	.ascii	"__USE_EXTERN_INLINES 1\000"
.LASF808:
	.ascii	"PTRDIFF_MAX (2147483647)\000"
.LASF21:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF920:
	.ascii	"foreImage\000"
.LASF417:
	.ascii	"_ATFILE_SOURCE 1\000"
.LASF887:
	.ascii	"int8x8_t\000"
.LASF187:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF900:
	.ascii	"__builtin_neon_udi\000"
.LASF652:
	.ascii	"_IO_FLAGS2_MMAP 1\000"
.LASF906:
	.ascii	"temp\000"
.LASF385:
	.ascii	"__USE_LARGEFILE64\000"
.LASF95:
	.ascii	"__INT16_C(c) c\000"
.LASF366:
	.ascii	"__STDC_NO_THREADS__ 1\000"
.LASF289:
	.ascii	"__DA_IBIT__ 32\000"
.LASF824:
	.ascii	"INTMAX_C(c) c ## LL\000"
.LASF903:
	.ascii	"dstImage\000"
.LASF502:
	.ascii	"__stub_process_vm_writev \000"
.LASF543:
	.ascii	"__SWORD_TYPE int\000"
.LASF10:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF267:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF355:
	.ascii	"__linux 1\000"
.LASF138:
	.ascii	"__DBL_MIN_10_EXP__ (-307)\000"
.LASF219:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF909:
	.ascii	"fgFile\000"
.LASF745:
	.ascii	"FD_SET(fd,fdsetp) __FD_SET (fd, fdsetp)\000"
.LASF881:
	.ascii	"tv_sec\000"
.LASF114:
	.ascii	"__UINT_FAST32_MAX__ 4294967295U\000"
.LASF100:
	.ascii	"__UINT_LEAST8_MAX__ 255\000"
.LASF406:
	.ascii	"_POSIX_C_SOURCE\000"
.LASF135:
	.ascii	"__DBL_MANT_DIG__ 53\000"
.LASF210:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF895:
	.ascii	"__builtin_neon_poly16\000"
.LASF480:
	.ascii	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
	.ascii	"\000"
.LASF352:
	.ascii	"__ARM_EABI__ 1\000"
.LASF51:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF224:
	.ascii	"__SACCUM_FBIT__ 7\000"
.LASF673:
	.ascii	"__HAVE_COLUMN \000"
.LASF616:
	.ascii	"_IO_va_list _G_va_list\000"
	.ident	"GCC: (crosstool-NG linaro-1.13.1-4.8-2014.04 - Linaro GCC 4.8-2014.04) 4.8.3 20140401 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
