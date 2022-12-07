https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
.file "Reverse1.s"
# Assembler directives to allocate storage for static array
.section .rodata
printf_line:
.string "Element %d in array1 and Element %d in array2 is %d\n"
.data
.align 4
array:
    .long 1
    .long 2
    .long 3
    .long 4
    .long 5
    .long 6
    .long 7
    .long 8
    .long 9
.align 8
longarray:
    .quad 0
    .quad 0
    .quad 0
    .quad 0
    .quad 0
    .quad 0
    .quad 0
    .quad 0
    .quad 0
.globl main
	.type main, @function
.text 
main:
    push %rbp			# save caller's %rbp
    movq %rsp, %rbp		# copy %rsp to %rbp so our stack frame is ready to use
    movq $array, %rdi		#set rcx to point to array
    movq $longarray, %rsi
    movq $9, %rdx		# count = 9
    call Reverse
    leave
    ret
.size main, .-main
.globl Reverse
	.type Reverse, @function
Reverse:
    pushq %rbp			#save caller’s rbp
    movq %rsp, %rbp		#set function’s frame pointer
				# register rdi contains address of array
				# register rsi contains address of long array
				# register rdx contains size

    movq $-1, %r12		#index for reverse (one less than I really want)

loop:				#loop to sum values in array 
    incq %r12			#increment index
    decq %rdx			#decrement number of remaining elements
    jl exit			#jump out of loop if no elements remaining
    movslq (%rdi,%rdx,4), %rax	#read integer value and sign extend to a long
    movq %rax, (%rsi, %r12,8)   #write long value to Reverse array position

    movq $printf_line, %rdi
    movq %rdx, %rsi
    movq %r12, %rdx
    movq %rax, %rcx
    movq $0, %rax
    call printf

    jmp     loop		#jump to top of loop
exit:
    leave
    ret
.size Reverse, .-Reverse

