https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
.file "findmin.s"
# Assembler directives to allocate storage for static array
.section .rodata
printf_line:
.string "The min value in the array is %i\n"
.data
.align 8
array:
    .quad 10
    .quad 12
    .quad 8
    .quad 15
    .quad 19
.globl main
	.type main, @function
.text 
main:
    push %rbp			# save caller's %rbp
    movq %rsp, %rbp		# copy %rsp to %rbp so our stack frame is ready to use
    movq $array, %rsi		#set rcx to point to array
    movq $5, %rdi		# count = 5
    call findmin
    movq %rax, %rsi		#move result into 2nd parameter
    movq $printf_line, %rdi	#move string literal to 1st parameter

    movq $0, %rax		#why???
    call printf

    leave
    ret
.size main, .-main
.globl findmin
	.type findmin, @function
findmin:
    pushq %rbp			#save caller’s rbp
    movq %rsp, %rbp		#set function’s frame pointer
				# register rdi contains size
				# register rsi contains address to array
    decq %rdi			#decrement number of remaining elements
    movq (%rsi, %rdi,8), %rax	#initialize min to last array element
loop:				#loop through array 
    decq %rdi			#decrement number of remaining elements
    jl exit			#jump out of loop if no elements remaining
    movq (%rsi,%rdi,8), %rdx	#add element to sum
    cmpq %rax, %rdx
    cmovs %rdx, %rax
    jmp     loop		#jump to top of loop
exit:
    leave
    ret
.size findmin, .-findmin

