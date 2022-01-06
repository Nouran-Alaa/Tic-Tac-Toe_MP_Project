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

;
; ----------
;

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
    
    ; Set the correct color attribute
    ; If the Charc is X jump
    cmp AL, "X"
    je if_char_x
    
    ; Else if the Charc is O jump
    cmp AL, "O"
    je if_char_o
    
    ; else is something other than X or O 'default'
    ; Set attribute to white foreground, black background
    mov BL, 0Fh
    jmp print_char_interrupt
    
    if_char_x:
        mov BL, 09h   ; 9h is the attribute of the light blue color
        jmp print_char_interrupt
        
    if_char_o:
        mov BL, 0Ch   ; Ch is the attribute of the light red color
  
    print_char_interrupt:
    int 10h       ; Print character interrupt
    
    inc DL        ; Increasing the position of the cursor horizontally
    mov AH, 2h    ; 2h is for setting the interrupt to set the cursor position
    int 10h
      
    ret
print_char ENDP

carriage_return PROC
    inc DH        ; Increasing the position of the cursor vertically
    mov DL, 1     ; Resetting horizontal cursor position
    mov AH, 2h    ; 2h is for setting the interrupt to set the cursor position
    int 10h
    
    ret
    
carriage_return ENDP

; Prints the grid to the screen
print_grid PROC
    

    mov AL, 03h
    mov AH, 0
    int 10h
    
    mov DL, 1
    mov DH, 1
    mov AH, 2h 
    int 10h 

; print Row 1
    
    mov AL, pos[0] ; put array of 0 in AL
    call print_char ; print array 
    
    mov AL, '|' ;put this sympol in AL
    call print_char ; print this sympol
    
    mov AL, pos[1]
    call print_char ; print array of 1
    
    mov AL, '|'
    call print_char ; print this sympol 
    
    mov AL, pos[2]  ; put array 2 in AL
    call print_char ; print
    
    call carriage_return ; print new line 


  ; print Row 2
    
    mov AL, '-'  ; put symppol in AL
    call print_char ; print sympol
    
    mov AL, '+'  ; put symppol in AL
    call print_char  ; print sympol 
    
    mov AL, '-'  ; put symppol in AL
    call print_char ; print sympol 
    
    mov AL, '+'  ; put symppol in AL
    call print_char ; print sympol 
    
    mov AL, '-'  ; put symppol in AL
    call print_char  ; print sympol 
    
    call carriage_return ; print new line

   ; Print Row 3
    
    mov AL, pos[3]
    call print_char
    
    mov AL, '|'
    call print_char
    
    mov AL, pos[4]
    call print_char
    
    mov AL, '|'
    call print_char
    
    mov AL, pos[5]
    call print_char
    
    call carriage_return
 
    ; Print Row 4
    
    mov AL, '-'
    call print_char
    
    mov AL, '+'
    call print_char
    
    mov AL, '-'
    call print_char
    
    mov AL, '+'
    call print_char
    
    mov AL, '-'
    call print_char
    
    call carriage_return
   
; Print Row 5
    
    mov AL, pos[6]
    call print_char
    
    mov AL, '|'
    call print_char
    
    mov AL, pos[7]
    call print_char
    
    mov AL, '|'
    call print_char
    
    mov AL, pos[8]
    call print_char
    
    call carriage_return
    call carriage_return
    
    ret
   print_grid ENDP

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

get_input PROC
    mov AH, 1 ; DOS interrupt to get character from keyboard
    int 21h
    
    ; AL will contain the inputted character
    
    ret
get_input ENDP
   

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
    cmp pos[0], " "
    je continue_258 ; Check for " " empty position
    
    cmp AL, pos[0]
    jne check_258
    cmp AL, pos[3]
    jne check_258
    cmp AL, pos[6]
    jne check_258    
    jmp victory

    check_258:
    cmp pos[1], " "
    je check_369 ; Check for " " empty position
    
    cmp AL, pos[1]
    jne check_369
    cmp AL, pos[4]
    jne check_369
    cmp AL, pos[7]
    jne check_369    
    jmp victory

    check_369:
    cmp pos[2], " "
    je check_159 ; Check for " " empty position
    
    cmp AL, pos[2]
    jne check_159
    cmp AL, pos[5]
    jne check_159
    cmp AL, pos[8]
    jne check_159    
    jmp victory
    
    ; Diagonal 1, 5, 9
    check_159:

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


; 20H is the space character
; Duplicate 20H 9 times (for 9 positions)
; pos is an Array for the 9 grid positions
pos DB 9 DUP(20H)

current_player DB 0 ; 0 for X and 1 for O

message DB ", choose position$" ; $ is the terminating character (sentinel character)

player_won DB 0 ; 0 if a player hasn't won yet , 1 otherwise

victory_message DB " has won!$" ; $ is the terminating character (sentinel character)

