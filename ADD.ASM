.model small
.data
n1 db 01h
n2 db 02h
.code
mov ax,@data
mov ds,ax
mov al,n1
add al,n2
mov ah,4ch
int 21h
end

