# MIPS program to multiply two 32-bit numbers without using mult operation.
	.data

var1:	.word 	32444464 		#multiplicand
var2: 	.word 	5254 			#multiplier
prod: 	.word 	0:2			#product = s0 s1.
	
	.text
main:

	la $a0, var1			# multiplicand address.
    	la $a1, var2			# multiplier address.
	la $a3, prod			# product array address.

	lw $v0, 0($a0)			# Initializing the multiplicand.
	lw $v1, 0($a1)			# Initializing the multiplier.

	li $t0, 0 			# loop counter
	li $t1, 0			# Initialize the LSB result.
	li $t2, 0 			# Initialize the overflow.
	li $s0, 0 			# Initialize the result registers.
	li $s1, 0

Mult_loop_1:
	beq $t0, 32, Mult_end		# Terminating condition.
	andi $t1, $v1, 1
	beq $t1, 1, Mult_add_1 
	beq $t1, 0, Mult_shift_1

Mult_add_1:
	addu $t1, $s0, $zero
	addu $s0, $s0, $v0
	sltu $t3, $s0, $t1
	sltu $t2, $s0, $v0
	or $t2, $t2, $t3

Mult_shift_1:
	srl $v1, $v1, 1			# Shift right the multiplier.
	li $t4, 0
	andi $t4, $s0, 1
	sll $t4, $t4, 31
	srl $s1, $s1, 1
	or $s1, $s1, $t4
	srl $s0, $s0, 1
	add $t4, $t2, $0
	sll $t4, $t4, 31
	or $s0, $s0, $t4
	addi $t0, $t0, 1
	j Mult_loop_1

Mult_end:
	sw $s1, 4($a3)
	sw $s0, 0($a3)
	j $ra				# returning product from s0, s1 to .data segment.

.end main
