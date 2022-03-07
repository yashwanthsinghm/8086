.model small
.stack
.data
n1 dw 0abcdh,1234h
n2 dw 0bbbbh,2222h
res dw 0000h,0000h,0000h,0000h
.code
mov ax,@data
mov ds,ax
mov ax,n1[2]
mov bx,n2[2]
mul bx
mov res[6],ax
mov res[4],dx
mov ax,n1[0]
mul bx
adc res[4],ax
mov res[2],dx
mov ax,n1[2]
mov bx,n2[0]
mul bx
adc res[4],ax
adc res[2],dx
mov ax,n1[0]
mul bx
adc res[2],ax
mov res[0],dx
adc res[0],0000h
mov ah,4ch
int 21h
end


