print macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.stack
.data
n1 dw 1148h
msg1 db "palindrome $"
msg2 db "not a palindrome $"
.code
mov ax,@data
mov ds,ax
mov ax,n1
mov dh,80h
mov dl,01h
mov bl,00h
mov cl,7
l1:mov ax,n1
   and ah,dh
   and al,dl
   shr ah,cl
   push cx
   mov cl,bl
   shr al,cl
   inc bl
   pop cx
   ror dh,01h
   rol dl,01h
   cmp ah,al
   jne l2
   loop l1
print msg1
jmp exit
l2:print msg2
jmp exit
exit:mov ah,4ch
    int 21h
    end




