data segment
mess1 db 'a string for testing$'
mess2 db 'found$'
mess3 db 'not found$'
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
mov di,offset mess1
mov cx,20
lop:cmp byte ptr[di],71h
jz j
inc di
dec cx
jz exit
jmp lop
j:
mov dx,offset mess2
jmp L
exit:
mov dx,offset mess3
L:mov ah,9
int 21h
code ends
end start