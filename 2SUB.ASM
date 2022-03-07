print macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.stack
.data
str db "christcollege"
str1 db "college"
len db $-str-1
len1 db $-str1-1
msg1 db "string not found$"
msg2 db "string found$"
n db 00h
.code
mov ax,@data
mov ds,ax
mov es,ax
lea si,str
lea di,str1
mov dl,len
sub dl,len1
mov bl,00h
cld
l1:mov cl,len1
REPE cmpsb
jcxz equal
inc bl
lea si,str
add si,bl
lea di,str1
dec dl
cmp dl,00h
jne l1
print msg1
jmp exit
equal:print msg2
      jmp exit
exit:mov ah,4ch
     int 21h
     end
