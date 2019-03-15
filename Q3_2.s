	.data
arr_A: 	.byte	'k', 'a', 'r', 't', 'h', 'i', 'k'	
arr_B: 	.byte 	'c', 'h', 'a', 'n', 'd', 'r', 'a'
size:	.word	7
	
	.text

main:
	la $t0, arr_A
	la $t1, arr_B
	lw $v0, size
	li $t3, 0				# loop counter.
	j swap_loop

swap_loop:
	lb $t5, 0($t0)
	lb $t6, 0($t1)
	sb $t5, 0($t1)
	sb $t6, 0($t0)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1 
	addiu $t3, $t3, 1
	beq $t3, $v0, swap_end
	j swap_loop

swap_end:
	jr $ra

.end mains
