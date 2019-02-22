#MIPS program to detect the positive and negative number.

	.data
var: .word -25

	.text

main:
	lw $t0, var
	li $s0, 0				# register which indicates whether the number is positive or negative.

	srl $t1, $t0, 31			# obtaining the MSB
	andi $t1, $t1, 1

	beq $t1, $zero, positive 		# if MSB = 0, $s0 = 0
	addi $s0, $s0, 1		 	# if MSB = 1, $s0 = 1
positive:
	jr $ra

.end main
