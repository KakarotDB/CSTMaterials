.model small 
.stack 100H

widt equ 12
HEIGHT equ 10 

.data 
map db '############'
    db '#          #'
    db '# .        #'
    db '#          #'
    db '#          #'
    db '#          #'
    db '#          #'
    db '#       $  #'
    db '#          #'
    db '############'

playerPos dw 13 ;first row, first column (0 indexing)
winmsg db 'You win!$'
under db ' '

.code 
main proc 
    mov ax, @data 
    mov ds, ax 

    mov bx, playerPos
    mov map [bx], '@'

gameloop:
    call DrawMap
    
input:    
    mov ah, 08h ;taking keyboard input
    int 21h 

    cmp al, 'w'
    jz up
    cmp al, 's'
    jz down
    cmp al, 'a'
    jz left
    cmp al, 'd'
    jz right 
    jmp input

up:
    mov dx, -widt 
    jmp trymove 

down:
    mov dx, widt 
    jmp trymove

left:
    mov dx, -1
    jmp trymove

right:
    mov dx, 1
    jmp trymove

trymove:
    mov bx, playerPos
    add bx, dx 
    
    cmp map[bx], '#'
    jz gameloop
    cmp map[bx], '$'
    jz pushbox

domove:
    mov si, playerPos
    mov al, under
    mov map[si], al
    mov al, map[bx]
    mov under, al
    mov map[bx], '@'
    mov playerPos, bx
    jmp gameloop

pushbox:
    mov di, bx
    add di, dx

    cmp map[di], '#'
    jz gameloop
    
    mov al, map[di]
    mov map[di], '$'
    mov map[bx], ' '

    cmp al, '.'
    jz win
    jmp domove

win:
    call DrawMap
    mov ah, 09h
    mov dx, offset winmsg
    int 21h
    mov ax, 4c00h
    int 21h
main endp

DrawMap proc 
    mov ax, 0003h
    int 10h

    mov si, offset map 
    mov cx, HEIGHT 

rowloop:
    push cx
    mov cx, widt
colloop:
    mov dl, [si]
    mov ah, 02h
    int 21h
    inc si 
    loop colloop

    mov dl, 13
    mov ah, 02h
    int 21h 
    mov dl, 10
    mov ah, 02h
    int 21h 

    pop cx 
    loop rowloop
    ret
DrawMap endp
end main
