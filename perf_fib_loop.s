	.file	"perf_fib_loop.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fib_loop
	.type	fib_loop, @function
fib_loop:
.LFB23:
	.cfi_startproc
	endbr64
	test	edi, edi
	jle	.L4
	xor	eax, eax
	mov	ecx, 1
	xor	edx, edx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L5:
	mov	rdx, rsi
.L3:
	add	eax, 1
	lea	rsi, [rdx+rcx]
	mov	rcx, rdx
	cmp	edi, eax
	jne	.L5
	mov	rax, rsi
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	xor	esi, esi
	mov	rax, rsi
	ret
	.cfi_endproc
.LFE23:
	.size	fib_loop, .-fib_loop
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"%lu"
.LC5:
	.string	"%d: %ld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	# lea	rbp, .LC4[rip]
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 88
	.cfi_def_cfa_offset 144
	movdqa	xmm0, XMMWORD PTR .LC0[rip]
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 72[rsp], rax
	xor	eax, eax
	mov	r12, rsp
	lea	r14, 64[rsp]
	movaps	XMMWORD PTR [rsp], xmm0
	movdqa	xmm0, XMMWORD PTR .LC1[rip]
	movaps	XMMWORD PTR 16[rsp], xmm0
	movdqa	xmm0, XMMWORD PTR .LC2[rip]
	movaps	XMMWORD PTR 32[rsp], xmm0
	movdqa	xmm0, XMMWORD PTR .LC3[rip]
	movaps	XMMWORD PTR 48[rsp], xmm0
.L12:
	mov	r15d, DWORD PTR [r12]
	mov	ebx, 100000
	call	clock@PLT
	mov	r13, rax
	.p2align 4,,10
	.p2align 3
.L8:
	xor	eax, eax
	mov	ecx, 1
	xor	edx, edx
	xor	esi, esi
	test	r15d, r15d
	jg	.L9
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L14:
	mov	rdx, rsi
.L9:
	add	eax, 1
	lea	rsi, [rdx+rcx]
	mov	rcx, rdx
	cmp	r15d, eax
	jne	.L14
.L11:
	# mov	rdx, rsi
	# xor	eax, eax
	# mov	rsi, rbp
	# mov	edi, 2
	# call	__printf_chk@PLT
	sub	ebx, 1
	jne	.L8
	call	clock@PLT
	add	r12, 4
	mov	edx, r15d
	lea	rsi, .LC5[rip]
	sub	rax, r13
	mov	edi, 2
	mov	rcx, rax
	xor	eax, eax
	call	__printf_chk@PLT
	cmp	r14, r12
	jne	.L12
	mov	rax, QWORD PTR 72[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L19
	add	rsp, 88
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.L19:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC1:
	.long	4
	.long	5
	.long	10
	.long	20
	.align 16
.LC2:
	.long	30
	.long	40
	.long	50
	.long	60
	.align 16
.LC3:
	.long	70
	.long	80
	.long	90
	.long	93
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
