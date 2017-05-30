data segment
string db 'In 1990,the exchange rate was 8.1/$'
num db ?
char db ?
other db ?
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
lea di,string
mov cx,34
add [num],30h
add [char],30h
add [other],30h
M:cmp byte ptr[di],30h
jb H   
cmp byte ptr[di],3Ah
jb J   
cmp byte ptr[di],41h
jb H   
cmp byte ptr[di],5Bh
jb K  
cmp byte ptr[di],61h
jb H;   
cmp byte ptr[di],7bh
jb K
H:inc [num]
jmp N
J:inc [char]
jmp N
K:inc [other]
jmp N
N:inc di
dec cx
jz L
jmp M
L:
mov dl,[num]
mov ah,02h
int 21h
mov dl,[char]
mov ah,02h
int 21h
mov dl,[other]
mov ah,02h
int 21h
mov ah,4ch
int 21h
code ends
end start
