data segment
        msg1 db 0ah,0dh,"Enter the string : $"
        msg2 db 0ah,0dh,"Reverse is : $"
        n db 09h dup(?)
data ends

code segment
        assume cs:code,ds:data
        start: mov ax,data
               mov ds,ax

               ;Getting offset of array
               mov si,offset n

               ;Printing message1
               lea dx,msg1
               mov ah,09h
               int 21h

               mov cl,00h
               ;Reading string
          scan:mov ah,01h
               int 21h

               cmp al,0dh
               jz ended
               mov [si],al
               inc cl
               inc si
               jmp scan

         ended:
               ;printing msg2
               lea dx,msg2
               mov ah,09h
               int 21h
                   
         print:dec  si

               mov dl,[si]
               mov ah,02h
               int 21h
               dec cl
               jnz print

               mov ah,4ch
               int 21h

code ends
end start
