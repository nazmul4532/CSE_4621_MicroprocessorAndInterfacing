
org 100h

.DATA
input_string DB 'We are IUT Students', 0Dh, 0Ah, '$'

.CODE
MAIN PROC
    MOV AX, @DATA 
    MOV DS, AX               
    MOV SI, 0
    XOR DX,DX       

LOOP_START:
    MOV DL, [input_string + SI]     
    CMP DL, '$'                 
    JE LOOP_END 
    MOV AH, 02h
    INT 21h
    INC SI
    JMP LOOP_START      
LOOP_END: 

MOV AX, SI 
MOV DX, 0
MOV BX, 10
MOV CX, 0
L1:
DIV BX
PUSH DX 
MOV AH, 0
MOV DX,0
INC CX
CMP AX,0
JNE L1
MOV AH,02h
L2:
POP DX
ADD DX, '0'
INT 21h
LOOP L2


MAIN ENDP
END MAIN
