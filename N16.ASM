.model small
.data
n dw 1234h,2113h,5118h,2324h,9956h
l db ($-n)/2
res db 3 dup(0)
.code
mov ax,@data
mov ds,ax
mov cl,l
dec cl
lea si,n
mov dx,[si]
l1:add si,0002
   mov bx,[si]
   mov al,dl
   add al,bl
   daa
   mov dl,al
   mov al,dh
   adc al,bh
   daa
   mov dh,al
   mov bl,res
   adc bl,00h
   mov res,bl
   loop l1
   mov res+1,dh
   mov res+2,dl
   mov ah,4ch
   int 21h
   end
