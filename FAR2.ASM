.model small
.stack
.data
msg1 db "enter the character $"
msg2 db "  converted value  $"
.code
mov ax,@data
mov ds,ax
extrn conv:far
lea dx,msg1
mov ah,09h
int 21h
mov ah,01h
int 21h
mov [si],al
call conv
mov al,[di]
lea dx,msg2
mov ah,09h
int 21h
mov dl,al
mov ah,02h
int 21h
mov ah,4ch
int 21h
end
