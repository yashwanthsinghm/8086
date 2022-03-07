.model small
.data
num dw 1111111111111111b
.code
mov ax,@data
mov ds,ax
mov ax,num
mov bx,3e8h
mov ch,al
and ch,f0h
mov cl,04h
shr ch,cl
mov dl,ch
call print
and al,0fh
mov dl,al
call print

