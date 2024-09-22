	.file	"perf_fib.c"
	.intel_syntax noprefix
	.text
	.globl	fib
	.type	fib, @function
fib:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -36[rbp], edi
	mov	QWORD PTR -24[rbp], 0
	mov	QWORD PTR -16[rbp], 1
	mov	QWORD PTR -8[rbp], 0
	mov	DWORD PTR -28[rbp], 0
	jmp	.L2
.L3:
	mov	rax, QWORD PTR -16[rbp]
	add	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR -8[rbp], rax
	add	DWORD PTR -28[rbp], 1
.L2:
	mov	eax, DWORD PTR -28[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L3
	mov	rax, QWORD PTR -24[rbp]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	fib, .-fib
	.section	.rodata
.LC0:
	.string	"%d: %ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 112
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -80[rbp], 0
	mov	DWORD PTR -76[rbp], 1
	mov	DWORD PTR -72[rbp], 2
	mov	DWORD PTR -68[rbp], 3
	mov	DWORD PTR -64[rbp], 4
	mov	DWORD PTR -60[rbp], 5
	mov	DWORD PTR -56[rbp], 10
	mov	DWORD PTR -52[rbp], 20
	mov	DWORD PTR -48[rbp], 30
	mov	DWORD PTR -44[rbp], 40
	mov	DWORD PTR -40[rbp], 50
	mov	DWORD PTR -36[rbp], 60
	mov	DWORD PTR -32[rbp], 70
	mov	DWORD PTR -28[rbp], 80
	mov	DWORD PTR -24[rbp], 90
	mov	DWORD PTR -20[rbp], 93
	mov	DWORD PTR -100[rbp], 0
	jmp	.L6
.L9:
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	mov	eax, DWORD PTR -80[rbp+rax*4]
	mov	DWORD PTR -92[rbp], eax
	call	clock@PLT
	mov	QWORD PTR -88[rbp], rax
	mov	DWORD PTR -96[rbp], 0
	jmp	.L7
.L8:
	mov	eax, DWORD PTR -92[rbp]
	mov	edi, eax
	call	fib
	add	DWORD PTR -96[rbp], 1
.L7:
	cmp	DWORD PTR -96[rbp], 99999
	jle	.L8
	call	clock@PLT
	sub	rax, QWORD PTR -88[rbp]
	mov	rdx, rax
	mov	eax, DWORD PTR -92[rbp]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -100[rbp], 1
.L6:
	cmp	DWORD PTR -100[rbp], 15
	jle	.L9
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
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
