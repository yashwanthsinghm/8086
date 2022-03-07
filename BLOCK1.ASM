.model small
.stack
.data
sa dw 2005h
da dw 3005h
len db 05h
.code
mov ax,@data
mov ds,ax
mov si,sa
mov di,da
mov ch,00h
mov cl,len
cmp si,di
jae up4
sub si,di
cmp si,cx
jb up4
mov si,sa
mov di,da
add si,cx
add di,cx
dec si
dec di
up2:mov al,[si]
    mov [di],al
    dec si
    dec di
    loop up2
    jmp down
mov si,sa
    mov di,da
up4:mov al,[si]
    mov [di],al
    inc si
    inc di
    loop up4
    down :mov ah,4ch
    int 21h
    end
