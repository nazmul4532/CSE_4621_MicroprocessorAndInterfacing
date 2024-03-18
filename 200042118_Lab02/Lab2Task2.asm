
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
;so here Ihave switched the letter from 
;small to capital or capital to small  

; display character 
MOV DL, BL
MOV CX, 5   

LABEL_LOOP_1:         
    CALL ADD_AND_CHECK_DL
        INT 21h 
        SUB CX,1
    CMP CX,0
    JG LABEL_LOOP_1
  
    
; go to a new line with carriage return
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h

; display character 
MOV DL, BL
MOV CX, 5 
LABEL_LOOP_2:
    CALL SUB_AND_CHECK_DL
        INT 21h 
        SUB CX,1
    CMP CX,0
    JG LABEL_LOOP_2

; return to DOS
    MOV AH, 4CH
    INT 21H
MAIN ENDP  

ADD_AND_CHECK_DL PROC 
           ADD DL,1 
           CMP DL, 91
           JE  LABEL_Z
           CMP DL, 123  
           JE LABEL_SMALL_Z 
           JMP CUSTOM_LABEL_END
           LABEL_Z:
            MOV DL, 65
            JMP CUSTOM_LABEL_END 
           LABEL_SMALL_Z:
            MOV DL, 97
            JMP CUSTOM_LABEL_END  
            
        CUSTOM_LABEL_END:
            RET
ADD_AND_CHECK_DL ENDP  

SUB_AND_CHECK_DL PROC
           SUB DL,1 
           CMP DL, 64
           JE  LABEL_A
           CMP DL, 96  
           JE LABEL_SMALL_A 
           JMP CUSTOM_LABEL2_END
           LABEL_A:
            MOV DL, 90
            JMP CUSTOM_LABEL2_END 
           LABEL_SMALL_A:
            MOV DL, 122
            JMP CUSTOM_LABEL2_END  
            
        CUSTOM_LABEL2_END:
            RET      
SUB_AND_CHECK_DL ENDP


END MAIN

RET




