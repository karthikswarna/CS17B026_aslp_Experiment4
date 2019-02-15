# MIPS program to count number of 1's and 0's in 32-bit binary number.

    .data

var:  .word 25
num0: .word 0               # number of 0's in var.
num1: .word 0               # number of 1's in var.

    .text

main:
    lw $t0, var
    li $t1, 0               # counter register for number of 0'sin var.
    li $t2, 32              # loop counter.
    li $t5, 32              # total number of bits.

for:
    blez $t2, Exit          # if $t2 <= $zero, then Exit.
    andi $t3, $t0, 1        # check for 1 in the LSB.
    bgtz $t3, no_zero       # if LSB > 0(i.e LSB = 1)
    addi $t1, $t1, 1
no_zero:
    sub $t2, $t2, 1         # $t2 = $t2 - 1.
    srl $t0, $t0, 1 
    j for 

Exit:
    sub $t4, $t5, $t1       # counter register for number of 1's in var.
    sw $t1, num0            # storing back number of 0's.
    sw $t4, num1            # storing back number of 1's.
    jr $ra

.end main