
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h 
.CODE
MAIN PROC
    MOV BX,200
    SUB BX,225
    MOV AX,0Bh 
    MUL BX
    ADD AX,127       
   MAIN ENDP
END MAIN
ret




