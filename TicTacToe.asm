.MODEL SMALL
.STACK 100H
.DATA

;printing msgs from variables of size byte (char)
welcome db " Welcome to `Tic-Tac-Toe' Game !!$"
ttt1 db " 1|2|3$"
ttt2 db " 4|5|6$"
ttt3 db " 7|8|9$"
grid db " -+-+-$"
enterLoc db " Rule: You Can MOVe within Locations 1 to 9 .$"
turnMessageX db " Player 1's (X) turn, Which Position You Want to Choose?$"
turnMessageO db " Player 2's (O) turn, Which Position You Want to Choose?$"

; --------------------- CODE Segment START-------------------------
.CODE 
;
; Initialize
;
                   
; Set video mode
mov AL, 03h
mov AH, 0
int 10h

printString proc ;print a string procedure
MOV ah, 09  ;interrupt vector for printing a string
int 21h
ret 

newLine proc    ;print a newline
MOV DL,0DH      ;display cariage return
MOV AH,2        ;display the char stored in DL
INT 21H         ;print the string
MOV DL,0AH      ;display the cursor
MOV AH,2
INT 21H
ret
;//////////////////////////////////////////////////////////////////
MAIN PROC
start:
MOV ax, @data      ;to initialize ds
MOV ds, ax         

;copy what is in the variables  and put it in dx (for IN/OUT)
LEA dx, welcome
call printString
CALL newLine

LEA dx, enterLoc
call printString
CALL newLine
call newLine

LEA dx, ttt1
call printString
CALL newLine

LEA dx, grid
call printString
CALL newLine

LEA dx, ttt2
call printString
CALL newLine

LEA dx, grid
call printString
CALL newLine

LEA dx, ttt3
call printString
CALL newLine
CALL newLine

LEA dx, turnMessageX
call printString
CALL newLine

EXIT:

MAIN ENDP   ;end of main procedure
END MAIN
