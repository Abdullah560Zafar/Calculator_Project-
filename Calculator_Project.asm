.MODEL SMALL
.STACK 100H

.DATA
MAIN_MENU DB 0dh,0ah,"20091005 & 200901103 CALCULATOR",0dh,0ah   
          DB "Press 'A' For ADDITION",0dh,0ah    
          DB "Press 'S' For SUBTRACTION",0dh,0ah 
          DB "Press 'M' For MULTIPLICATION",0dh,0ah 
          DB "Press 'D' For DIVISION",0dh,0ah 
          DB "Press 'E' For EXIT",0dh,0ah
          DB "Press 'R' For RETURN TO MAIN MENU",0dh,0ah   
          DB "*********************************",0dh,0ah   
          DB "*********************************",0dh,0ah  
          DB "Enter Your Choice Here: ",0dh,0ah,'$'   
          
          Num1 DB "Enter First Value: ",0dh,0ah,'$' 
          Num2 DB 0dh,0ah,"Enter First Value: ",0dh,0ah,'$' 
          
          ADD1 DB 0dh,0ah,"For Addition",0dh,0ah,'$'  
          SUB1 DB 0dh,0ah,"For Subtraction",0dh,0ah,'$' 
          MUL1 DB 0dh,0ah,"For Multiplication",0dh,0ah,'$' 
          DIV1 DB 0dh,0ah,"For Division",0dh,0ah,'$' 
          ;; ADD FOR REST OPERATIONS***************************                                                   
          EXIT DB 0dh,0ah,"Programm Terminated!",0dh,0ah,'$'   ;;EX=EXIT
          ANS  DB 0dh,0ah,"Result: ",0dh,0ah,'$'  
          CONT DB 0dh,0ah,"Do you want to continue calculation?: ",0dh,0ah,'$'  ;;CONTINUE=CONT 
          
          OP1 DB ?
          OP2 DB ?
          Operand DB ?   
          Con DB ?

          
.STARTUP  

; START MENU
START:
mov ah,09h
mov dx,offset MAIN_MENU
int 21h
mov ah,01h
int 21h
mov Operand,al
mov al,Operand

CMP al,'A'
JE ADD

CMP al,'S'
JE SUB

CMP al,'D'
JE DIV

CMP al,'M'
JE MUL 

CMP al,'R'
JE START

CMP al,'E'
JE EXIT

JE EXIT 

;;; Add rest operations**************************


;ADDITION OPERATION
ADD: 
mov ah,09h
mov dx,OFFSET ADD1
int 21h

;For Operand1
mov ah,09h
mov dx,OFFSET Num1 
int 21h

mov ah,01h
int 21h  
mov OP1,al 

;For Operand2 
mov ah,09h
mov dx,OFFSET Num2
int 21h

mov ah,01h
int 21h  
mov OP2,al  

mov ah,09h
mov dx,OFFSET ANS
int 21h

mov al,OP1 
mov bl,OP2
add al,bl
AAS
OR ax,3030h

;For printing result
mov ah,0Eh
int 10h

;For Continue
mov ah,09h 
mov dx,OFFSET CONT           
int 21h 
mov ah,01h
int 21h
mov Con,al
mov al,Con
cmp al,'Y'
JE START 

cmp al,'N'
je EXIT



;SUBTRACTION OPERATION
SUB:
mov ah,09h
mov dx,OFFSET SUB1
int 21h     

;For Operand1
mov ah,09h
mov dx,OFFSET Num1 
int 21h

mov ah,01h
int 21h    
mov OP1,al 

;For Operand2 
mov ah,09h
mov dx,OFFSET Num2 
int 21h

mov ah,01h
int 21h  
mov OP2,al  

mov ah,09h
mov dx,OFFSET ANS
int 21h

mov al,OP1 
mov bl,OP2
sub al,bl
AAS
OR ax,3030h

;For printing result
mov ah,0Eh
int 10h

;For Continue
mov ah,09h 
mov dx,OFFSET CONT           
int 21h 
mov ah,01h
int 21h
mov Con,al
mov al,Con
cmp al,'Y'
JE START 

cmp al,'N'
je EXIT



;MULTIPLICATION OPERATION
mov ah,09h 
mov dxOFFSET MUL1           
int 21h  
;MOV AH,09H
;MOV DXOFFSET MUL1
;INT21H

;For Operand1
MOV AH,09H
MOV DXOFF Num1
INT 21H
MOV AH,01H
INT 21H
SUB AL,30H
MOV OP1,AL

;For Operand2
MOV AH, 09H
MOV DXOFFSET Num2
INT 21H
MOV AH,01H
INT 21H
SUB AL,30H
MOV OP2,AL
MOV AH,09H
MOV DX, OFFSET ANS
INT 21H
MOV AL,OP1
MOV BL,OP2
MUL BL
ADD AL,30H

;Print Result

MOV AH,0EH
INT 10H

;For Continue
MOV AH,09H
MOV DX,OFFSET CONT
INT 21H
MOV CON,AL
MOV AL,CON
CMP AL,"Y"
JE START
CMP AL,"N"
JE EXIT


;DIVISION OPERATION
MOV AH,09H
MOV DX,OFFSET DIV1
INT 21H

;For Operand1
MOV AH,09H      
MOV DXOFFSET Num1
INT 21H
MOV AH,01H
INT 21H
SUB AL,30H
MOV OP1,AL

;For Operand2
MOV AH,09H
MOV DXOFFSET Num2
INT 21H
MOV AH,01H
INT 21H
SUB AL,30H
MOV OP2,AL
MOV AH,09H
MOV DX,OFFSET ANS
INT 21H
MOV AX,0000H
MOV AL,OP1
MOV BL,OP2
DIV AL,30H

;Print Result
MOV AH,0EH
INT 10H

;For Continue
MOV AH,09H
MOV DX,OFFSET CONT
INT 21H
MOV AH,01H
INT 21H
MOV CON,AL
MOV AL,CON
CMP AL, "Y"
JE START
CMP AL, "N"
JE EXIT
EXIT 

;For Exit
MOV AH,09H
MOV DIX,OFFSET EXIt
INT 21H
.EXIT
END



