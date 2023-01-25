.data 

original_list: .space 100 
sorted_list: .space 100

str0: .asciiz "Enter size of list (between 1 and 25): "
str1: .asciiz "Enter one list element: "
str2: .asciiz "Content of original list: "
str3: .asciiz "Enter a key to search for: "
str4: .asciiz "Content of sorted list: "
strYes: .asciiz "Key found!"
strNo: .asciiz "Key not found!"
line: .asciiz "\n"
space: .asciiz " "


.text 

#This is the main program.
#It first asks user to enter the size of a list.
#It then asks user to input the elements of the list, one at a time.
#It then calls printList to print out content of the list.
#It then calls inSort to perform insertion sort
#It then asks user to enter a search key and calls bSearch on the sorted list.
#It then prints out search result based on return value of bSearch
main: 
	addi $sp, $sp -8
	sw $ra, 0($sp)
	li $v0, 4 
	la $a0, str0 
	syscall 
	li $v0, 5	#read size of list from user
	syscall
	move $s0, $v0
	move $t0, $0
	la $s1, original_list
loop_in:
	li $v0, 4 
	la $a0, str1 
	syscall 
	sll $t1, $t0, 2
	add $t1, $t1, $s1
	li $v0, 5	#read elements from user
	syscall
	sw $v0, 0($t1)
	addi $t0, $t0, 1
	bne $t0, $s0, loop_in
	move $a0, $s1
	move $a1, $s0
	
	jal inSort	#Call inSort to perform insertion sort in original list
	
	sw $v0, 4($sp)
	li $v0, 4 
	la $a0, str2 
	syscall 
	la $a0, original_list
	move $a1, $s0
	jal printList	#Print original list
	li $v0, 4 
	la $a0, str4 
	syscall 
	lw $a0, 4($sp)
	jal printList	#Print sorted list
	
	li $v0, 4 
	la $a0, str3 
	syscall 
	li $v0, 5	#read search key from user
	syscall
	move $a3, $v0
	lw $a0, 4($sp)
	jal bSearch	#call bSearch to perform binary search
	
	beq $v0, $0, notFound
	li $v0, 4 
	la $a0, strYes 
	syscall 
	j end
	
notFound:
	li $v0, 4 
	la $a0, strNo 
	syscall 
end:
	lw $ra, 0($sp)
	addi $sp, $sp 8
	li $v0, 10 
	syscall
	
	
	
	
	
	
	
	
	
	
	
	

#printList takes in a list and its size as arguments. 
#It prints all the elements in one line.
printList:



add $t5, $t5,1

  	move $t7 $zero 
beq $t5, 1 printingNUMBERunsorted

move $t7, $zero
beq $t5, 2 printingNUMBERsorted
	





printingNUMBERunsorted:
add $t1, $t1, 4

		lw $t3, 0($t1)	
	    	li $v0, 1
  		  move $a0, $t3
  		 syscall
  		 
li $v0, 4       
la $a0, space       
syscall

add $t6, $t6, 1
bne $t6, $s0, printingNUMBERunsorted

li $v0, 4       
la $a0, line       
syscall

  	move $t7 $zero 
	jr $ra
	
	
	




	

	
printingNUMBERsorted:


		lw $t3, 0($t2)	
	    	li $v0, 1
  		  move $a0, $t3
  		 syscall
  		 add $t2, $t2, -4
li $v0, 4       
la $a0, space       
syscall

add $t7, $t7, 1
bne $t7, $s0, printingNUMBERsorted

li $v0, 4       
la $a0, line       
syscall

  	move $t7 $zero 
    	move $t8 $zero
  	move $t9 $zero     	 	
  	move $s1 $zero
  	move $s2 $zero
  	move $s3 $zero
	move $s4 $zero
	move $s5 $zero
	addi $t2 $t2 4
	add $s5 $s5 $s0
	addi $s5 $s5 -1
		jr $ra
	
	
	
	
	
#inSort takes in a list and it size as arguments. 
#It performs INSERTION sort in ascending order and returns a new sorted list
#You may use the pre-defined sorted_list to store the result
inSort:
	#Your implementation of inSort here

add $t1, $t1, -4
add $t7, $t7, 1
bne $t7, $s0, inSort	#helps move back to first number from original list
move $t7, $zero	

	la $s2, sorted_list
	sll $t2, $t0, 2
	add $t2, $t2, $s2
transfer:



	
		add $t1, $t1, 4	#moves down original list
		
		
		lw $t3, 0($t1)	#transfer from $t1 to $t2 
		sw $t3 0($t2)		
		
		add $t2, $t2, -4 #moves down copied list
		
		
		
	 
		
		add $t7, $t7, 1
		bne $t7, $s0, transfer 


move $t7, $zero


top1:
add $t2, $t2, 4
add $t7, $t7, 1
bne $t7, $s0, top1
move $t7, $zero		#helps move to first number 






addi $t9 $t9 1
addi $t8 $t8 1

insertion:

		lw $s5, 0($t2)
		lw $s4, -4($t2)		#checks next number




		beq $t9, $s0, reset	
		bgt $s5, $s4, sort	#checks if current number is greater than next number


counter:
addi $t9, $t9, 1
add $t2, $t2, -4	#moves to next number
add $t7, $t7, 1		#counter to see if it hits end of number list
bne $t7, $s0, insertion	




sort:
  	 	sw $s5, -4($t2)
		sw $s4, 0($t2)	#helps switch number
  		 
bne $t7, $s0, counter	





reset:
move $t7 $zero
move $t9 $t8
addi $s6 $s6 1		# resets

topagain1:
sub $s3, $s0, 1
mul $s3, $s3, 4
add $t2, $t2 $s3     #goes back to first number





bne $s6, $s0, insertion  #jumps back , continues if it doesnt equal
move $s6, $zero





move $t7, $zero


top2:
add $t1, $t1, -4
add $t7, $t7, 1
bne $t7, $s0, top2

move $t7, $zero		#goes back to first number of original list




	jr $ra
	
	
#bSearch takes in a list, its size, and a search key as arguments.
#It performs binary search RECURSIVELY to look for the search key.
#It will return a 1 if the key is found, or a 0 otherwise.
#Note: you MUST NOT use iterative approach in this function.
bSearch:
	#Your implementation of bSearch here

sw $ra 0($sp) #stores original return address
addi $t9 $t9 1
addi $sp $sp -4	 	
	
	
	
addi $s1 $s1 1 #checker to see if it hits max dividing and if it does key is not found

move $t7 $zero #counter reset


rem $s4 $s5 2
div $s5 $s5 2
add $s5 $s4 $s5


lw $s6 0($t2)

  	beq $s1 $s0 keynotfound
	blt $a3 $s6 keyislessthan
	beq $a3	$s6 keyequalmidpoint
  	bgt $a3 $s6 keyisgreaterthan
	#checks key's condition


keyislessthan:
addi $t2 $t2 4		#goes down 
add $t7 $t7 1

bne $t7 $s5 keyislessthan
jal bSearch


keyisgreaterthan:
addi $t2 $t2 -4			#goes up 
add $t7 $t7 1		

bne $t7 $s5 keyisgreaterthan
jal bSearch



keyequalmidpoint:
addi $t8 $t8 1
addi $sp $sp 4
bne $t8 $t9 keyequalmidpoint	#help get original return address


lw $ra 0($sp)
move $v0 $zero
addi $v0 $v0 1
	jr $ra
	
	
keynotfound:

addi $t8 $t8 1
addi $sp $sp 4
bne $t8 $t9 keynotfound

lw $ra 0($sp)
move $v0 $zero
	jr $ra
