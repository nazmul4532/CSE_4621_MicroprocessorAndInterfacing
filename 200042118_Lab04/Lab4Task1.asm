ORG 100h
.DATA
A DB 1, 2, 3, 4, 5, 6, 7, 8 ,9 
B DB 00h
message DB 'Input (The value of N in between 2 ~ 9): $'
msg DB 'The result is: $'  
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    XOR AX, AX
    MOV SI, OFFSET A
    MOV DI, OFFSET B
    MOV DX, OFFSET message
    MOV AH, 09h
    INT 21h
    MOV AH, 01h
    INT 21h
    MOV CL, AL
    SUB CL, 48
    XOR BX, BX
Loop_1:
    MOV AX, [SI]
    IMUL AX  
    MOV AH, 0
    ADD BX, AX
    INC SI
LOOP Loop_1 

MOV AH, 02h   
MOV DL, 0Dh     
INT 21h       
MOV DL, 0Ah     
INT 21h  

    MOV DI, OFFSET B
    MOV DX, OFFSET msg
    MOV AH, 09h
    INT 21h


    MOV AH, 0 
    MOV AX, BX
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
    MOV AH, 02h
    L2:
    POP DX
    ADD DX, '0'
    INT 21h
    LOOP L2
    
MAIN ENDP
END MAIN
RET
     