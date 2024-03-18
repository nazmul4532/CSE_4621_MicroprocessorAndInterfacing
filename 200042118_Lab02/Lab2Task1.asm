
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

ORG 100h
.CODE
MAIN PROC
; display prompt
    MOV AH, 2
    MOV DL, '?'
    INT 21h
; input a character
    MOV AH, 1
    INT 21h
    MOV BL, AL
; go to a new line with carriage return
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h
;change the casing of the character 
    MOV AL, 97
    CMP AL, BL
    JLE LABEL_BIG 
     
LABEL_SMALL: 
    ADD BL, 32
    JMP LABEL_END

LABEL_BIG: 
    SUB BL, 32

LABEL_END:
; display character
    MOV DL, BL
    INT 21h
; r eturn to DOS
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

RET




