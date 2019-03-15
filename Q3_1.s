# MIPS program to swap two arrays.
	.data
arr_A:	.word	2, 65, 7, 36, 14
arr_B:	.word	65, 45, 12, 87, 36
size:	.word	5

	.text

main:
	la $t0, arr_A
	la $t1, arr_B
	lw $v0, size
	li $t3, 0				# loop counter.
	j swap_loop

swap_loop:
	lw $t5, 0($t0)
	lw $t6, 0($t1)
	sw $t5, 0($t1)
	sw $t6, 0($t0)
	addiu $t0, $t0, 4
	addiu $t1, $t1, 4 
	addiu $t3, $t3, 1
	beq $t3, $v0, swap_end
	j swap_loop

swap_end:
	jr $ra

.end main
