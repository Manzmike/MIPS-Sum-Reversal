########################################################### 
# This program will ask for one  integers and then 
# adds them down and counts down to one
# then outputs to the screen
########################################################### 
.text 
.globl main 
main: li $v0,4   # system call to print MSG1 
la $a0, MSG1 
syscall 
li $v0,5   # system call to get integer1 
syscall 
 lw $t5, INPUT1 
#sw $v0, 0($t5)  # store integer in t5 
add $t5,$v0,$zero
#fix sw 
li $v0,0

Loop:
	ble $t5, $zero, Exit
	add $v0, $v0, $t5
	addi $t5, $t5, -1
	j Loop
	
Exit: 	move $t1,$v0
	li $v0,4
	la $a0, SUM 
	syscall
	move $a0,$t1
	li $v0,1
	syscall
.data 
 MSG1: .asciiz "Enter N: "
 SUM: .asciiz "Total:  "   
 # a word boundary alignment 
.align 2 
# reserve a word space 
INPUT1: .space 4 
