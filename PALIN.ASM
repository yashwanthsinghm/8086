print macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
str db "malayalam"
n dw ($-str)
msg1 db "string is palindrome $"
msg2 db "string is not apalindrome $"
.code
mov ax,@data
mov ds,ax
lea si,str
lea di,str
mov ax,n
mov ah,00h
mov dx,00h
mov bx,02h
div bx
mov cx,ax
mov bx,n
sub bl,01h
mov bh,00h
up:mov al,[si]
   mov ah,[di+bx]
   cmp al,ah
   jne no
   inc si
   dec di
   loop up
   print msg1
   jmp exit
 no:print msg2
    jmp exit

exit: mov ah,4ch
int 21h
end

