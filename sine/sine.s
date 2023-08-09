.globl sine

.section .data
# if you need some data, put it here
var:
.align 8


.section .text

# Sine for 40%, if greater than 1 then we return 1, if not, then we return what we've got
#   Params
#	a1 -- input buffer will contain string with the argument
#	a2 -- output string buffer for the string result
sine:
	# implement here
	
	#load number
	ld	a3, 0(a1)
	#load first bit of number
	lb	a4, 0(a1)
	#load number to check equality
	li	a5, '1'
	mv	a6, ra
	call	iffo
stamp:
	mv	ra, a6
	sd	a5, 0(a2)
	ret

# Function for if
iffo:
	beq	a4, a5, stamp
	ld	a5, (a1)
	ret

