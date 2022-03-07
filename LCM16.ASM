.model small
.data
n1 dw 05dch
n2 dw 03e8h
n3 dw 01f4h
n4 dw 0000h,0000h
lcm1 dw 0000h,0000h
.code
 mov ax,@data
 mov ds,ax
 mov ax,n1
 mov bx,n2
 mov dx,0000h
 mov cx,0001h
 call lcm
 mov cx,0001h
 mov n4[2],ax
 mov n4[0],dx
 mov bx,n3
 call lcm
 mov lcm1[2],ax
 mov lcm1[0],dx
 mov ah,4ch
 int 21h
 lcm proc
        push ax
     l3:cmp dx,0000h
      jne l1
      cmp ax,bx
      jb exchange
      l1:div bx
      cmp dx,0000h
      je l2
      mov dx,0000h
      inc cx
      pop ax
      mul cx
      jmp l3
      exchange:xchg ax,bx
               jmp l1
     l2:mul bx
       RET
       lcm endp
 end
