;Assembly program to find whether an 8-bit number is prime or not

data segment
        A db 1,2,3,5,7
        msg1 db 0ah,0dh,"Enter the number : $"
        isprime db 0ah,0dh,"The number is Prime$"
        notprime db 0ah,0dh,"The number is not Prime$"
data ends

code segment
        assume cs:code,ds:data
        start: mov ax,data
               mov ds,ax

               ;Print "Enter the number : "
               lea dx,msg1
               mov ah,09h
               int 21h

               ;Getting the number at bx
               mov ah,01h
               int 21h
               mov bh,al
               mov ah,01h
               int 21h
               mov bl,al
               sub bx,3030h

               mov dl,05h
               mov si,offset A
               mov ch,[si]
               mov cl,00h

         loop1:mov ax,bx
               aad
               div ch
               cmp ah,00h
               jne loop2
               inc cl

         loop2:inc si
               mov ch,[si]
               dec dl
               jne loop1
               cmp cl,01h
               je jmpprime

               ;Printing "The number is not Prime"
               lea dx,notprime
               mov ah,09h
               int 21h

               jmp finish

               ;Printing "The number is Prime"
      jmpprime:lea dx,isprime
               mov ah,09h
               int 21h

        finish:mov ah,4ch
               int 21h
code ends
end start

