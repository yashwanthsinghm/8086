.model small
.stack
.data
n1 dw 65530d
c dw 00d
.code
mov ax,@data
mov ds,ax
mov ax,n1
mov bx,0002h
up:inc c
   div bx
   push dx
   mov dx,0000h
   cmp ax,0000h
   jne up
mov cx,c
up1:pop dx
   add dl,30h
   mov ah,02h
   int 21h
   loop up1
mov ah,4ch
int 21h
end
