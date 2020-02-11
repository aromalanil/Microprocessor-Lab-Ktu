data segment

        msg1 db 0ah,0dh, "Enter first number : $"
        msg2 db 0ah,0dh, "Enter second number : $"
        msg3 db 0ah,0dh, "Result is : $"

data ends

code segment
        assume cs:code,ds:data

        start:mov ax,data
              mov ds,ax

              ;Printing "Enter first Number"
              lea dx,msg1
              mov ah,09h
              int 21h

              mov ah,01h
              int 21h
              sub al,30h
              mov bl,al

              mov ah,01h
              int 21h
              sub al,30h
              mov bh,al

              ;Packing the entered number and storing in bl
              mov ax,bx
              aad
              mov bl,al

              ;Printing "Enter second Number"
              lea dx,msg2
              mov al,09h
              int 21h

              mov ah,01h
              int 21h
              sub ah,30h
              mov ch,al

              mov ah,01h
              int 21h
              sub al,30h
              mov cl,al

              ;Packing the entered number
              mov ax,cx
              aad

              ;Multiplying
              mul bl

              ;Getting number at 1000s place
              mov cx,03e8h
              mov dx,0000h

              div cx

              ;Making reminder the new divident
              mov bx,dx

              ;Printing
              mov dl,al
              add dl,30h
              mov ah,02h
              int 21h

              ;Getting number at 100s place
              mov cl,64h
              mov ax,bx

              div cl

              ;Making reminder the new divident
              mov bl,ah

              ;Printing
              mov dl,al
              add dl,30h
              mov ah,02h
              int 21h

              ;Getting number at 10s place
              mov cl,0Ah
              mov bh,00h
              mov ax,bx

              div cl

              ;Saving Reminder
              mov bl,ah

              ;Printing
              mov dl,al
              add dl,30h
              mov ah,02h
              int 21h

              ;Printing  Reminder
              mov dl,bl
              add dl,30h
              mov ah,02h
              int 21h

              mov ah,4ch
              int 21h


code ends
end start


