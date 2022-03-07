print macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.stack
.data
msg1 db "  has a equivalent 16 bit ascii value  $" 
.code
mov ax,@data
mov ds,ax
mov ah,01h
int 21h
mov cl,al
mov ah,00h
mov bh,00h
call ascii
push bx
call ascii
print msg1
mov dl,al
mov ah,02h
int 21h
mov dl,bl
mov ah,02h
int 21h
pop bx
mov al,bl
call ascii
mov dl,al
mov ah,02h
int 21h
mov dl,bl
mov ah,02h
int 21h
mov ah,4ch
int 21h
jmp exit
ascii proc
 mov bl,al
 and al,0f0h
 mov cl,04h
 shr al,cl
 cmp al,0ah
 jb l1
 add al,07h
 l1:add al,30h
 and bl,0fh
 cmp bl,0ah
 jb l2
 add bl,07h
 l2:add bl,30h
    ret
    ascii endp
exit:end

