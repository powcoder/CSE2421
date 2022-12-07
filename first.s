https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
.file "first.s"
.section .rodata
.data
.align 8
Array:
.quad 0x6f
.quad 0x84
.globl main
	.type	main, @function
.text
main:
	pushq %rbp		#stack housekeeping
	movq %rsp, %rbp

	movq $55, %rdx
	movq %rdx, %rbx
	movq $Array, %rax
	movq %rbx, 8(%rax)
	movq (%rax), %rcx
	
	leave
	ret
.size	main, .-main
