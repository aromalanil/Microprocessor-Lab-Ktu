; An assembly program which prints the pattern
; 1
; 1 2
; 1 2 3
; 1 2 3 4

data segment

      nxtline db 0ah,0dh,"$"
      space db " $"
      n db 00h
      m db 00h

data ends
code segment
      assume cs:code,ds:data
      start: mov ax,data
             mov ds,ax

      loop1: 
             inc n
             mov m,00h

      loop2: 
             inc m

            ;Printing m
             mov dl,m
             add dl,30h
             mov ah,02h
             int 21h

             ;Print space
             lea dx,space
             mov ah,09h
             int 21h

            ;If m!=n go to loop2
             mov bl,m
             cmp n,bl
             jne loop2
             
            ;If n=4 go to loopend 
             cmp n,04h
             je loopend

            ;Print nextline
             lea dx,nxtline
             mov ah,09h
             int 21h

            ;Goto loop1
             jmp loop1 

    loopend: mov ah,4ch
             int 21h   

code ends
end start             