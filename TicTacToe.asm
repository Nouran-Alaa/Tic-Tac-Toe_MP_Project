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
