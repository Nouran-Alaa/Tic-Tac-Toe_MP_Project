# Tic-Tac-Toe Game

<h1 align="center">
  <img src="https://github.com/Nouran-Alaa/Tic-Tac-Toe_MP_Project/blob/master/Media/Logo.png" width="120px" />
</h1>


<h1 align="center">
  Tic-Tac-Toe Game Implementation in `Assembly 8086`.
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
1- `X` or `O` through a whole row <br />
![Rows](https://github.com/Nouran-Alaa/Tic-Tac-Toe_MP_Project/blob/master/Media/Rows.gif) <br />

2- `X` or `O` through a whole column <br />
![Columns](https://github.com/Nouran-Alaa/Tic-Tac-Toe_MP_Project/blob/master/Media/Columns.gif) <br />

3- `X` or `O` through a diagonal <br />
![Diagonals](https://github.com/Nouran-Alaa/Tic-Tac-Toe_MP_Project/blob/master/Media/Diagonals.gif) 

* * *

## Logic

This part is goint to include some of the logic and code snippets from our project

1- Settings the video mode is done by this code snippet, we change the interrupt mode to 0 (which is used for playing the video)
```
mov AL, 03h
mov AH, 0
int 10h
```

* * *

## Future Development

* Make it responsive
* Add A.I. (player vs. computer)

* * *

## Project Testing:

	This is a video for testing the Project:

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
