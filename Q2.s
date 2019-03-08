# MIPS program to add two 128-bit numbers.
        .data
        
num1:   .word   9324424, 42542, 83546, 845253           # first summand stored as an array.
num2:   .word   5465654, 6545656, 536456765, 35676      # second summand stored as an array.
sum:    .word   0:4                                     # sum array of 4 words initialized to zero

        .text

main:
        la $t0, num1                           	# base address of the array 1.
        la $t1, num2							# base address of the array 2.

		lw $t2, 12($t0)							# storing least significant word of array 1.
		lw $t3, 12($t1)							# storing least significant word of array 2.
		addu  $s0, $t2, $t3         			# add least significant word
        nor   $t4, $t3, $zero             		# ~a2
        sltu  $t4, $t2, $t4               		# set carry-in bit (capturing overflow).
		# $s0 contains result and $t4 contains overflow.

		lw $t2, 8($t0)							# storing second word of array 1.
		lw $t3, 8($t1)							# storing second word of array 2.
        addu  $s1, $t4, $t2                     # add in second word of array 1 to overflow.
        addu  $s1, $s1, $t3                     # add in second word of array 2 to the result.
		nor   $t4, $t3, $zero             		# ~a4
        sltu  $t4, $t2, $t4               		# set carry-in bit (capturing overflow).
		# $s1 contains result and $t4 contains overflow.

		lw $t2, 4($t0)							# storing third word of array 1.
		lw $t3, 4($t1)							# storing third word of array 2.
        addu  $s2, $t4, $t2                     # add in third word of array 1 to overflow.
        addu  $s2, $s2, $t3                     # add in third word of array 2 to the result.
		nor   $t4, $t3, $zero             		# ~a6
        sltu  $t4, $t2, $t4               		# set carry-in bit (capturing overflow).		
		# $s2 contains result and $t4 contains overflow.

		lw $t2, 0($t0)							# storing most significant word of array 1.
		lw $t3, 0($t1)							# storing most significant word of array 2.
        addu  $s3, $t4, $t2                     # add in most significant word of array 1 to overflow.
        addu  $s3, $s3, $t3                     # add in most significant word of array 2 to the result.
		nor   $t4, $t3, $zero             		# ~a8
        sltu  $t4, $t2, $t4               		# set carry-in bit (capturing overflow).
		# $s3 contains result and $t4 contains overflow.

		la $t5, sum
		sw $s3, 0($t5)							# storing the sum into the "sum" array.
		sw $s2, 4($t5)
		sw $s1, 8($t5)
		sw $s0, 12($t5)
		jr $ra

.end main
