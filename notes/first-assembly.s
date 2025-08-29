        .text
        .globl main
        
main:   li      $s0, 1  # F
        li      $s1, 2  # G
        li      $s2, 3  # H
        li      $s3, 4  # I
        li      $s4, 5  # J

        add     $t0, $s1, $s2
        add     $t1, $s3, $s4
        sub     $s0, $t0, $t1
        syscall

        li      $v0, 10
        syscall
