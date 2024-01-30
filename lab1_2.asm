########################################################### 
# This program will ask for one  integers and then 
# adds them down and counts down to one
# then outputs to the screen
########################################################### 
.text 
.globl main 
 
main: 
li $v0,4   # system call to print MSG1 
la $a0, MSG1 
syscall 
li $v0,5   # system call to get integer1 
syscall 
lw $t5, INPUT1
add $t5,$v0,$zero
move $t1,$v0 #loading the value of v0 into t1
move $t2,$v0 #loading the value of v0 into t2
addi $t1,$t1,1 #adding 1 to t1
mul $t3,$t2,$t1 # multipling v0 by t1
div $t3,$t3,2  #diving t3 by 2
move $v0,$t3  #moving the value of t3 into v0
move $t4,$v0
li $v0,4
la $a0, SUM 
syscall
move $a0,$t4
li $v0,1
syscall

.data 
 MSG1: .asciiz "Enter N: "
 SUM: .asciiz "Total:  "   
 
 # a word boundary alignment 
.align 2  
# reserve a word space 
INPUT1: .space 4 
