.8086 ;directive for allowing only 8086 instructions 
DATA segment ;data segment 
STRING db "Hello.", 13, 10, "$" ;data segment for string "hello" 13, 10 is return carriage + line feed, so newline 
;"$" indicates end of string for DOS 
DATA ends 

CODE segment 
assume cs:CODE, ds:DATA ;assume is a directive to assume CODE as the code segment register, same for data segment register

START:
mov ax, seg DATA ;move data segment to accumuator
mov ds, ax  ;accumulator to data segment register
mov dx, offset STRING  ;move offset STRING to register d
mov ah, 9 ;9 is the instruction code to print string in dos
int 21h ;software interrupt like 8085 RST to call BIOS to print string
mov ah, 4ch ;exit code 0
int 21h ;same as before
CODE ends ;code segment ends 

STACK segment stack 
assume ss: STACK 
dw 64 dup(?) ;stack segment initialization
STACK ends 
end START ;end start
