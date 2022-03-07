.model small
print macro msg
mov ah,09h
int 21h
endm
.data
num dw 1221h
msg1 db "number is a palindrome $"
msg2 db "number is not a palindrome $"
.code
mov ax,@data
mov ds, ax
mov ax,num
mov cl,04h
and al,0fh
ror ah,cl
and ah,0fh
cmp ah,al
jz l1
jnz l2
l1:mov ax,num
   and ah,0fh
   ror al,cl
   and al,0fh
   cmp ah,al
   je l3
   jne l2
l2:print msg2
   jmp exit
l3:print msg1
   jmp exit
exit:mov ah,4ch
     int 21h
     end
