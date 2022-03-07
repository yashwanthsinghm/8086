.model small
.data
msg db "what is your name? $"
str db 20 dup(20)
row db 27h
col db 0dh
char db "$"
.code
mov ax,@data
mov ds,ax
lea si,msg
mov ah,09h
int 21h
mov cx,0000h
up1:mov ah,01h
   int 21h
   cmp al,0dh
   je down
   mov [si],al
   inc si
   jmp up1
   down:mov al,"$"
        mov [si],al
        mov ah,06h
        mov al,00h
        mov bh,06h
        mov ch,00h
        mov cl,00h
        mov dh.24h
        mov dl,79h
        int 10h
        mov dl,row
        mov dh,col
        mov ah,02h
        int 10h
        lea dx,msg
        mov ah,09h
        int 21h
        mov ah,4ch
        int 21h
        end

