https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
.file "sumprog.s"
# Assembler directives to allocate storage for static array
.section .rodata
printf_line:
.string "The sum of the array is %i\n"
.data
.align 8
array:
    .quad 10
    .quad 12
    .quad 15
    .quad 19
.globl main
	.type main, @function
.text 
main:
    push %rbp			# save caller's %rbp
    movq %rsp, %rbp		# copy %rsp to %rbp so our stack frame is ready to use
    movq $array, %rsi		#set rcx to point to array
    movq $4, %rdi		# count = 4
    call sum
    movq %rax, %rsi		#move result into 2nd parameter
    movq $printf_line, %rdi	#move string literal to 1st parameter

    movq $0, %rax		#why???
    call printf

    leave
    ret
.size main, .-main
.globl sum
	.type sum, @function
sum:
    pushq %rbp			#save caller’s rbp
    movq %rsp, %rbp		#set function’s frame pointer
				# register rdi contains size
				# register rsi contains address to array
    movq $0, %rax		#initialize sum to 0
loop:				#loop to sum values in array 
    decq %rdi			#decrement number of remaining elements
    jl exit			#jump out of loop if no elements remaining
    addq (%rsi,%rdi,8), %rax	#add element to sum
    jmp     loop		#jump to top of loop
exit:
    leave
    ret
.size sum, .-sum

