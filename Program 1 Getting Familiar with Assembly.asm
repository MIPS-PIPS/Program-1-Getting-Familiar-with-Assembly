# CS 2640
# 10/21/2024
# Program 1 Getting Familiar with Assembly
# Brandon Tseng, Michael Wu, 

.data
	prompt1: .asciiz		"What is your first number: "
	prompt2: .asciiz		"What is your second number: "

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
	
	# Exit syscall
	li $v0, 10
	syscall