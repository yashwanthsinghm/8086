
print macro msg
mov ah, 09h
mov dx, offset msg
int 21h
 endm
 .model small
 .data
 n1 db 22h,33h,44h,55h,88h,99h,66h,77h
 msg1 db "largest number of array $"
 len db 8h
 res dw ?
.code
 mov ax,@data
 mov ds, ax
 lea si,n1
 mov ax,[si]
 mov cl, len
 l1: inc si
    mov bx,[si]
    cmp ax,bx
    dec cl
    ja l2
    jb l3
 l2:cmp cl,00h
    je exit
    jmp l1
l3:cmp cl,00h
   je exit
   mov ax,bx
   jmp l1
 exit :
       mov res,ax
       mov ah,4ch
       int 21h
       end


 
