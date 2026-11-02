.model small ;allocate 64kb of memory for this program
.stack 100 ;stack size 
.data
prompt db 0ah,0dh,"Enter a number < 5: $" ;these are all the predefined data or constants per se 
resmes db 0ah,0dh,"Double your number is: "
result db ?,0ah,0dh,"$"
.code
start: 
mov ax, @data ;move data to ax
mov ds, ax ;move ax data to data segment register
lea dx, prompt ;load effective offset address
mov ah, 9 ;print function
int 21h ;software interrupts
mov ah,1 ;read from user
int 21h
sub al, 30h ;to get actual value from ascii 
add al, al ;doubling the value
add al, 30h ;adding back to ascii
mov result, al ;moving al to result 
lea dx, resmes ;load effective offset address
mov ah, 9 ;prints again 
int 21h
mov ax, 4c00h ;ah = 4c, al = 00h, indicating exit code 0
int 21h
end start
