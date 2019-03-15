# MIPS program to count binary sequence group.

	.data

var: .word -1339636425    # it's binary equivalent is 

	.text

main:
	lw $t0, var
	li $t1, 0			# indicates previous bit.
	li $t2, 0			# count number of 1 sequences.
	li $t3, 0			# count number of 0 sequences.
	li $t4, 31			# loop counter.
	
	
	andi $t5, $t0, 1
	beq $t5, $t1, lsb_0 # if LSB is 0, branch to "lsb_0".
	addi $t2, $t2, 1	# increment to 1's sequence.
	li $t1, 1
	j for
lsb_0:
	addi $t3, $t3, 1	# increment to 0's sequence.
	li $t1, 0

for:
	blez $t4, Exit
	srl $t0, $t0, 1
	andi $t5, $t0, 1

	beq $t5, $t1, no_change
	bne $t5, $zero, not_0_seq 
	addi $t3, $t3, 1
	li $t1, 0
	j no_change

not_0_seq:
	addi $t2, $t2, 1
	li $t1, 1
	j no_change

no_change:
	sub $t4, $t4, 1
	j for

Exit:
	jr $ra

.end main