.model small
.stack
.data
n1 dW 2000H
n2 DW 3000H
len db 5H
a db 00
.code
mov ax,@data
mov ds,ax
mov si,n1
mov di,n2
mov cl,len
back:mov dl,[si]
     mov [di],dl
     inc si
     inc di
     loop back
 mov ah,4ch
 int 21h
 end




