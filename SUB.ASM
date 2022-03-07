.model small
.data
res1 db "str2 exists in str1 $"
res2 db "str2 doesnt exist in str1 $"
str1 db 'MYNAME$'
LEN1 DW $-STR1-1
STR2 DB 'NAME$'
LEN2 DW $-STR2-1
TEMP DW 0000H
TEMP1 DW 0000H
.CODE
MOV AX,@data
mov ds,ax
mov es,ax
lea si,str1
lea di,str2
mov temp,di
mov bx,temp
add bx,len2
mov temp,bx
mov bx,len1
mov temp1,bx
sub bx,len2
mov temp1,bx
mov cx,0000h
sub si,01h
dec cx
l2:inc cx
l3:inc si
mov al,[si]
sub al,[di]
jnz l2
inc di
cmp di,temp
jnz l3
cmp cx,temp1
jnz l4
lea dx,res1
mov ah,09h
int 21h
jmp exit1
l4:lea dx,res2
mov ah,09h
int 21h
exit1 :mov ah,4ch
      int 21h
       end
