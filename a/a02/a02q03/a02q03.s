###############################################################################
#       File : a02q03.s
#       Author : Brysen Landis
###############################################################################

        .text
        .globl main
        
main:
        li $v0, 5           # Read int and store in $s0
        syscall
        move $s0, $v0
        
        li $v0, 5           # Read int and store in $s1
        syscall
        move $s1, $v0
        
        li $v0, 5           # Read int and store in $s3
        syscall
        move $s3, $v0
        
        li $v0, 5           # Read int and store in $s4
        syscall
        move $s4, $v0
        
        #=====================================================================
        # INPUT:
        #   a, b, c, d
        # REGISTER ASSOCIATION:
        #   $s0 = a
        #   $s1 = b
        #   $s3 = c
        #   $s4 = d
        # TEMPORARY REGISTERS USED:
        #   None
        # OUTPUT:
        #   $s0 = 2*a - c - d
        #   $s1 = b
        #   $s3 = c
        #   $s4 = d
        #=====================================================================
        add $s0, $s0, $s0   # s0 = s0 + s0 = a + a = 2*a
        sub $s0, $s0, $s3   # s0 = s0 - s3 = 2*a - c
        sub $s0, $s0, $s4   # s0 = s0 - s4 = 2*a - c - d
        
        li $v0, 1           # Print int $s0
        move $a0, $s0
        syscall
        
        li $v0, 4           # Print newline
        la $a0, NEWLINE
        syscall
        
        li $v0, 1           # Print int $s1
        move $a0, $s1
        syscall
        
        li $v0, 4           # Print newline
        la $a0, NEWLINE
        syscall
        
        li $v0, 1           # Print int $s3
        move $a0, $s3
        syscall
        
        li $v0, 4           # Print newline
        la $a0, NEWLINE
        syscall
        
        li $v0, 1           # Print int $s4
        move $a0, $s4
        syscall
        
        li $v0, 4           # Print newline
        la $a0, NEWLINE
        syscall
        
        li $v0, 10          # Exit
        syscall

        .data
NEWLINE: .asciiz "\n"
