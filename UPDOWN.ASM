.model small
.stack
.data
msg db "  $"
.code
mov ax,@data
mov ds,ax
mov al,'0'
mov bl,'0'
l1:mov dl,al
mov ah,02h
int 21h
;lea dx,msg
;mov ah,09h
;int 21h
mov dl,bl
mov ah,02h
int 21h
;call delay
inc bl
cmp bl,3ah
jne l1
inc al
mov bl,30h
cmp al,3ah
jne l1
mov ah,4ch
int 21h
delay proc
  mov cx,0fffh
  up:mov bx,0aah
     up1:dec bx
     jnz up1
     loop up
     ret
     delay endp
end

