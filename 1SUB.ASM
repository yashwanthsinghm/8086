print macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.stack
.data
msg1 db "string found $"
msg2 db "string not found $"
str1 db 'pesitsouthcampus'
str2 db 'campe'
len db $-str1-1
len1 db $-str2-1
.code
mov ax,@data
mov ds,ax
;mov es,ax
lea si,str1
lea di,str2
mov bl,len
sub bl,len1
mov cl,len1
up1:mov al,[di]
    cmp al,[si]
    je l1
    inc si
    dec bl
    cmp bl,00h
    jne up1
 print msg2
 jmp exit
l1:inc si
   inc di
   dec cl
   cmp cl,00h
   jne up1
print msg1
exit:mov ah,4ch
     int 21h
     end


