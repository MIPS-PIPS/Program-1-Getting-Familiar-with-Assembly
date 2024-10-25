# CS 2640
# 10/21/2024
# Program 1 Getting Familiar with Assembly
# Brandon Tseng, Michael Wu, Jonathan Dang

.data
	prompt1: .asciiz		"What is your first number: "
	prompt2: .asciiz		"What is your second number: "
	menu: .asciiz "1) addition\n2) Subtraction\n3) Multiplication\n4)Division\n"

.text
main:
	# Print first prompt
	li $v0, 4
	la $a0, prompt1
	syscall
	
	# Store first integer
	li $v0, 5
	syscall
	move $s0, $v0
	
	# Print second prompt
	li $v0, 4
	la $a0, prompt2
	syscall
	
	# Store second integer
	li $v0, 5
	syscall
	move $s1, $v0

	#adding 2 ints
	add $s3, $s0, $s1
	li $v0, 1
	move $a0, $s3
	syscall

	#subtracting 2 ints
	sub $s3, $s0, $s1
	li $v0, 1
	move $a0, $s3
	syscall

	#multiplying 2 ints
	mul $s3, $s0, $s1
	li $v0, 1
	move $a0, $s3
	syscall

	#dividing 2 ints
	div $s3, $s0, $s1
	li $v0, 1
	move $a0, $s3
	syscall
	
	# Exit syscall
	li $v0, 10
	syscall
