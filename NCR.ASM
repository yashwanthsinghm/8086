print macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.stack
.data
n dw 000ah
r dw 0005h
res dw 0000h
msg1 db "invalid input $"
.code
mov ax,@data
mov ds,ax
mov cx,res
mov ax,n
mov bx,r
cmp ax,bx
jb disp
call ncr
jmp stop
disp:print msg1
    jmp stop
l1:inc res
   ret
l2:inc res
  add res,ax
  ret
ncr proc
cmp ax,bx
je l1
cmp bx,0000h
je l1
dec ax
cmp bx,0001h
je l2
push ax
push bx
call ncr
pop bx
pop ax
dec bx
push ax
push bx
call ncr
pop bx
pop ax
ret
ncr endp
stop:mov ah,4ch
   int 21h
   end

