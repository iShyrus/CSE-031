        .data

str1: .asciiz "Please enter a number: "
str2: .asciiz "\nSum of even numbers is: "
str3: .asciiz "\nSum of odd numbers is: "

	
	.text

main:

	addi $t0, $t0 ,1

	
oddevenChecker: beq $t0, $zero, finish

		li $v0, 4
		la $a0, str1
		syscall
		
		li $v0, 5
		syscall
		move $t0, $v0


		srl $t1, $t0, 1
		sll $t1, $t1, 1
		
		
		bne $t1, $t0, oddsum


		j evensum

evensum:

	move $t2, $t3
	add $t3, $t2, $t0


	j oddevenChecker


oddsum:

	move $t4, $t5
	add $t5, $t4, $t0



	j oddevenChecker



finish:

	li $v0, 4
	la $a0, str2
	syscall
		
	li $v0, 1 
	move $a0, $t3 
	syscall
	
	
	li $v0, 4
	la $a0, str3
	syscall
		
	li $v0, 1 
	move $a0, $t5 
	syscall
	
	
	
	
	
	
		li      $v0, 10		
		syscall			
