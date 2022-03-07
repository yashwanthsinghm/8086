.model small
.data
str1 db"hello $"
len db $-str1
str2 db 06 dup(0)
.code
mov ax,@data
mov ds,ax
lea si,str1
lea di, str2
add di,04h
mov cl,len
l1:mov ax,[si]
   mov [di],ax
   dec di
   inc si
   loop l1
   mov ah,4ch
   int 21h
   end
