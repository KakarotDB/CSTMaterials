.MODEL SMALL
.STACK 100h

.DATA
    handle      DW 0
    ethertype   DB 88h, 0B5h
    my_mac      DB 6 DUP(0)
    target_mac  DB 6 DUP(0FFh)
    tx_buffer   DB 60 DUP(0)
    rx_buffer   DB 1514 DUP(0)
    rx_flag     DB 0
    rx_char     DB 0
    msg_init    DB "Packet Driver Initialized. Press keys to send (ESC to exit)...",13,10,"$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; register ethertype
    MOV AH, 02h
    MOV AL, 1                    ; Ethernet class
    MOV BX, 0FFFFh               ; any type
    MOV DL, 0
    MOV CX, 2
    LEA SI, ethertype            ; DS:SI = type
    PUSH CS
    POP ES
    LEA DI, RECEIVER_CALLBACK    ; ES:DI = receiver
    INT 60h
    JC  INIT_FAILED
    MOV handle, AX

    ; get my MAC (needs handle, ES:DI = buffer in data segment)
    PUSH DS
    POP ES
    MOV AH, 06h
    MOV BX, handle
    MOV CX, 6
    LEA DI, my_mac
    INT 60h
    JC  INIT_FAILED

    MOV AH, 09h
    LEA DX, msg_init
    INT 21h

MAIN_LOOP:
    ; print anything the callback received
    CMP rx_flag, 0
    JE  CHECK_KEY
    MOV rx_flag, 0
    MOV DL, rx_char
    MOV AH, 02h
    INT 21h

CHECK_KEY:
    MOV AH, 01h
    INT 16h
    JZ  MAIN_LOOP

    MOV AH, 00h
    INT 16h
    CMP AL, 27
    JE  EXIT_PROGRAM

    CALL BUILD_AND_SEND_FRAME
    JMP MAIN_LOOP

EXIT_PROGRAM:
    MOV AH, 03h
    MOV BX, handle
    INT 60h
    MOV AX, 4C00h
    INT 21h

INIT_FAILED:
    MOV AX, 4C01h
    INT 21h
MAIN ENDP


BUILD_AND_SEND_FRAME PROC
    PUSH AX
    PUSH CX
    PUSH SI
    PUSH DI
    PUSH ES

    PUSH DS
    POP ES                       ; ES = DS (this was the crash)
    CLD

    LEA DI, tx_buffer
    LEA SI, target_mac
    MOV CX, 6
    REP MOVSB

    LEA SI, my_mac
    MOV CX, 6
    REP MOVSB

    MOV BYTE PTR [DI], 88h
    MOV BYTE PTR [DI+1], 0B5h
    ADD DI, 2

    MOV [DI], AL                 ; the key
    INC DI

    ; zero-pad to 60 bytes
    LEA AX, tx_buffer
    MOV CX, DI
    SUB CX, AX                   ; bytes used (15)
    NEG CX
    ADD CX, 60                   ; bytes left
    XOR AL, AL
    REP STOSB

    MOV AH, 04h
    LEA SI, tx_buffer
    MOV CX, 60
    INT 60h

    POP ES
    POP DI
    POP SI
    POP CX
    POP AX
    RET
BUILD_AND_SEND_FRAME ENDP


RECEIVER_CALLBACK PROC FAR
    CMP AX, 0
    JE  REQ_BUFFER
    CMP AX, 1
    JE  DATA_READY
    RETF

REQ_BUFFER:
    CMP CX, 1514                 ; refuse oversized frames
    JA  REJECT
    MOV AX, SEG rx_buffer
    MOV ES, AX
    LEA DI, rx_buffer
    RETF
REJECT:
    XOR AX, AX
    MOV ES, AX
    XOR DI, DI                   ; ES:DI = 0 -> discard
    RETF

DATA_READY:
    PUSH AX
    PUSH DS
    MOV AX, SEG rx_buffer
    MOV DS, AX
    MOV AL, rx_buffer[14]        ; payload byte
    MOV rx_char, AL
    MOV rx_flag, 1
    POP DS
    POP AX
    RETF
RECEIVER_CALLBACK ENDP

END MAIN
