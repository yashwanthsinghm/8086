print macro msg
lea dx,msg
mov ah,09h
int21h
endm
.model small
.data
msg1 db "it is a palindrome$"
msg2 db "its not apalindrome$"
arr db "malayalam"
des db 10 dup(0)
len db ($-arr-1)
.code
mov ax,@data
mov ds,ax
mov es,ax
lea si,arr
lea di,des
add di,len
mov cl,len+1
l1:mov al,[si]
   mov [di],al
   inc si
   inc di
   loop l1
mov cl,len
cmp si,di
jcxz equal
print msg2
jmp exit
equal:print msg1
jmp exit
exit :mov ah,4ch
int 21h
end


