print macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
str db "malayala"
len db $-str
l   db "a"
msg1 db "occurance of letter 'a' is  $"
n db 00h
.code
mov ax,@data
mov ds,ax
mov es,ax
lea si,str
lea di,l
mov bl,00h
mov bh,00h
mov dl,len
mov dh,00h
cld
l1:mov cl,01h
   repe cmpsb
   jz l2
l3:inc bl
   lea si,str
   lea di,l
   add si,bx
   dec dl
   cmp dl,00h
   jne l1
   jmp stop
l2: inc dh
    mov n,dh
    jmp l3
stop:print msg1
     mov dh,n
     mov dl,dh
     add dl,30h
     mov ah,02h
     int 21h
     mov ah,4ch
     int 21h
     end
