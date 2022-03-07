.model small
.data
n1 dw 2000h
n2 dw 3000h
len db 0ah
.code
mov ax,@data
mov ds,ax
mov si,n1
mov di,n2
mov cl,len
l1:mov al,[si]
   mov [di],al
   inc si
   inc di
   loop l1
mov si,n1
mov di,n2
add di,0010h
mov cl,03h
l2:mov al,[si]
   mov [di],al
   inc di
   inc si
   loop l2
mov si,n1
mov cl,0ah
l3:mov al,[si]
   mov [di],al
   inc si
   inc di
   loop l3
mov ah,4ch
int 21h
end

