.model small
.data
m1 db"enter the number:$",10,13
m2 db"7 segment code is$"
table db 3fh
      db 06h
      db 5bh
      db 4fh
      db 66h
      db 6dh
      db 70h
      db 07h
      db 7fh
      db 6fh
 .code
 mov ax,@data
 mov ds,ax
 lea dx,m1
 mov ah,09h
 int 21h
 mov ah,01h
 int 21h
 mov bx,offset table
 xlat
 lea dx,m2
 mov ah,09h
 int 21h
 mov dl,al
 mov ah,02h
 int 21h
 mov ah,4ch
 int 21h
 end

