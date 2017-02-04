.data

val: .word 21, 3, -21,
store: .word 0, 0
.text
lw $s0, 0x00002000 #s0 = 21
lw $s1, 0x00002004 #s1 = 3
lw $s2, 0x00002008 #s2 = -21


add $t0,$s0,$s2 # t0 = 21 + (-21)
add $t0,$s1,$s2 # t0 = 3 + (-21)
add $t0, $s0,$s1 #t0 = 21 + 3


sub $t1, $s1,$s2 #t1 = 3 - (-21)
sub $t1, $s2,$s2 #t1 = -21 - (-21) 
sub $t1, $s2,$s1 #t1 = -21 - (3)

and $t2, $s1,$s2
or $t3,$s0,$s1
nor $t4,$s0,$s1
xor $t5,$s0,$s1


slt $t6,$s0,$s2 # 3 < -21 => t6 = 0
slt $t6,$s2,$s0 # -21 < 3 => t6 = 1


sll $s3,$s1,3

srl $s4,$s2,2

sra $s5,$s2,2


beq $t1,$t2,teste_beq2
teste_beq1: addi $s6,$zero, -111
j pulo1
teste_beq2: addi $s6,$zero,999
#s6 = -111
pulo1:

bne $t1,$t2,teste_bne2
teste_bne1:addi $s7,$zero, -111
j pulo2
teste_bne2:addi $s7,$zero, 999

pulo2:

#s7 = 999
jumpvolta:
beq $s7,$t8,not_jump1
addi $t8,$zero,999
addi $t9,$zero,-111
j jumpvolta
not_jump1:

addi $t9,$t9,-111
j branchvolta
branch_voltou:
addi $t9,$t9,111
branchvolta:
bne $s6,$t9, branch_voltou

addi $t9,$t9,111 #t9 = zero

fim:
sw $s6, 0x0000200c
sw $s7, 0x00002010

lw $s2,0x0000200c
lw $s3,0x00002010