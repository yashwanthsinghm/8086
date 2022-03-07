print macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
mat1 db 01h,02h,03h,04h,05h,06d,07d,08d,09d
mat2 db 02d,03d,05d,05d,07h,05h,00h,05h,01h
msg1 db 10,13,"$",10,13,24h
msg2 db " $"
mat3 db 9 dup(0)
.code
mov ax,@data
mov ds,ax
mov si,00h
lea di,mat3
mov cl,09h
l1:mov al,mat1[si]
add al,mat2[si]
daa
mov [di],al
inc di
inc si
loop l1
mov cl,03h
lea di,mat3
l2:push cx
   mov al,[di]
   mov al,bl
   and al,0f0h
   mov cl,4
   shr al,cl
   add al,30h
   and bl,0fh
   add bl,30h
   mov dl,al
   mov ah,02h
   int 21h
   mov dl,bl
   mov ah,02h
   int 21h
   print msg2
   inc di
   mov al,[di]
   mov al,bl
   and al,0f0h
   mov cl,4
   shr al,cl
   add al,30h
   and bl,0fh
   add bl,30h
   mov dl,al
   mov ah,02h
   int 21h
   mov dl,bl
   mov ah,02h
   int 21h
   print msg2
   inc di
   mov al,[di]
   mov al,bl
   and al,0f0h
   mov cl,4
   shr al,cl
   add al,30h
   and bl,0fh
   add bl,30h
   mov dl,al
   mov ah,02h
   int 21h
   mov dl,bl
   mov ah,02h
   int 21h
   inc di
   print msg1
   pop cx
   loop l2
mov ah,4ch
int 21h
end


