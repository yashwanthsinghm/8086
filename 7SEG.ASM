.model small
.stack 100
 .data
 num db 0ffh,0ffh,0ffh,0ffh,92h,88h,0abh,87h,0c0h,92h,89h,0ffh,0ffh,0ffh,0ffh
 .code
 mov ax,@data
 mov ds,ax
 mov al,80h
 mov dx,9403h
 out dx,al
 mov dx,00d
 lea si,num
 add si,14d
 display: call disp
          push ax
          push dx
          mov dx,01h
          l1:mov ax,01h
          l2:dec ax
          jnz l2
          dec dx
          jnz l1
          pop dx
          pop ax
dec si
inc dx
cmp dx,11d
jbe display
mov ah,4ch
int 21h
       disp proc
       push dx
       push si
       mov bx,04h
       l3:mov al,[si]
       mov cl,08h
       l4:rol al,01h
       mov dx,9401h
       out dx,al
       push ax
       mov al,0ffh
       mov dx,9402h
       out dx,al
       mov al,00h
       out dx,al
       pop ax
       loop l4
       dec si
       dec bx
       cmp bx,00h
       ja l3
       pop si
       pop dx
       ret
       disp endp
       end
          
