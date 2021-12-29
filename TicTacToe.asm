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
    ; Print X or O with styling depending on turn                         
print_current_player PROC
    mov AH, 09h
    
    cmp current_player, 0 ; 0 if X, 1 if O
    je is_x
    
    ; is O
        mov AL, "O"
        mov BL, 0Ch 
        jmp end_pcp
    
    is_x:
        mov AL, "X"
        mov BL, 09h 
    
    end_pcp:
        int 10h
        
        inc DL  ;Increasing the position of the cursor horizontally
        mov AH, 2h  ; 2 is for setting an interrupt to set the cursor position
        int 10h
        
        ret
print_current_player ENDP
   

end_program:
ret

current_player DB 0 ; 0 for X and 1 for O

;
; ----------
;
