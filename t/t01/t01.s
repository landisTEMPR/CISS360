# File : t01.s
# Author : Brysen Landis

        .text
        .globl main

#==========================================================================
# MAIN LOOP
#==========================================================================
main:
        # Initialize stack pointer
        la      $sp, 0x7fffeffc
        
        li      $v0, 4
        la      $a0, prompt_game
        syscall
        
        li      $v0, 4
        la      $a0, prompt_n
        syscall
        
        li      $v0, 5
        syscall
        sw      $v0, n_size             
        
        jal     init_board
        
        li      $v0, 4
        la      $a0, prompt_first
        syscall
        
        jal     computer_first_move
        
        jal     display_board
        
game_loop:
        jal     get_user_move

        li      $a0, 1
        jal     check_winner
        beq     $v0, 1, user_wins

        jal     check_draw
        beq     $v0, 1, game_draw
        
        jal     computer_move

        jal     display_board

        li      $a0, 2
        jal     check_winner
        beq     $v0, 1, computer_wins
        
        jal     check_draw
        beq     $v0, 1, game_draw
        
        j       game_loop

user_wins:
        li      $v0, 4
        la      $a0, msg_user_win
        syscall
        j       exit_program

computer_wins:
        li      $v0, 4
        la      $a0, msg_comp_win
        syscall
        j       exit_program

game_draw:
        li      $v0, 4
        la      $a0, msg_draw
        syscall
        j       exit_program

exit_program:
        li      $v0, 10
        syscall

#==========================================================================
# FUNCTION: init_board
#==========================================================================
init_board:
        li      $t0, 0
        lw      $t1, n_size
        mul     $t2, $t1, $t1
        la      $t3, board
init_loop:
        beq     $t0, $t2, init_done
        sb      $zero, 0($t3)
        addi    $t3, $t3, 1
        addi    $t0, $t0, 1
        j       init_loop
init_done:
        jr      $ra

#==========================================================================
# FUNCTION: computer_first_move
#==========================================================================
computer_first_move:
        addi    $sp, $sp, -4
        sw      $ra, 0($sp)
        
        lw      $t0, n_size
        srl     $t1, $t0, 1
        
        move    $a0, $t1
        move    $a1, $t1
        li      $a2, 2
        jal     set_cell
        
        lw      $t2, total_moves
        addi    $t2, $t2, 1
        sw      $t2, total_moves
        
        lw      $ra, 0($sp)
        addi    $sp, $sp, 4
        jr      $ra

#==========================================================================
# FUNCTION: get_user_move
#==========================================================================
get_user_move:
        addi $sp, $sp, -12
        sw $ra, 0($sp)
        sw $s1, 4($sp)
        sw $s2, 8($sp)
        
get_move_loop:
        li      $v0, 4
        la      $a0, prompt_row
        syscall
        
        li      $v0, 5
        syscall
        move    $s1, $v0
        
        li      $v0, 4
        la      $a0, prompt_col
        syscall
        
        li      $v0, 5
        syscall
        move    $s2, $v0
        
        lw      $t0, n_size
        bltz    $s1, invalid_move
        bge     $s1, $t0, invalid_move
        bltz    $s2, invalid_move
        bge     $s2, $t0, invalid_move
        
        # Validate move
        move    $a0, $s1
        move    $a1, $s2
        jal     get_cell
        beq     $v0, 0, valid_move
        
invalid_move:
        li      $v0, 4
        la      $a0, msg_invalid
        syscall
        j       get_move_loop
        
valid_move:
        move    $a0, $s1
        move    $a1, $s2
        li      $a2, 1
        jal     set_cell
        
        lw      $t0, total_moves
        addi    $t0, $t0, 1
        sw      $t0, total_moves
        
        jal     display_board
        
        lw      $s2, 8($sp)
        lw      $s1, 4($sp)
        lw      $ra, 0($sp)
        addi    $sp, $sp, 12
        jr      $ra

#==========================================================================
# FUNCTION: computer_move
#==========================================================================
computer_move:
        addi    $sp, $sp, -4
        sw      $ra, 0($sp)
        
        jal     find_first_available
        
        move    $a0, $v0
        move    $a1, $v1
        li      $a2, 2
        jal     set_cell
        
        lw      $t0, total_moves
        addi    $t0, $t0, 1
        sw      $t0, total_moves
        
        lw      $ra, 0($sp)
        addi    $sp, $sp, 4
        jr      $ra

#==========================================================================
# FUNCTION: find_first_available
#==========================================================================
find_first_available:
        addi    $sp, $sp, -12
        sw      $ra, 0($sp)
        sw      $s0, 4($sp)
        sw      $s1, 8($sp)
        
        lw      $t0, n_size
        li      $s0, 0                 
        
find_row_loop:
        li      $s1, 0                  
        
find_col_loop:
        move    $a0, $s0
        move    $a1, $s1
        jal     get_cell
        beq     $v0, 0, found_empty
        
        addi    $s1, $s1, 1
        blt     $s1, $t0, find_col_loop
        
        addi    $s0, $s0, 1
        blt     $s0, $t0, find_row_loop
        
found_empty:
        move    $v0, $s0              
        move    $v1, $s1              
        
        lw      $s1, 8($sp)
        lw      $s0, 4($sp)
        lw      $ra, 0($sp)
        addi    $sp, $sp, 12
        jr      $ra

#==========================================================================
# FUNCTION: check_winner
#==========================================================================
check_winner:
        addi    $sp, $sp, -24
        sw      $ra, 0($sp)
        sw      $s0, 4($sp)
        sw      $s1, 8($sp)
        sw      $s2, 12($sp)
        sw      $s3, 16($sp)
        sw      $s4, 20($sp)
        
        move    $s0, $a0
        lw      $s3, n_size
        
        li      $s1, 0
check_rows:
        bge     $s1, $s3, check_cols
        li      $s4, 0
        li      $s2, 0
check_row_loop:
        bge     $s2, $s3, check_row_done
        
        move    $a0, $s1
        move    $a1, $s2
        jal     get_cell
        
        bne     $v0, $s0, check_next_row
        addi    $s4, $s4, 1
        
        addi    $s2, $s2, 1
        j       check_row_loop
        
check_row_done:
        beq     $s4, $s3, winner_found
        
check_next_row:
        addi    $s1, $s1, 1
        j       check_rows
        
check_cols:
        li      $s1, 0
check_cols_loop:
        bge     $s1, $s3, check_main_diag
        li      $s4, 0
        li      $s2, 0
check_col_loop:
        bge     $s2, $s3, check_col_done
        
        move    $a0, $s2
        move    $a1, $s1
        jal     get_cell
        
        bne     $v0, $s0, check_next_col
        addi    $s4, $s4, 1
        
        addi    $s2, $s2, 1
        j       check_col_loop
        
check_col_done:
        beq     $s4, $s3, winner_found
        
check_next_col:
        addi    $s1, $s1, 1
        j       check_cols_loop
        
check_main_diag:
        li      $s4, 0
        li      $s1, 0
check_mdiag_loop:
        bge     $s1, $s3, check_mdiag_finished
        
        move    $a0, $s1
        move    $a1, $s1
        jal     get_cell
        
        bne     $v0, $s0, check_anti_diag_start
        addi    $s4, $s4, 1
        
        addi    $s1, $s1, 1
        j       check_mdiag_loop
        
check_mdiag_finished:
        beq     $s4, $s3, winner_found
        
check_anti_diag_start:
        li      $s4, 0
        li      $s1, 0
check_adiag_loop:
        bge     $s1, $s3, check_adiag_finished
        
        move    $a0, $s1
        sub     $a1, $s3, $s1
        addi    $a1, $a1, -1
        
        jal     get_cell
        
        bne     $v0, $s0, check_adiag_skip
        addi    $s4, $s4, 1
        
check_adiag_skip:
        addi    $s1, $s1, 1
        j       check_adiag_loop
        
check_adiag_finished:
        beq     $s4, $s3, winner_found
        
no_winner:
        li      $v0, 0
        j       check_winner_done
        
winner_found:
        li      $v0, 1
        
check_winner_done:
        lw      $s4, 20($sp)
        lw      $s3, 16($sp)
        lw      $s2, 12($sp)
        lw      $s1, 8($sp)
        lw      $s0, 4($sp)
        lw      $ra, 0($sp)
        addi    $sp, $sp, 24
        jr      $ra

#==========================================================================
# FUNCTION: check_draw
#==========================================================================
check_draw:
        lw      $t0, total_moves
        lw      $t1, n_size
        mul     $t1, $t1, $t1
        
        beq     $t0, $t1, is_draw
        li      $v0, 0
        jr      $ra
        
is_draw:
        li      $v0, 1
        jr      $ra

#==========================================================================
# FUNCTION: display_board
#==========================================================================
display_board:
        addi    $sp, $sp, -20
        sw      $ra, 0($sp)
        sw      $s1, 4($sp)
        sw      $s2, 8($sp)
        sw      $s3, 12($sp)
        sw      $s4, 16($sp)
        
        lw      $s3, n_size
        li      $s1, 0
        
display_outer_loop:
        li      $s2, 0
display_top_border:
        li      $v0, 4
        la      $a0, char_plus
        syscall
        
        li      $v0, 4
        la      $a0, char_minus
        syscall
        
        addi     $s2, $s2, 1
        blt      $s2, $s3, display_top_border
        
        li      $v0, 4
        la      $a0, char_plus
        syscall
        
        li      $v0, 4
        la      $a0, char_newline
        syscall
        
        li      $s2, 0
display_row_content:
        li      $v0, 4
        la      $a0, char_pipe
        syscall
        
        move    $a0, $s1
        move    $a1, $s2
        jal     get_cell
        move    $s4, $v0
        
        beq     $s4, 0, print_empty
        beq     $s4, 1, print_x
        beq     $s4, 2, print_o
        
print_empty:
        li      $v0, 4
        la      $a0, char_space
        syscall
        j       continue_row
        
print_x:
        li      $v0, 4
        la      $a0, char_x
        syscall
        j       continue_row
        
print_o:
        li      $v0, 4
        la      $a0, char_o
        syscall
        
continue_row:
        addi    $s2, $s2, 1
        blt     $s2, $s3, display_row_content
        
        li       $v0, 4
        la      $a0, char_pipe
        syscall
        
        li      $v0, 4
        la      $a0, char_newline
        syscall
        
        addi    $s1, $s1, 1
        blt     $s1, $s3, display_outer_loop
        
        li      $s2, 0
display_bottom_border:
        li      $v0, 4
        la      $a0, char_plus
        syscall
        
        li      $v0, 4
        la      $a0, char_minus
        syscall
        
        addi    $s2, $s2, 1
        blt     $s2, $s3, display_bottom_border
        
        li      $v0, 4
        la      $a0, char_plus
        syscall
        
        li      $v0, 4
        la      $a0, char_newline
        syscall
        
        lw      $s4, 16($sp)
        lw      $s3, 12($sp)
        lw      $s2, 8($sp)
        lw      $s1, 4($sp)
        lw      $ra, 0($sp)
        addi    $sp, $sp, 20
        
        jr      $ra

#==========================================================================
# FUNCTION: get_cell
#==========================================================================
get_cell:
        bltz    $a0, get_cell_invalid
        bltz    $a1, get_cell_invalid
        lw      $t0, n_size
        bge     $a0, $t0, get_cell_invalid
        bge     $a1, $t0, get_cell_invalid
        
        mul     $t1, $a0, $t0
        add     $t1, $t1, $a1
        
        la      $t2, board
        add     $t2, $t2, $t1
        lb      $v0, 0($t2)
        
        jr      $ra

get_cell_invalid:
        li      $v0, 0
        jr      $ra

#==========================================================================
# FUNCTION: set_cell
#==========================================================================
set_cell:
        bltz    $a0, set_cell_done
        bltz    $a1, set_cell_done
        lw      $t0, n_size
        bge     $a0, $t0, set_cell_done
        bge     $a1, $t0, set_cell_done
        
        mul     $t1, $a0, $t0
        add     $t1, $t1, $a1

        la      $t2, board
        add     $t2, $t2, $t1
        sb      $a2, 0($t2)
        
set_cell_done:
        jr      $ra

        .data
prompt_game:    .asciiz "Let's play a game of tic-tac-toe.\n"
prompt_n:       .asciiz "Enter n: "
prompt_first:   .asciiz "I'll go first.\n"
prompt_row:     .asciiz "Enter row: "
prompt_col:     .asciiz "Enter column: "
msg_draw:       .asciiz "We have a draw!\n"
msg_comp_win:   .asciiz "I'm the winner!\n"
msg_user_win:   .asciiz "You are the winner!\n"
msg_invalid:    .asciiz "Invalid move. Try again.\n"

char_space:     .asciiz " "
char_x:         .asciiz "X"
char_o:         .asciiz "O"
char_pipe:      .asciiz "|"
char_plus:      .asciiz "+"
char_minus:     .asciiz "-"
char_newline:   .asciiz "\n"

board:          .space 10000
n_size:         .word 0
total_moves:    .word 0
