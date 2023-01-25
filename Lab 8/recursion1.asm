		.data
str1: .asciiz "Please enter an integer: "
	.text
	
main:
		li $v0, 4
		la $a0, str1
		syscall
		
		li $v0, 5
		syscall
		move $a0, $v0
		
		
		jal recursion
		
		
		
move $s3,$v0 #get result
move $a0,$s3 #ready to print
li $v0,1 #print integer
syscall
		
		
		
		
		
		li $v0,10
		syscall
	

recursion:
        addi $sp, $sp, -28       
	sw $ra, 0($sp)
	sw $t5, -8($sp)
	sw $t6, -12($sp)
	sw $t7, -16($sp) 
	sw $a0, -20($sp)


	beq $a0, 10, ten
	beq $a0, 11, eleven
	
	
	
	
	move $t5, $a0
	add $a0, $a0, 1
	jal recursion
	
	
	move $t7, $v0
	add $a0, $a0, 1
	jal recursion
	
	move $t6, $v0
	
	add $v0, $t7, $t6
	add $v0, $v0, $t5
	
	
	
	
	j exit
	
ten:
li $v0, 2
j exit	

eleven:
li $v0, 1
j exit




exit:
	lw $ra, 0($sp)
	lw $t5, -8($sp)
	lw $t6, -12($sp)
	lw $t7, -16($sp)
	lw $a0, -20($sp)
        addi $sp, $sp, 28
	jr $ra
