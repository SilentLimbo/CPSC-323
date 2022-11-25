# Project 1: Use Flex to generate a lexer
### By Mina Ghaly in CPSC323-03

This program will take input from the file named "input_sourcecode.txt" and output a parsed version to "output.txt".
The tokens are defined in the ff.l lexer file. 

## Instructions 

I personally had this set up to run on a windows machine, so the instructions are in accordance.

Assuming there is no .exe file constructed, we will be making one in the ff.l file.
- Open a terminal in the directory that contains all the needed files:
    - ff.l
    - input_sourcecode.txt
- Once in the correct directory, type in the following commands into the terminal
    - flex ff.l
    - gcc lex.yy.c -o output
    - "./output" OR you could just run the .exe file in the file explorer.
- The First command complies using flex, the second command complies into a .c using gcc and creates an .exe with the name "program", and the last command, runs the .exe from the terminal.
- Once the program has run, a "output.txt" file should have been created with a list of tokens and lexemes from the input .txt file. 