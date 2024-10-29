# CS 2640
# 10/21/2024
# Program 1 Getting Familiar with Assembly
# Brandon Tseng, Michael Wu, Jonathan Dang

.data
	prompt1: .asciiz "What is your first number: "
	prompt2: .asciiz "What is your second number: "
	menu: .asciiz "Select arithmetic operation\n 1) Addition\n 2) Substraction\n 3) Multiplication\n 4) Division\nSelection: "
	result: .asciiz "Your result is: "
	true: .asciiz "\nUser inputs are the same."
	false: .asciiz "\nUser inputs are different."

.text
main:
	# Print first prompt
	li $v0, 4
	la $a0, prompt1
	syscall
	
	# Get first integer input
	li $v0, 5
	syscall
	move $s0, $v0
	
	# Print second prompt
	li $v0, 4
	la $a0, prompt2
	syscall
	
	# Get second integer input
	li $v0, 5
	syscall
	move $s1, $v0
	
	# Print menu
	li $v0, 4
	la $a0, menu
	syscall
	
	# Get menu selection
	li, $v0, 5
	syscall
	move $s2, $v0
	
	# Compare selections
	beq $s2, 1, addition
	beq $s2, 2, substraction
	beq $s2, 3, multiplication
	beq $s2, 4, division
	
addition:
	# Adding 2 ints
	add $s3, $s0, $s1
	
	# Print output
	li $v0, 4
	la $a0, result
	syscall
	li $v0, 1
	move $a0, $s3
	syscall
	
	# Skip other cases to continue program
	j continue_program

substraction:
	# Subtracting 2 ints
	sub $s3, $s0, $s1
	
	# Print output
	li $v0, 4
	la $a0, result
	syscall
	li $v0, 1
	move $a0, $s3
	syscall
	
	# Skip other cases to continue program
	j continue_program

multiplication:
	# Multiplying 2 ints
	mul $s3, $s0, $s1
	
	# Print output
	li $v0, 4
	la $a0, result
	syscall
	li $v0, 1
	move $a0, $s3
	syscall
	
	# Skip other cases to continue program
	j continue_program

division:
	# Dividing 2 ints
	div $s3, $s0, $s1
	
	# Print output
	li $v0, 4
	la $a0, result
	syscall
	li $v0, 1
	move $a0, $s3
	syscall
	
continue_program:
	# Compare ints to each other
	beq $s0, $s1, is_equal
	bne $s0, $s1, is_not_equal
	
is_equal:
	# Print true result
	li, $v0, 4
	la, $a0, true
	syscall

	# Exit syscall
	li $v0, 10
	syscall
	
is_not_equal:
	# Print false result
	li, $v0, 4
	la, $a0, false
	syscall
	
	# Exit syscall
	li $v0, 10
	syscall
