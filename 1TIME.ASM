.model small
.data
time db 00h,00h,00h,00h
.code
mov ax,@data
mov ds,ax
mov ah,2ch
int 21h
mov time[0],ch
mov time[1],cl
mov time[2],dh
mov time[3],dl
mov cx,0004h
lea si,time
l1:mov al,[si]
   aam
   add ax,3030h
   mov dx,ax
   xchg DH,DL
   mov ah,02h
   int 21h
   mov dl,dh
   mov ah,02h
   int 21h
   dec cx
   jz exit
   mov dl,':'
   mov ah,02h
   int 21h
   inc si
   jmp l1
exit:mov ah,4ch
     int 21h
     end
