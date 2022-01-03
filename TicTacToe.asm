org 100h

;
; Initialise
;
                   
; Set video mode
mov AL, 03h
mov AH, 0
int 10h

; Set cursor position
mov DH, 1
mov DL, 1
mov BH, 0
mov AH, 2
int 10h

; Set attribute to white foreground, black background
mov BL, 0Fh

game_loop:
    ; Main loop body
    
;switching turns between players 
    cmp current_player, 0 ; 0 if X, 1 if O
    je if_x_CrntPlyr
    
    ; if_o_CrntPlyr:
            ;if the current player is O switch to X
        mov current_player, 0        
        jmp game_loop
    
    if_x_CrntPlyr:
        ;if the current player is X switch to O 
        mov current_player, 1      
        jmp game_loop
      
print_char PROC
                                                         
    mov AH, 09h 
    mov CX, 1 
    
    ; Set attribute to white foreground, black background
    mov BL, 0Fh
  
    int 10h    ; Print charcter interrupt
    inc DL     
    mov AH, 2h 
    int 10h
      
    ret
print_char ENDP
    
    ; Print X or O with styling depending on turn                         
print_current_player PROC
    mov AH, 09h
    
    cmp current_player, 0 ; 0 if X, 1 if O
    je is_x
    
    ; is O
        mov AL, "O"
        mov BL, 0Ch ; C is an attribute of the light red color
        jmp end_pcp
    
    is_x:
        mov AL, "X"
        mov BL, 09h ; 9 is the attribute of the light blue
    
    end_pcp:
        int 10h
        
        inc DL  ;Increasing the position of the cursor horizontally
        mov AH, 2h  ; 2 is for setting an interrupt to set the cursor position
        int 10h
        
        ret
print_current_player ENDP
   

end_program:
ret

;function to check the victory and the winner
check_victory PROC

    cmp current_player, 0
    je is_x_turn
    
    mov AL, "O"
    jmp continue_check_victory
        
    is_x_turn:
        mov AL, "X"

    continue_check_victory:


ret
check_victory ENDP

current_player DB 0 ; 0 for X and 1 for O

;
; ----------
;

; 20H is the space character
; Duplicate 20H 9 times (for 9 positions)
; pos is an Array for the 9 grid positions
pos DB 9 DUP(20H)

player_won DB 0 ; 0 if a player hasn't won yet , 1 otherwise


 ; Row 1
    
    mov AL, pos[0]
    call print_char
