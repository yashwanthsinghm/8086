.model small
.stack
.data
n dw 0ffffh
c db 00d
.code
mov ax,@data
mov ds,ax
mov ax,n
mov bx,000ah
up:inc c
   div bx
   push dx
   mov dx,0000h
   cmp ax,0000h
  jne up
  mov cl,c
up1:pop dx
    add dl,30h
    mov ah,02h
    int 21h
    loop up1
mov ah,4ch
int 21h
end

