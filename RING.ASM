.model small
.stack
.data
msg db 10,13,"$",10,13,24h
.code
mov ax,@data
mov ds,ax
mov ch,00h
mov al,'0'
mov cl,'0'
mov bl,'0'
mov bh,'0'
up:mov dl,al
   mov ah,02h
   int 21h
   mov dl,cl
   mov ah,02h
   int 21h
   mov dl,bl
   mov ah,02h
   int 21h
  mov dl,bh
   mov ah,02h
   int 21h
   lea dx,msg
   mov ah,09h
   int 21h
   call delay
  inc ch
  cmp ch,01h
  je l1
  cmp ch,02h
  je l2
  cmp ch,03h
  je l3
  jmp exit
  
l1:inc al
   jmp up
l2:mov al,'0'
   inc cl
   jmp up
l3:dec cl
   inc bl
   jmp up
delay proc
     push cx
     push bx
     mov cx,0ffh
     l4:mov bx,0ffh
     l5:dec bx
     jnz l5
     loop l4
     pop bx
     pop cx
     RET
     delay endp
exit:mov ah,4ch
     int 21h
     end
   inc 
   


