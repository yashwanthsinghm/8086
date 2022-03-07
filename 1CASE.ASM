.model small
.stack
.data
lower db 20 dup(0)
upper db 20 dup(0)
.code
mov ax,@data
mov ds,ax
lea si,lower
lea di,upper
mov cl,00h
;dec si
up:mov ah,01h
  int 21h
  ;inc si
  ;inc cl
  cmp al,0Dh
  JE L2
  mov [si],al
  INC SI
  INC CL
  JMP UP
  ;jne up
  ;dec cl
L2:LEA SI,LOWER
L1:MOV AL,[SI]
   SUB AL,20H
   mov [di],al
   inc si
   inc di
   loop l1
   mov al,'$'
   mov [di],al
   lea di,upper
   mov ah,09h
   int 21h
   mov ah,4ch
   int 21h
   end



