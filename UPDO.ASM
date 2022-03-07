.model small
.stack
.data
msg1 db 10,13,"up counting done ",10,13,"$"
msg2 db 10,13,"down counting done",10,13,"$"
.code
mov ax,@data
mov ds,ax
mov cx,100
mov al,0
top:push cx
    push ax
    call disp
    call delay
    pop ax
    inc al
    pop cx
    loop top
    lea dx,msg1
    mov ah,09h
    int 21h
    call delay
    mov cx,100
    mov al,99
down:push cx
     push ax
     call delay
     call disp
     pop ax
     dec al
     pop cx
     loop down
     lea dx,msg2
     mov ah,09h
     int 21h
 mov ah,4ch
 int 21h
delay proc
mov bx,0aaah
l1: dec dx
 jnz l1
 ret
 delay endp
disp proc
 aam
 add ax,3030h
 push ax
 mov dl,ah
 mov ah,02h
 int 21h
 pop ax
 mov dl,al
 mov ah,02h
 int 21h
 mov ah,03h
 int 21h
 mov dl,0
 mov ah,02h
 int 10h
 ret
 disp endp
 end
