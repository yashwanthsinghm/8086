.model small
.data
n1 dw 1234h,2345h,3456h,4567h,5678h
len dw ($-n1)/2
.code
mov ax,@data
mov ds,ax
lea si,n1
mov cx,len
back:mov ax,[si]
shr ax,01h
jc odd
jnc even1
even1:mov [di],ax
     inc di
     inc di
     inc si
     inc si
     loop back
odd:
   mov [bx],ax
    inc bx
    inc bx
    inc si
    inc si
    loop back
mov ah,4ch
int 21h
end
