data segment
message db 'c$'
data ends
code segment
assume cs:code,ds:data
start:mov ah,07
int 21h
cmp al,0dh
jz exit
cmp al,30h
jb start
cmp al,3ah
jb huixian
cmp al,41h
jb start
cmp al,5bh
jb huixianc
cmp al,61h
jb start
cmp al,7bh
jb huixianc
jmp start
huixian:
mov dl,al
mov ah,02
int 21h
jmp start
huixianc:
mov dx,offser message
mov ah,09h
int 21h
jmp start
exit:
mov ah,4ch
int 21h
code ends
end start