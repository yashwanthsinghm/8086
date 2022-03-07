.model small
.data
n1 db 20 dup(0)
n2 db 20d 
.code
mov ax,@data
mov ds,ax
lea si,n1
mov al,00h
mov bl,01h
call faco
mov ah,4ch
int 21h
faco proc
   mov [si],al
   inc si
   mov [si],bl
   inc si
   mov cl,n2
   back:add al,bl
        mov [si],al
        inc si
        mov dl,bl
        mov bl,al
        mov al,dl
        loop back
        ret
        faco endp
        end


