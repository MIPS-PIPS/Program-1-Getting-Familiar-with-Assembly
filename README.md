# CS 2640 Program 1 Getting Familiar with Assembly
Group members: Michael Wu, Brandon Tseng, Jonathan Dang

## Instructions:

### <ins>Task 1: User Input and Output</ins>

In this task, you will practice getting user input, moving them to registers, and printing them back to the user. Below are the specific requirements for this task:

Use `main:` label for this task
Get 2 int values from the user
The two user values should be held in registers `$s0` and `$s1`, respectively
Output the user inputs in the "Run I/O" section in MARS environment back to the user

### <ins>Task 2: Arithmetic Operation Practice</ins>

Using the user input values in registers $s0 and $s1, write MIPS Assembly code to complete the arithmetic operations below:

add two values (use instruction `add`)
subtract two values (use instruction `sub`)
multiply two values (use instruction `mul`)
divide two values (use instruction `div`)
Output the arithmetic results in the "Run I/O" section in MARS environment back to the user

### <ins>Task 3: Conditions</ins>

In this final task, you will practice how to do conditions in Assembly:

If the two user inputs from Task 1 are equal to each other, output `User inputs are the same`
If the two user inputs from Task 1 are not equal to each other, output `User inputs are different`
