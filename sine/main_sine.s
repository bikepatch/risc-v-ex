
# syscalls
exit    = 93
read	= 63
write	= 64
ds	= 0x20000

.section .data 

# This is  0-ended string with input data
input: 	.asciz "0.234"
	.asciz "0.321"
	.asciz "0.131"
	.asciz "0.423"
	.asciz "0.561"

# This will be used for 0-ended string with result. Use "-1" if you cannot calculate the function
output:                
.align 4
.space	100
  

.section .text 
.globl _start

_start:     


	# Buffer initialisation will be here
	li	gp, ds

	li	a7, read
	li	a0, 0
	la	a1, input
	li	a2, 5
	ecall

	la	a1, input
	la	a2, output
	call 	sine

	# Result checking will be here

	li	a7, write
	li	a0, 0
	la	a1, input
	li	a2, 5
	ecall

	li	a0, 0
	li	a7, exit
	ecall
