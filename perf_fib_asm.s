	.intel_syntax noprefix

	.text
	.section .rodata
TIME_FORMAT:
	.string "%d: %d\n"
LU_FORMAT:
	.string "%lu\n"

	.text
	.globl fib_asm
	.globl main

	.type fib_asm, @function
fib_asm:
	endbr64

	xor rax, rax
	mov r8, 1
	xor r9, r9

fib_lp:
	test dil, dil
	je fib_fin
	add rax, r8
	mov r8, r9
	mov r9, rax
	dec dil
	jmp fib_lp

fib_fin:
	ret
	.size	fib_asm, .-fib_asm

	.type	main, @function
main:
	endbr64
	push rbp
	mov rbp, rsp

	sub rsp, 16
	mov	BYTE PTR -1[rbp], 0
	mov	BYTE PTR -2[rbp], 1
	mov	BYTE PTR -3[rbp], 2
	mov	BYTE PTR -4[rbp], 3
	mov	BYTE PTR -5[rbp], 4
	mov	BYTE PTR -6[rbp], 5
	mov	BYTE PTR -7[rbp], 10
	mov	BYTE PTR -8[rbp], 20
	mov	BYTE PTR -9[rbp], 30
	mov	BYTE PTR -10[rbp], 40
	mov	BYTE PTR -11[rbp], 50
	mov	BYTE PTR -12[rbp], 60
	mov	BYTE PTR -13[rbp], 70
	mov	BYTE PTR -14[rbp], 80
	mov	BYTE PTR -15[rbp], 90
	mov	BYTE PTR -16[rbp], 93

	xor r12, r12
	mov r12b, 16
main_n_lp:
	mov r13d, 100000
	mov r14b, BYTE PTR -17[rbp+r12]
	call	clock@PLT
	mov r15, rax
main_times_lp:
	mov dil, r14b
	call fib_asm

	dec r13d
	test r13d, r13d
	jne main_times_lp

	call clock@PLT
	xor rsi, rsi
	mov sil, r14b
	mov rdx, rax
	sub rdx, r15
	lea rdi, TIME_FORMAT[rip]
	call printf@PLT

	dec r12b
	test r12b, r12b
	jne main_n_lp

	leave
	ret
	.size	main, .-main

	.section	.note.GNU-stack,"",@progbits
