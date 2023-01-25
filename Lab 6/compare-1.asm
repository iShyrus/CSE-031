        .data
n:      .word 25
str1: .asciiz "Less than\n"
str2: .asciiz "Less than or equal to\n"
str3: .asciiz "Greater than\n"
str4: .asciiz "Greater than or equal to\n"
str5: .asciiz "User input: "

        .text
   
main:    
		lw $t1, n
		
		li $v0, 4
		la $a0, str5
		syscall
		
		li $v0, 5
		syscall
		move $t0, $v0
		



		
		beq $t0, $t1, equal
		blt $t0, $t1, less
		bgt $t0, $t1, greater
	
		
		li $v0,10
		syscall
		
		
		
		
		
		
		
		
		

greater:
		li $v0, 4
		la $a0, str3
		syscall
		
		li $v0, 4
		la $a0, str4
		syscall
		
		
		
		
		li $v0,10
		syscall
		
equal:
		li $v0, 4
		la $a0, str4
		syscall
		
		li $v0, 4
		la $a0, str2
		syscall
		
		li $v0,10
		syscall
		
		
less:
		li $v0, 4
		la $a0, str1
		syscall
		
		li $v0, 4
		la $a0, str2
		syscall
		
		
		li $v0,10
		syscall

