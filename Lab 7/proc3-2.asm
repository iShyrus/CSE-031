		.data
x: .word 5
y: .word 10
z: .word 15

.text

main:

		la      $s0, x
		lw      $s0, 0($s0)
		la      $s1, y
		lw      $s1, 0($s1)
		la      $s2, z
		lw      $s2, 0($s2)
		
		addi $sp, $sp, -40
		sw $s0, -28($sp)
		sw $s1, -32($sp)
		sw $s2, -36($sp)
		
		jal foo
		

		lw $s0 -28($sp)
		lw $s1, -32($sp)
		lw $s2, -36($sp)
		
		
		add $s1, $s1, $s0 
		add $s2, $s1, $s2
		add $s2, $s2, $v1
		
		addi    $a0, $s2, 0
		li      $v0, 1		
		syscall	
		
		
		li $v0, 10
		syscall
		
		
foo:
		move $a0, $s0
		move $a1, $s1
		move $a2, $s2
		

		sw $ra, 0($sp)
		sw $a0, -4($sp)
		sw $a1, -8($sp)		
		sw $a2, -12($sp)
	
		
				
		## int p
		add $a0, $a0, $a1	
		sw $a0 -24 ($sp)
		add $a1, $a1, $a2
		lw $a0, -4($sp)	
		add $a2, $a2, $a0
		lw $a0 , -24($sp)
		

		jal bar
		
		
		
		
		move $s0,$v0
		
		
		## int q
		lw $a0, -4($sp)	
		lw $a1, -8($sp)	
		lw $a2, -12($sp)
		

		
		add $a2, $a1, $a1
		sw  $a2, -20($sp)	
		sub $a1, $a1, $a0
		
		lw $a2, -12($sp) 
		sub $a0, $a0, $a2				

		lw $a2, -20($sp) 

		jal bar
		
		
		
		move $s1,$v0
		add $v1, $s1, $s0
		lw $ra, 0($sp)
		
		jr $ra
		
		j exit
		
bar:
		
		
	sub $a2, $a2, $a0
	sllv $v0, $a2, $a1
	
	jr $ra
		

exit:

