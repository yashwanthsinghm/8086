.model small
.data
n1 db 00
.code
mov ax,@data
mov ds,ax
mov cl,99
mov al,n1
up:mov dl,al
   mov ah,02h
   int 21h
   inc al
   loop up
mov ah,4ch
int 21h
end
