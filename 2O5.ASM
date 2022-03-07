print macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
num db 18h
msg1 db "it is a 2 out of 5 code $"
msg2 db "it is not a two out of five $"
.code
mov ax,@data
mov ds,ax
mov al,num
mov cl,03h
l1:rol al,01h
    jc exit
    loop l1
mov cl,05h
mov bl,00h
l2:rol al,01h
   jnc l3
   inc bl
   l3:loop l2
cmp bl,02h
jne exit
print msg1
jmp stop
exit:print msg2
    jmp stop
stop:mov ah,4ch
     int 21h
     end
   
