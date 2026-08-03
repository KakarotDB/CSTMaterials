;problem 9

ORG 8000H

;main program
MAIN: CALL ISUPPER
    MOV A, B 
    STA 8801H
    HLT 

;ISUPPER subroutine 
ISUPPER: LDA 8800H
    CPI 41H        ; Compare A with 41H (Sets carry if A < 41H)
    JC SET_FALSE

    CPI 5BH        ; Compare A with 5BH (Sets carry if A < 5BH)
    JNC SET_FALSE  ; Jumps if character >= 'Z' + 1

    MVI B, 01H
    RET

SET_FALSE: MVI B, 00H
    RET
