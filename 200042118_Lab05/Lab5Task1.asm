ORG 0100H
.MODEL SMALL
.DATA
    ARR DB 5 DUP(?)     
    PRINT_MSG DB 'ENTER 5 NUMBERS: ', 0Dh, 0Ah, '$'
    AVG_MSG DB 0Dh, 0Ah,'AVERAGE:  ', 0Dh, 0Ah, '$'
    LARGEST_MSG DB 0Dh, 0Ah,'LARGEST: ', 0Dh, 0Ah, '$'
    SMALLEST_MSG DB 0Dh, 0Ah,'SMALLEST: ', 0Dh, 0Ah, '$'
.CODE
MAIN PROC     

    MOV AX, @DATA 
    MOV DS, AX               
    MOV SI, 0
    XOR DX,DX       
 

PRINT_LOOP_START:
    MOV DL, [PRINT_MSG + SI]     
    CMP DL, '$'                 
    JE PRINT_LOOP_END 
    MOV AH, 02h
    INT 21h
    INC SI
    JMP PRINT_LOOP_START      
PRINT_LOOP_END:  

MOV CX, 5
MOV SI, OFFSET ARR   

LOOPIN: 
MOV AH, 01H    
INT 21H  
SUB AL, '0'
MOV [SI], AL 
INC SI
LOOP LOOPIN    

CALL AVERAGE   
CALL LARGEST  
CALL SMALLEST  

MOV AH, 4CH    
INT 21H

MAIN ENDP

AVERAGE PROC

MOV SI, OFFSET ARR
MOV BX, 0      
MOV CX, 5     
AVERAGE_LOOP:
  MOV AL, [SI] 
  ADD BX, AX   
  INC SI      
LOOP AVERAGE_LOOP

MOV AX, BX     
MOV BX, 5 
XOR DX, DX      
DIV BX       

MOV BX, AX  
MOV CX, DX



    MOV SI, 0
    XOR DX,DX 
AVG_LOOP_START:
    MOV DL, [AVG_MSG + SI]     
    CMP DL, '$'                 
    JE AVG_LOOP_END 
    MOV AH, 02h
    INT 21h
    INC SI
    JMP AVG_LOOP_START      
AVG_LOOP_END:       

XOR DX, DX
MOV DX, BX
ADD DX, '0'        
MOV AH, 02H    
INT 21h  

 
XOR DX, DX
MOV DX, 46        
MOV AH, 02H    
INT 21h  

XOR DX, DX  
MOV AX, CX 
MOV CX, 10
MUL CX
MOV BX, 5
DIV BX
MOV DX, AX
ADD DX, '0'                                    
MOV AH, 02H     
INT 21h  


RET         
AVERAGE ENDP

LARGEST PROC

MOV SI, OFFSET ARR
MOV AL, [SI]  
MOV CX, 5    
LARGEST_LOOP:
  CMP AL, [SI] 
  JG LARGEST_UPDATE 
  MOV AL, [SI] 
LARGEST_UPDATE:
  INC SI      
LOOP LARGEST_LOOP    

MOV BL , AL


    MOV SI, 0
    XOR DX,DX       
 

LARGEST_LOOP_START:
    MOV DL, [LARGEST_MSG + SI]     
    CMP DL, '$'                 
    JE LARGEST_LOOP_END 
    MOV AH, 02h
    INT 21h
    INC SI
    JMP LARGEST_LOOP_START      
LARGEST_LOOP_END:

MOV AH, 02H   
MOV DL, BL     
ADD DL, '0'
INT 21H        
RET           
LARGEST ENDP

SMALLEST PROC
MOV SI, OFFSET ARR
MOV AL, [SI]  
MOV CX, 5     
SMALLEST_LOOP:
  CMP AL, [SI]
  JL SMALLEST_UPDATE 
  MOV AL, [SI]
SMALLEST_UPDATE:
  INC SI     
LOOP SMALLEST_LOOP
MOV BL, AL                                
                                

    MOV SI, 0
    XOR DX,DX       
 

SMALLEST_LOOP_START:
    MOV DL, [SMALLEST_MSG + SI]     
    CMP DL, '$'                 
    JE SMALLEST_LOOP_END 
    MOV AH, 02h
    INT 21h
    INC SI
    JMP SMALLEST_LOOP_START      
SMALLEST_LOOP_END:

MOV AH, 02H    
MOV DL, BL    
ADD DL, '0'
INT 21H      
RET     
SMALLEST ENDP


END MAIN 