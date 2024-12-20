# CS 2640
# 11/3/2024
# Program 1 Getting Familiar with Assembly
# Brandon Tseng, Michael Wu, Jonathan Dang
# Github Repository: https://github.com/MIPS-PIPS/Program-1-Getting-Familiar-with-Assembly/tree/main

.data
	prompt1: .asciiz "What is your first number: "
	prompt2: .asciiz "What is your second number: "
	menu: .asciiz "Select arithmetic operation\n 1) Addition\n 2) Subtraction\n 3) Multiplication\n 4) Division\nSelection: "
	invalidMenuInput: .asciiz "Please enter a valid menu option (1, 2, 3, or 4)\n"
	result: .asciiz "The result of the arithmetic operation is: "
	divideByZero: .asciiz "Error: can't divide by 0"
	true: .asciiz "\nUser inputs are the same."
	false: .asciiz "\nUser inputs are different."

.text
main:

getFirstNumber:
	# Print first prompt
	li $v0, 4
	la $a0, prompt1
	syscall
	
	# Get first integer input
	li $v0, 5
	syscall
    	move $s0, $v0 # stored in $s0
	
	# Print second prompt
	li $v0, 4
	la $a0, prompt2
	syscall
	
	# Get second integer input
	li $v0, 5
	syscall
	move $s1, $v0 # stored in $s1
	j promptMenu

repromptMenu:
	# for reprompt
	li $v0, 4
	la $a0, invalidMenuInput
	syscall

promptMenu:
	# Print menu
	li $v0, 4
	la $a0, menu
	syscall
	
	# Get menu selection
	li, $v0, 5
	syscall
	move $s2, $v0

	# Check if $t0 is between 1 and 4
    	li $t1, 1 # Load 1 into $t1 (lower bound)
    	li $t2, 4 # Load 4 into $t2 (upper bound)

    	blt $s2, $t1, repromptMenu # if $t0 < 1
    	bgt $s2, $t2, repromptMenu # if $t0 > 4
	
	# Compare selections
	beq $s2, 1, addition
	beq $s2, 2, subtraction
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

subtraction:
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
    # Check for division by zero
    bne $s1, $zero, performDivision  # If $s1 is not zero, branch to performDivision
	# Division by zero error handling
	
divideByZeroError:
    # Print divide by zero error message
    li $v0, 4
    la $a0, divideByZero
    syscall
    j continue_program # Skip division and go to the end or next part of the program

performDivision:
    # Dividing 2 ints
	div $s3, $s0, $s1
	
	# Print output
	li $v0, 4
	la $a0, result
	syscall
	li $v0, 1
	move $a0, $s3
	syscall

    # Continue to the rest of the program
    j continue_program
	
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
