.model small
.data
n1 dw 009d
res dw 3 dup(?)
d dw 0000h
.code
mov ax,@data
mov ds,ax
mov dx,0000h
mov ax,n1
mov bx,ax
mov res[4],ax
mov res[2],dx
call fact
MOV AH,4CH
int 21h
fact proc
   l2:dec bx
   mov ax,res[4]
   mov cx,res[2]
   mul bx
   mov res[4],ax
   add res[2],dx
   mov ax,cx
   mul bx
   adc res[2],ax
   adc res[0],dx
   cmp bx,0000h
   je l1
   jmp l2
   l1:RET
   fact endp
end
   


