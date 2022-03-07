.model small
print macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.data
n1 db 81h
len db 00h
msg1 db "number is a bit wise palindrome $"
msg2 db "number is not a bitwise palindrome $"
.code
mov ax,@data
mov ds,ax
mov al,n1
mov len,04h
mov cl,00h
l1:inc cl
   cmp len,00h
   je l9
   mov al,n1
   ror al,cl
   jc l2
   jnc l3
l6:mov al,n1
  rol al,cl
  jc l4
  jnc l5
l2:mov bl,01h
   jmp l6
l3:mov bl,00h
  jmp l6
l4:mov dl,01h
   jmp l7
l5:mov dl,00h
   jmp l7
l7:cmp bl,dl
   dec len
   je l1
   jne l8
l8:print msg2
   jmp exit
l9:print msg1
jmp exit
exit:mov ah,4ch
int 21h
end

