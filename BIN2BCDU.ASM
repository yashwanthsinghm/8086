.model small
.data
num dw 1111111111111111b
res db 5 dup(0)
.code
mov ax,@data
mov ds,ax
mov ax,num
lea si,res
mov bx,2710h
div bx
mov res[0],al
mov ax,dx
mov dx,0000h
mov bx,03e8h
div bx
mov res[1],al
mov ax,dx
mov dx,0000h
mov bx,64h
div bx
mov res[2],al
mov ax,dx
mov dx,0000h
mov bx,0ah
div bx
mov res[3],al
mov res[4],dl
mov ah,4ch
int 21h
end


