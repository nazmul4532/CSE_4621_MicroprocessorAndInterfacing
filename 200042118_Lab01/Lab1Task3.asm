
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.CODE
MAIN PROC
    MOV AX,0FFFh
    MOV BX,10h
    MUL BX
    ADD AX,1111b
    MAIN ENDP
END MAIN

ret




