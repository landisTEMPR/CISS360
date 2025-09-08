        .text
        .globl main
main:
        li      $s0, 5
        syscall

        add     $a0, $v0, $v0
        add     $a0, $v0, $v0
        li      $v0, 5
        syscall

        add     $s0, $v0, $v0
        add     $s0, $s0, $s0
        add     $s0, $s0, $s0
        add     $s0, $s0, $s0
        sub     $a0, $a0, $s0

        li      $v0, 1
        syscall

        li      $v0, 10
        syscall
        
        
