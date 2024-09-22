	.file	"perf_fib_gen_term.c"
	.text
	.globl	fib_gen_term
	.type	fib_gen_term, @function
fib_gen_term:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	pxor	%xmm0, %xmm0
	cvtsi2sdl	-4(%rbp), %xmm0
	movq	.LC0(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movq	%xmm0, %rax
	movsd	.LC1(%rip), %xmm0
	movq	%rax, %xmm1
	divsd	%xmm0, %xmm1
	movsd	.LC2(%rip), %xmm0
	addsd	%xmm1, %xmm0
	comisd	.LC3(%rip), %xmm0
	jnb	.L2
	cvttsd2siq	%xmm0, %rax
	jmp	.L3
.L2:
	movsd	.LC3(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	movabsq	$-9223372036854775808, %rdx
	xorq	%rdx, %rax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	fib_gen_term, .-fib_gen_term
	.section	.rodata
.LC4:
	.string	"%d: %ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -80(%rbp)
	movl	$1, -76(%rbp)
	movl	$2, -72(%rbp)
	movl	$3, -68(%rbp)
	movl	$4, -64(%rbp)
	movl	$5, -60(%rbp)
	movl	$10, -56(%rbp)
	movl	$20, -52(%rbp)
	movl	$30, -48(%rbp)
	movl	$40, -44(%rbp)
	movl	$50, -40(%rbp)
	movl	$60, -36(%rbp)
	movl	$70, -32(%rbp)
	movl	$80, -28(%rbp)
	movl	$90, -24(%rbp)
	movl	$93, -20(%rbp)
	movl	$0, -100(%rbp)
	jmp	.L6
.L9:
	movl	-100(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	movl	%eax, -92(%rbp)
	call	clock@PLT
	movq	%rax, -88(%rbp)
	movl	$0, -96(%rbp)
	jmp	.L7
.L8:
	movl	-92(%rbp), %eax
	movl	%eax, %edi
	call	fib_gen_term
	addl	$1, -96(%rbp)
.L7:
	cmpl	$99999, -96(%rbp)
	jle	.L8
	call	clock@PLT
	subq	-88(%rbp), %rax
	movq	%rax, %rdx
	movl	-92(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -100(%rbp)
.L6:
	cmpl	$15, -100(%rbp)
	jle	.L9
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	-1684540248
	.long	1073341303
	.align 8
.LC1:
	.long	-1684540248
	.long	1073865591
	.align 8
.LC2:
	.long	0
	.long	1071644672
	.align 8
.LC3:
	.long	0
	.long	1138753536
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
