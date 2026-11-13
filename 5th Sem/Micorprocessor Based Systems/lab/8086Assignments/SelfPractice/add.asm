.model small 
.stack 100H
 
.data 
num1 dw 25
num2 dw 17 
sum dw ? 

.code 
main proc 
    mov ax, @data 
    mov ds, ax 
    mov ax, num1 
    add ax, num2 

    mov sum, ax
    mov ax, 4c00h
    int 21h 
main endp
end main 

