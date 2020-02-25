data segment
        msg1 db 0ah,0dh, "Enter first number : $"
        msg2 db 0ah,0dh, "Enter second number : $"
        msg3 db 0ah,0dh, "Result is : $"
        n1 db 07h dup(?)
        n2 db 07h dup(?)
data ends

code segment
        assume cs:code,ds:data
        start: mov ax,data
               mov ds,ax
      
               ;Getting offset of arrays         
               mov si,offset n1
               mov di,offset n2

               ;Printing "Enter first number"
               lea dx,msg1
               mov ah,09h
               int 21h

               ;Setting Count to 4
               mov cl,04h

               ;Getting First Number
         first:mov ah,01h
               int 21h
               sub al,30h
               mov [si],al
               inc si
               dec cl
               jnz first

               ;Printing "Enter second number"
               lea dx,msg2
               mov ah,09h
               int 21h

               ;Setting count to 4
               mov cl,04h

               ;Getting second Number
        second:mov ah,01h
               int 21h
               sub al,30h
               mov [di],al
               inc di
               dec cl
               jnz second

               ;Clearing carry
               clc

               ;Setting count to 4
               mov cl,04h

               ;Performing Addition
      addition:dec di
               dec si
               mov al,[si]
               mov bl,[di]

               adc al,bl
               mov ah,00h
               aaa

               ;Storing result to di array
               mov [di],al

               dec cl
               jnz addition

               ;Printing "Result is"
               lea dx,msg3
               mov ah,09h
               int 21h

               ;Printing Result
               mov bh,00h
               mov dl,30h
               adc dl,bh
               cmp dl,30h
               je skip

               ;Printing Carry
               mov ah,02h
               int 21h

          skip:
               ;Setting Count to 4
               mov cl,04h

               ;Printing array content
         print:mov dl,[di]
               add dl,30h

               mov ah,02h
               int 21h

               inc di
               dec cl
               jnz print

               mov ah,4ch
               int 21h
code ends
end start
