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
    call print_current_player
    call print_message
    call check_victory
    
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

; Sets the correct color attribute for each character and prints it
print_char PROC
                                                         
    mov AH, 09h   ; Set interrupt to print
    mov CX, 1     ; So that the character is only printed once
    
    ; Set attribute to white foreground, black background
    mov BL, 0Fh
  
    int 10h       ; Print character interrupt
    inc DL        ; Increasing the position of the cursor horizontally
    mov AH, 2h    ; 2 is for setting an interrupt to set the cursor position
    int 10h
      
    ret
print_char ENDP

carriage_return PROC
    inc DH 
    mov DL, 1 
    mov AH, 2h 
    int 10h
    
    ret
    
carriage_return ENDP


    
    ; Print X or O with styling depending on turn                         
print_current_player PROC
    ; Set interrupt to print
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
        int 10h  ; Print character interrupt
        
        inc DL  ;Increasing the position of the cursor horizontally
        mov AH, 2h  ; 2 is for setting an interrupt to set the cursor position
        int 10h
        
        ret
print_current_player ENDP
   

;function to check the victory and the winner
check_victory PROC

    cmp current_player, 0
    je is_x_turn
    
    mov AL, "O"
    jmp continue_check_victory
        
    is_x_turn:
        mov AL, "X"

    continue_check_victory:

    ; Row 1, 2, 3
    cmp pos[0], " "
    je check_456 ; Check for " " empty position
    
    cmp AL, pos[0]
    jne check_456
    cmp AL, pos[1]
    jne check_456
    cmp AL, pos[2]
    jne check_456   
    jmp victory

    ; Row 4, 5, 6
    check_456:
    cmp pos[3], " "
    je check_789 
    
    cmp AL, pos[3]
    jne check_789
    cmp AL, pos[4]
    jne check_789
    cmp AL, pos[5]
    jne check_789    
    jmp victory
    
    ; Row 7, 8, 9
    check_789:
    cmp pos[6], " "
    je check_147
    
    cmp AL, pos[6]
    jne check_147
    cmp AL, pos[7]
    jne check_147
    cmp AL, pos[8]
    jne check_147    
    jmp victory

    ; Column 1, 4, 7
    check_147:

    victory:
    mov player_won, 1
    
    no_victory:
    ret

ret
check_victory ENDP


end_program:
ret

;
; ----------
;

current_player DB 0 ; 0 for X and 1 for O

; 20H is the space character
; Duplicate 20H 9 times (for 9 positions)
; pos is an Array for the 9 grid positions
pos DB 9 DUP(20H)

player_won DB 0 ; 0 if a player hasn't won yet , 1 otherwise


 ; Row 1
    
    mov AL, pos[0]
    call print_char
    
print_message PROC
    ; BL will be used to as the index into the string
    mov BX, 0
    
    text_loop:
        mov AH, 0Ah ; Write character without attribute
        mov AL, message[BX]
        cmp AL, "$" ; Check for sentinel
        je end_text_loop ; End if sentinel is found
        int 10h
        inc BX
        
        inc DL ; Incrementing the cursor position horizontally
        mov AH, 2h ; Set interrupt to set cursor position
        int 10h
        
        jmp text_loop
        
    end_text_loop:
        call carriage_return
        ret
print_message ENDP    

