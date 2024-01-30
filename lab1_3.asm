########################################################### 
# This program will ask for a defined input of values for the array size
# then from this it it stores the values in temp array then lastly 
# then it’s stored the values into the old array but backward
########################################################### 

.text 
.globl main 
#index of $t0

 
main: 
#input for the amount of numbers in array
li $v0,4   # system call to print MSG1 
la $a0, MSG 
syscall 
li $v0,5   # system call to get integer1 
syscall 
lw $v1, INPUT1 
add $t1,$zero,$v0	
		
Loop:
	bge $t0, $t1, Print_Array_MSG1	
		li $v0,4
		la $a0, SPOT
		syscall
		li $v0,1
		addi $a0, $t4,0
		syscall
		li $v0,4
		la $a0, SPACE
		syscall
		li $v0,5   # system call to get integer1 
		syscall 
		move $s0,$v0
		#adding one to t0 for for loop
		addi $t0,$t0,1
		#storing in array
		sw $s0,My_Array($t9)
		addi $t9,$t9,4
		addi $t4,$t4,1
	j Loop	
	
Reversal:
	ble $t0, $zero, Reversal2	
		lw $s1,My_Array($s4)
		sw $s1, Temp_Array($t5)
		addi $s4,$s4,4
		addi $t5,$t5,-4
		#fixing for loop
		addi $t0,$t0,-1 
		add $t2,$zero,0
		add $t9,$zero,0
		add $t3,$zero,0
		add $t7,$zero,0
	j Reversal
	
Reversal2:
	bge $s5, $t1, Print_Array
		lw $s6,Temp_Array($t7)
		sw $s6, My_Array($t7)
		addi $t7,$t7,4
		addi $s5,$s5,1	
	j Reversal2

Print_Array_MSG1:
	bge $t7,1, Print_Array
		li $v0,4
		la $a0, PRINT1
		syscall
		addi $t7,$t7,1
	j Print_Array_MSG1
	
Print_Array_MSG2:
	bge $t8,1, Reversal
		li $v0,4
		la $a0, PRINT2
		syscall
		addi $t8,$t8,1
		mul $t5,$t1,4
		addi $t5,$t5,-4
	j Print_Array_MSG2	
				
Print_Array:
	bge $t2, $t1, Print_Array_MSG2
		add $t9,$zero,$t3
		lw $t6, My_Array($t9)
		li $v0,1
		li $v0,4
		la $a0, SPOT
		syscall
		li $v0,1
		addi $a0, $t2,0
		syscall
		li $v0,4
		la $a0, SPACE
		syscall
		li $v0,1
		addi $a0,$t6,0
		syscall 
		li $v0,4
		la $a0, NEWLINE
		syscall
		addi $t3,$t3,4
		addi $t2,$t2,1
	j Print_Array
Exit:


 .data 
My_Array: .space 400
Temp_Array: .space 400
 MSG: .asciiz "Number of values: "
 ARRAY: .asciiz "Value: "
 PRINT1: .asciiz "\nRegular Array\n"
 PRINT2: .asciiz "\Reversed Array\n"
 SPOT: .asciiz "Spot #"
 SPACE: .asciiz " "
 NEWLINE: .asciiz "\n"
 # a word boundary alignment 
.align 2 
# reserve a word space 
INPUT1: .space 4 
INPUT2: .space 4 
