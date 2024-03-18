
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.DATA
Celsius_Val DW 260 
Fahrenheite_Val DW ?


.CODE
MAIN PROC 
    MOV AX,Celsius_Val
    MOV BX,10
    MUL BX
    MOV BX,5
    DIV BX
    ADD AX,32
    SUB AX,1    
    MOV Fahrenheite_Val,AX
END MAIN

ret




