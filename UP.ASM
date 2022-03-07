.model small
.stack
.data
msg db 10,13
msg1 db " $"
.code
mov ax,@data
mov ds,ax
mov dh,0dh
mov dl,024h
mov ah,02h
int 10h
mov bh,'0'
mov bl,'0'
up:mov dl,bh
  mov ah,02h
  int 21h
  mov dl,bl
  mov ah,02h
  int 21h
  lea dx,msg
  mov ah,09h
  int 21h
  call delay
  inc bl
  cmp bl,3ah
  jne up
  mov bl,'0'
  inc bh
  cmp bh,3ah
  jne up
mov bh,'9'
mov bl,'9'
down:mov dl,bh
  mov ah,02h
  int 21h
  mov dl,bl
  mov ah,02h
  int 21h
  lea dx,msg
  mov ah,09h
  int 21h
  call delay
  dec bl
  cmp bl,'0'
  jae down
  mov bl,'9'
  dec bh
  cmp bh,'0'
  jae down
mov ah,4ch
int 21h
delay proc
push cx
push bx
mov cx,00fffh
l1:mov bx,0055h
l2:dec bx
   jnz l2
   loop l1
   pop bx
   pop cx
   RET
   delay endp
   end
     
