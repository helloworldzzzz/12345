data segment
message1 db 'plz input daxie hui che tuichu$'
message2 db 'wrong no daxie$'
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
mov dx,offset message1
mov ah,09h
int 21h
mov dl,0ah
mov ah,02
int 21h
lop:mov ah,01
int 21h
cmp al,41h
jb jinggao
cmp al,5bh
jb bianxiao
cmp al,0dh
jz exit
jmp jinggao
bianxiao:add al,20h
mov dl,al
mov ah,02
int 21h
xor al,al
jmp lop
jinggao:
mov dl,0ah
mov ah,02
int 21h
mov dx,offset message2
mov ah,09h
int 21h
mov dl,0ah
mov ah,02
int 21h
jmp lop
exit:mov ah,4ch
int 21h
code ends
end start