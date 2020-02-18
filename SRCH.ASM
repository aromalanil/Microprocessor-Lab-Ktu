data segment
        msg1 db 0ah,0dh,"Enter the string : $"
        msg2 db 0ah,0dh,"Enter the key : $"
        msg3 db 0ah,0dh,"Key found$"
        msg4 db 0ah,0dh,"Key not found$"
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
               

               ;Reading key
               mov ah,01h
               int 21h
               mov bl,al

               mov ch,00h
         check:dec  si

               cmp bl,[si]
               jz found
               dec cl
               jnz check

               jmp notfound

         found:
               ;Printing message1
               lea dx,msg3
               mov ah,09h
               int 21h
               jmp finish

      notfound:
               ;Printing message1
               lea dx,msg4
               mov ah,09h
               int 21h

        
       finish:
               mov ah,4ch
               int 21h

code ends
end start
