###############################################################################
#       File : a02q02.s
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
        #   $t0, $t1, $t2, $t3, $t5, $t6
        # OUTPUT:
        #   $s0 = 2*a - c - d
        #   $s1 = b
        #   $s3 = c
        #   $s4 = d
        #=====================================================================
        # s0 = a
        # s1 = b
        # s3 = c
        # s4 = d
        move $t0, $s0       # t0 = s0 = a
        add $t0, $t0, $t0   # t0 = t0 + t0 = a + a = 2*a
        add $t0, $t0, $t0   # t0 = t0 + t0 = 2*a + 2*a = 4*a
        add $t1, $s1, $s3   # t1 = s1 + s3 = b + c
        add $t2, $s0, $s0   # t2 = s0 + s0 = a + a = 2*a
        add $t1, $t1, $t2   # t1 = t1 + t2 = (b + c) + 2*a = 2*a + b + c
        sub $t3, $s4, $s1   # t3 = s4 - s1 = d - b
        sub $t5, $t0, $t1   # t5 = t0 - t1 = 4*a - (2*a + b + c)
                            #    = 2*a - b - c
        sub $t6, $t5, $t3   # t6 = t5 - t3 = (2*a - b - c) - (d - b)
                            #    = 2*a - b - c - d + b
                            #    = 2*a - c - d
        move $s0, $t6       # s0 = t6 = 2*a - c - d
        
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
