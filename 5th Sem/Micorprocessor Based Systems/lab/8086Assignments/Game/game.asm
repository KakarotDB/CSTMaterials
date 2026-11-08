.model small 
.stack 100H

widt equ 10
HEIGHT equ 10 

.data 
map db '##########'
    db '#        #'
    db '#        #'
    db '#        #'
    db '#        #'
    db '#        #'
    db '#        #'
    db '#        #'
    db '#        #'
    db '##########'

.code 
main proc 
    mov ax, @data 
    mov ds, ax 

    call DrawMap

    mov ah, 08h
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
