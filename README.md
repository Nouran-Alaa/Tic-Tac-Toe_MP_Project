# Tic-Tac-Toe Game

<h1 align="center">
  <img src="https://github.com/Nouran-Alaa/Tic-Tac-Toe_MP_Project/blob/master/Media/Logo.png" width="120px" />
</h1>


<h1 align="center">
  Tic-Tac-Toe Game Implementation in Assembly 8086.
</h1>

## This project aims to:
* Create a Tic-Tac-Toe game that has the functionality of traditional multiplayer Tic-Tac-Toe games.
* Learn Assembly level programming, Assembler and Basics of `8086` Microprocessor.

* * *

## The Game

Tic-Tac-Toe is a multiplayer game with two symbols denoting the two players: `X` and `O`. Where you can face off friends (and/or yourself) in a tic-tac-toe battle! 💪 <br />
The playing board is a `3x3` square. <br /> <br />
![game1](https://github.com/Nouran-Alaa/Tic-Tac-Toe_MP_Project/blob/master/Media/game1.png) <br />
![game2](https://github.com/Nouran-Alaa/Tic-Tac-Toe_MP_Project/blob/master/Media/game2.png)

* * *

## The Emulation Program 
    We Use ( EMU8086 ) to emulate our Code and Open our Program. 
 ![Screenshot (460)](https://user-images.githubusercontent.com/66433551/148337632-0a360c81-d301-4b26-a714-fee8858b2047.png)   
 
* * *


## How to play it

1) Open the emulator `emu8086` paste the code and click 'emulate'.
2) Click `run`, and the terminal will appear as the following figure: <br /> <br />
![Source](https://github.com/Nouran-Alaa/Tic-Tac-Toe_MP_Project/blob/master/Media/src.PNG)

3) Choose either `X` or `O`.
4) You should choose a number between `1 --> 9` (1,9 included), thus the game wouldn't have any errors.
5) Use tactics to win by filling three adjacent symbols in the grid.

* * *

## Rules

* Each player takes a turn placing his character `X or O` into one of the nine squares.
* A player cannot place his symbol in a square that is already occupied by a symbol.
* The game ends when a player creates a winning combination of his symbols or when there are no empty squares remaining.
* Winning combination is defined as three horizontally adjacent, three vertically adjacent, or three diagonally adjacent symbols.
* If neither player creates a winning combination when all nine squares are occupied, the game is a draw, often referred to as a `cat game`.

* * *

## Wining Conditions

### You can win by filling:
1- `X` or `O` through a whole row <br /><br />
![Rows](https://github.com/Nouran-Alaa/Tic-Tac-Toe_MP_Project/blob/master/Media/Rows.gif) <br />

2- `X` or `O` through a whole column <br /><br />
![Columns](https://github.com/Nouran-Alaa/Tic-Tac-Toe_MP_Project/blob/master/Media/Columns.gif) <br />

3- `X` or `O` through a diagonal <br /><br />
![Diagonals](https://github.com/Nouran-Alaa/Tic-Tac-Toe_MP_Project/blob/master/Media/Diagonals.gif) 

* * *

## Logic

This part is going to include some of the logic and code snippets from our project

1- Settings the video mode is done by this code snippet, we change the interrupt mode to `0` (which is used for playing the video)
```asm
mov AL, 03h
mov AH, 0
int 10h
```
2- Setting the cursor position, this is used to change the cursor position by chaning the interrupt mode to `2`
```asm
mov DH, 1
mov DL, 1
mov BH, 0
mov AH, 2
int 10h
```
3- Printing something on the screen, this is done by changing the interrupt mode to `09h`
```asm
mov AH, 09h
//what should be printed goes here
int 10h
```
4- Going to next line is done with a function called `carriage_return`, which will be used everytime we want to go to the next line
```asm
carriage_return PROC
    inc DH ; Incrementing the cursor position vertically
    mov DL, 1 ; Resetting horizontal cursor position
    mov AH, 2h ; Set interrupt to set cursor position
    int 10h
    
    ret
    
carriage_return ENDP
```
5- Printing a String/Text is done by printing every character until we reach the symbol `$`, which is the conventional way to determine the end of a String
```asm
mov AH, 0Ah ; Write character without attribute
mov AL, message[BX]
cmp AL, "$" ; Check for sentinel
je end_text_loop ; End if sentinel is found
int 10h
inc BX
```
6- Changing the color of a character when needing to print it can be achieved by changing the content of `BL`, light blue is `09h` for example
```asm
mov AL, "O"
mov BL, 0Ch ; C is an attribute of the light red color
```
* * *

## Future Development

* Make it responsive
* Add A.I. (player vs. computer)

* * *

## Project Testing:

This is a video for testing the Project: <br />
	
[![X-O](https://img.youtube.com/vi/j9TQ7V8YBro&ab_channel=AhmedAyman/0.jpg)](https://www.youtube.com/watch?v=j9TQ7V8YBro&ab_channel=AhmedAyman "X-O Game")
	

* ## Project References: 
	* #### Playlists:
		* Learning git and github: https://www.youtube.com/watch?v=ACOiGZoqC8w&list=PLDoPjvoNmBAw4eOj58MZPakHjaO3frVMF.
	* #### Books:  
		* prentice_the_intel_microprocessors_8th_edition_013.                      
		* Assembly language for Intel-based computers by Kip R. Irvine.   
* * *

## Team members
- [Nouran Alaa](https://github.com/Nouran-Alaa)
- [Ahmed Ayman](https://github.com/ahmedayman9)
- [Mohamed Mostafa](https://github.com/mahmedMostafa)
- [Mariam Mohammed El-Azab](https://github.com/maryamazab)
- [Anas Kahell](https://github.com/AnasKahell)
