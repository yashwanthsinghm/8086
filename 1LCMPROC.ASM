.model small
.stack
.data
n1 dw 060000d
n2 dw 040000d
n3 dw 030000d
lc dw 0000h,0000h
lm dw 0000h,0000h
c dw 01d
d dw 0000h
e dw 0000h,0000h,0000h
.code
mov ax,@data
mov ds,ax
mov ax,n1
;mov bx,lm[0]
mov bx,n2
mov dx,0000h
mov d,0000h
cmp ax,bx
jb ex
l1:mov cx,ax
   mov c,01d
  call lcm
  mov lc[2],ax
  mov lc[0],dx
  jmp l2
ex:xchg ax,bx
  mov n1,ax
  mov n2,bx
  jmp l1
l2:mov bx,n3
cmp dx,0000h
mov d,dx
jne l4
cmp ax,bx
jb ex1
l4:mov cx,ax
   mov c,01d
   call lcm
   mov lm[2],ax
   mov lm[0],dx
   mov ah,4ch
   int 21h
   jmp exit
ex1:xchg ax,bx
    mov n2,ax
    mov n1,bx
    jmp l4
lcm proc
 l6:  div bx
   cmp dx,0000h
    je l5
    inc c
    mov ax,cx
    mul c
    mov e[4],ax
    mov e[2],dx
    mov ax,d
    mul c
    add e[2],ax
    adc e[0],dx
    mov ax,e[4]
    mov dx,e[2]
    jmp l6
    l5:mul bx
    ret
    lcm endp
exit:end
