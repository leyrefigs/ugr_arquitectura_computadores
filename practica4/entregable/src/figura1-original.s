	.file	"figura1-original.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"R[0] = %i, R[39999] = %i\n"
.LC2:
	.string	"\nTiempo (seg.) = %11.9f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	subq	$160056, %rsp
	.cfi_def_cfa_offset 160064
	xorl	%edi, %edi
	leaq	16(%rsp), %rsi
	call	clock_gettime
	leaq	52(%rsp), %r8
	movl	$1, %ecx
	.p2align 4,,10
	.p2align 3
.L2:
	movl	$s, %eax
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L9:
	movl	(%rax), %edx
	addq	$8, %rax
	leal	(%rcx,%rdx,2), %edx
	addl	%edx, %esi
	cmpq	$s+40000, %rax
	jne	.L9
	movl	$s+4, %eax
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L5:
	movl	(%rax), %edx
	addq	$8, %rax
	leal	(%rdx,%rdx,2), %edx
	subl	%ecx, %edx
	addl	%edx, %edi
	cmpq	$s+40004, %rax
	jne	.L5
	cmpl	%esi, %edi
	jle	.L6
	movl	%esi, (%r8)
.L7:
	addl	$1, %ecx
	addq	$4, %r8
	cmpl	$40001, %ecx
	jne	.L2
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	movl	$.LC1, %esi
	movl	160044(%rsp), %ecx
	movl	48(%rsp), %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	xorl	%eax, %eax
	divsd	.LC0(%rip), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	call	__printf_chk
	movsd	8(%rsp), %xmm0
	movl	$.LC2, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	xorl	%eax, %eax
	addq	$160056, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore_state
	movl	%edi, (%r8)
	jmp	.L7
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.comm	s,40000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
