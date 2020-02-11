DATA SEGMENT
        num1 DB ?
        num2 DB ?
        msg1 DB 0ah,0bh,"Enter first Number : $"
        msg2 DB 0ah,0bh,"Enter second Number : $"
        msg3 DB 0ah,0bh,"result is $"
DATA ENDS

CODE SEGMENT
        ASSUME DS:DATA,CS:CODE

START : MOV AX,DATA
        MOV DS,AX
        LEA DX,msg1
        MOV AH,09H
        INT 21H
        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV num1,AL

        LEA DX,msg2
        MOV AH,09H
        INT 21H
        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV num2,AL


        LEA DX,msg3
        MOV AH,09H
        INT 21H

        ADD AL,num1

        MOV AH,00H
        AAA
        MOV BX,AX
        ADD BX,3030H
        MOV DL,BH
        MOV AH,02H
        INT 21H
        MOV DL,BL
        MOV AH,02H
        INT 21H
        MOV AH,4CH
        INT 21H

        
CODE ENDS
END START
