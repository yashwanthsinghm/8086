.model small
.stack
.data
.code
mov ax,@data
mov ds,ax
public conv
conv proc
mov al,[si]
add al,20h
mov [di],al
ret
conv endp
mov ah, 4ch
int 21h
end

