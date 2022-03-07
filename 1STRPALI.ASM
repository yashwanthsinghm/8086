print macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
msg1 db "it is a palindrome$"
msg2 db "its not apalindrome$"
arr db "malayelam"
des db 9 dup(?)
len dw 0009h
.code
mov ax,@data
mov ds,ax
mov es,ax
lea si,arr
lea di,des
mov cx,len
dec cx
add di,cx
inc cx
l1:mov al,[si]
   mov [di],al
   inc si
   dec di
   loop l1
lea si,arr
lea di,des
cld
mov cx,len
repe cmpsb
jcxz equal
print msg2
jmp exit
equal:print msg1
jmp exit
exit :mov ah,4ch
int 21h
end


