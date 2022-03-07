print macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.stack
.data
msg1 db "it is a bit wise palindrome $"
msg2 db "it is not a bit wise palindrome $"
n1 dw 8421h
n2 dw 0000h
.code
mov ax,@data
mov ds,ax
mov cl,16d
mov ax,n1
mov bx,n2
up:ror ax,01h
   jc l1
   rol bx,01h
   jmp l2
   l1:rcl bx,01h
   l2:loop up
cmp ax,bx
jne l3
print msg1
jmp exit
l3:print msg2
   jmp exit
exit:mov ah,4ch
    int 21h
    end

   
