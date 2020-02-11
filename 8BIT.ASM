DATA SEGMENT
        
        MSG1 DB "Enter first number : $"
        MSG2 DB "Enter second number : $"
        MSG3 DB "Result is : $"

DATA ENDS


CODE SEGMENT

ASSUME DS:DATA, CS:CODE

START: MOV AX,DATA
       MOV DS,AX

       ;Print first message
       LEA DX,MSG1
       MOV AH,09H
       INT 21H

       ;Read first digit of number 1
       MOV AH,01H
       INT 21H
       SUB AL,30H
       MOV BH,AL

       ;Read second digit of number 1
       MOV AH,01H
       INT 21H
       SUB AL,30H
       MOV BL,AL

       ;Print second Message
       LEA DX,MSG2
       MOV AH,09H
       INT 21H

       ;Read first digit of number 2
       MOV AH,01H
       INT 21H
       SUB AL,30H
       MOV CH,AL

       ;Read second digit of number 2
       MOV AH,01H
       INT 21H
       SUB AL,30H
       MOV CL,AL

       ;Performing AL=BL+CL
       ADD BL,CL
       MOV AL,BL

       ;Splitting AL into AH & AL
       MOV AH,00H
       AAA

       ;Saving result of first addition to BL(temperory)
       MOV BL,AL

       ;Performing AL=BH+CH+AH
       MOV AL,AH
       ADD AL,BH
       ADD AL,CH

       ;Splitting result into AH & AL
       MOV AH,00H
       AAA

       ;CH=AH,CL=AL
       MOV CH,AH
       MOV CL,AL

       ;Print last message
       LEA DX,MSG3
       MOV AH,09H
       INT 21H
       
       ;Converting result to ascii
       ADD CH,30H
       ADD CL,30H
       ADD BL,30H


       ;Printing Result

       ;If first digit is zero skip it
       CMP CH,30H
       JE LB

       MOV DL,CH
       MOV AH,02H
       INT 21H
	
 LB:
       MOV DL,CL
       MOV AH,02H
       INT 21H

       MOV DL,BL
       MOV AH,02H
       INT 21H

       ;Closing
       MOV AH,4CH
       INT 21H


CODE ENDS
END START
