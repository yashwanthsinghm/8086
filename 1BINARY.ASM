print macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
arr dw 1111h,2222h,3333h,4444h,5555h,6666h,7777h,8888h,9999h
len dw ($-arr)/2
key dw 9999h
msg1 db "key found at position $"
msg2 db "key not found $"
pos db 00h
.code
mov ax,@data
mov ds,ax
mov bx,01h
mov dx,len
mov cx,key
l1:cmp bx,dx
   ja nof
   mov ax,bx
   add ax,dx
   shr ax,01h
   mov si,ax
   dec si
   add si,si
l2:cmp cx,arr[si]
   jae sucess
   dec ax
   mov dx,ax
   jmp l1
sucess:je found
      inc ax
      mov bx,ax
      jmp l1
found:print msg1
      add al,'0'
      mov pos,al
      mov dl,pos
      mov ah,02h
      int 21h
      jmp exit
nof:print msg2
   jmp exit
exit:mov ah,4ch
     int 21h
     end
