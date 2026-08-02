# Assignment 2

## 1. Initializing x = 59H, and x += 37H

| Assembly Language | Address | Machine Language | Comments     |
| ----------------- | ------- | ---------------- | ------------ |
| MVI A, 59H        | 8900    | 3E 59            | A <- 59H     |
| ADI A, 37         | 8902    | C6 37            | A <- A + 37H |
| RST 3             | 8904    | DF               | End          |

## 2a. Adding two numbers (registers)

| Assembly Language | Address | Machine Language | Comments   |
| ----------------- | ------- | ---------------- | ---------- |
| MVI B, 3AH        | 8900    | 06 3A            | B <- 3AH   |
| MVI C, 1FH        | 8902    | 0E 1F            | C <- 1F    |
| MOV A, B          | 8904    | 78               | A <- B     |
| ADD C             | 8905    | 81               | A <- A + C |
| MOV D, A          | 8906    | 57               | D <- A     |
| RST 3             | 8907    | DF               | End        |

## 2b. Adding two numbers (addresses)

| Assembly Language | Address | Machine Language | Comments    |
| ----------------- | ------- | ---------------- | ----------- |
| MVI A, 3A         | 8800    | 3E, 3A           | A <- 3A     |
| STA 8900          | 8802    | 32 00 89         | 8900 <- (A) |
| MVI A, 1F         | 8805    | 3E 1F            | A <- 1F     |
| LDA 8900          | 880A    | 3A 00 89         | A <- (8900) |
| MOV B, A          | 880D    | 47               | B <- A      |
| LDA 8901          | 880E    | 3A 01 89         | A <- (8901) |
| ADD B             | 8811    | 80               | A <- A + B  |
| STA 8902          | 8812    | 32 02 89         | 8920 <- A   |
| RST 3             | 8815    | DF               | End         |

## 3a. Swapping contents of two registers  

| Assembly     | Address | Machine Code | Comments    |
| ------------ | ------- | ------------ | ----------- |
| `MVI B, 3AH` | 8900H   | 06           | B ← 3A      |
|              | 8901H   | 3A           |             |
| `MVI C, 1FH` | 8902H   | 0E           | C ← 1F      |
|              | 8903H   | 1F           |             |
| `MOV A,B`    | 8904H   | 78           | A ← B       |
| `MOV B,C`    | 8905H   | 41           | B ← C       |
| `MOV C,A`    | 8906H   | 4F           | C ← A       |
| `RST 3`      | 8907H   | DF           | End program |
## 3b.  Swapping contents of two memory locations 

| Assembly | Address | Machine Code | Comments |
|---|---|---|---|
| `MVI A,3AH` | 8800H | 3E | A ← 3AH |
| | 8801H | 3A | |
| `STA 8900H` | 8802H | 32 | (8900H) ← A |
| | 8803H | 00 | |
| | 8804H | 89 | |
| `MVI A,1FH` | 8805H | 3E | A ← 1FH |
| | 8806H | 1F | |
| `STA 8911H` | 8807H | 32 | (8911H) ← A |
| | 8808H | 11 | |
| | 8809H | 89 | |
| `LDA 8900H` | 880AH | 3A | A ← (8900H) |
| | 880BH | 00 | |
| | 880CH | 89 | |
| `MOV B,A` | 880DH | 47 | B ← A |
| `LDA 8911H` | 880EH | 3A | A ← (8911H) |
| | 880FH | 11 | |
| | 8810H | 89 | |
| `STA 8900H` | 8811H | 32 | (8900H) ← A |
| | 8812H | 00 | |
| | 8813H | 89 | |
| `MOV A,B` | 8814H | 78 | A ← B |
| `STA 8911H` | 8815H | 32 | (8911H) ← A |
| | 8816H | 11 | |
| | 8817H | 89 | |
| `RST 3` | 8818H | DF | End program |

---

## 3c. Swapping contents of register and memory location

| Assembly      | Address | Machine Code | Comments                        |
| ------------- | ------- | ------------ | ------------------------------- |
| `MVI B,3AH`   | 8800H   | 06           | B ← 3AH                         |
|               | 8801H   | 3A           | Point H-L pair to address 8900H |
| `LXI H,8900H` | 8802H   | 21           |                                 |
|               | 8803H   | 00           |                                 |
|               | 8804H   | 89           |                                 |
| `MVI M,1FH`   | 8805H   | 36           | M ← 1F                          |
|               | 8806H   | 1F           |                                 |
| `MOV A,M`     | 8807H   | 7E           | A ← M                           |
| `MOV M,B`     | 8808H   | 70           | M ← B                           |
| `MOV B,A`     | 8809H   | 47           | B ← A                           |
| `RST 3`       | 880AH   | DF           | End program                     |

**Check:** register B should have **1F**, memory 8900H should have **3A**

---

## 4a. | x - y | with two registers, result in memory location 

| Assembly    | Address | Machine Code | Comments                      |
| ----------- | ------- | ------------ | ----------------------------- |
| `MVI B,3AH` | 8900H   | 06           | B ← 3A (x)                    |
|             | 8901H   | 3A           |                               |
| `MVI C,1FH` | 8902H   | 0E           | C ← 1F (y)                    |
|             | 8903H   | 1F           |                               |
| `MOV A,B`   | 8904H   | 78           | A ← B (x)                     |
| `CMP C`     | 8905H   | B9           | compare (A)x with (C)y        |
| `JNC 890EH` | 8906H   | D2           | if x ≥ y (CY=0), jump to 890E |
|             | 8907H   | 0E           |                               |
|             | 8908H   | 89           |                               |
| `MOV A,C`   | 8909H   | 79           | A ← C (y)                     |
| `SUB B`     | 890AH   | 90           | A ← y - x                     |
| `JMP 8911H` | 890BH   | C3           | jump to store result          |
|             | 890CH   | 11           |                               |
|             | 890DH   | 89           |                               |
| `SUB C`     | 890EH   | 91           | A ← x - y                     |
| `STA 8920H` | 890FH   | 32           | store result at 8920H         |
|             | 8910H   | 20           |                               |
|             | 8911H   | 89           |                               |
| `RST 3`     | 8912H   | DF           | Stop                          |

**Result:** 1B present at 8920H

---

## 4b. |x - y|, both memory locations, result is register 

| Assembly | Address | Machine Code | Comments |
|---|---|---|---|
| `LDA 8920H` | 8900H | 3A | A ← x (stored at 8920H) |
| | 8901H | 20 | |
| | 8902H | 89 | |
| `MOV B,A` | 8903H | 47 | B ← A (x) |
| `LDA 8921H` | 8904H | 3A | A ← y |
| | 8905H | 21 | |
| | 8906H | 89 | |
| `CMP B` | 8907H | B8 | compare y(A) with x(B) |
| `JNC 8913H` | 8908H | D2 | if y ≥ x (CY=0), jump to 8913 |
| | 8909H | 13 | |
| | 890AH | 89 | |
| `MOV A,B` | 890BH | 78 | A ← B (x) |
| `LXI H,8921H` | 890CH | 21 | H-L ← y (address) |
| | 890DH | 21 | |
| | 890EH | 89 | |
| `SUB M` | 890FH | 96 | A ← x - y |
| `JMP 8914H` | 8910H | C3 | jump to save result |
| | 8911H | 14 | |
| | 8912H | 89 | |
| `SUB B` | 8913H | 90 | A ← y - x |
| `MOV D,A` | 8914H | 57 | D ← A |
| `RST 3` | 8915H | DF | Stop |

**Result:** 1B stored in register D

---

## 4c. |x - y|, one register, one memory location, result stored in register 

| Assembly      | Address | Machine Code | Comments               |
| ------------- | ------- | ------------ | ---------------------- |
| `MVI A,1FH`   | 88F9H   | 3E           | A ← 1F (y)             |
|               | 88FAH   | 1F           |                        |
| `STA 8921H`   | 88FBH   | 32           | 8921H ← y              |
|               | 88FCH   | 21           |                        |
|               | 88FDH   | 89           |                        |
| `MVI B,3AH`   | 88FEH   | 06           | B ← 3A (x)             |
|               | 88FFH   | 3A           |                        |
| `LDA 8921H`   | 8900H   | 3A           | A ← y                  |
|               | 8901H   | 21           |                        |
|               | 8902H   | 89           |                        |
| `CMP B`       | 8903H   | B8           | y(A) compare x(B)      |
| `JNC 890FH`   | 8904H   | D2           | if y ≥ x, jump to 890F |
|               | 8905H   | 0F           |                        |
|               | 8906H   | 89           |                        |
| `MOV A,B`     | 8907H   | 78           | A ← B (x)              |
| `LXI H,8921H` | 8908H   | 21           | H-L ← y (address)      |
|               | 8909H   | 21           |                        |
|               | 890AH   | 89           |                        |
| `SUB M`       | 890BH   | 96           | A ← x - y              |
| `JMP 8910H`   | 890CH   | C3           | jump to save result    |
|               | 890DH   | 10           |                        |
|               | 890EH   | 89           |                        |
| `SUB B`       | 890FH   | 90           | A ← y - x              |
| `MOV D,A`     | 8910H   | 57           | D ← A                  |
| `RST 3`       | 8911H   | DF           | Stop                   |

**Result:** 1B stored in register D

---

## 4d. |x - y|, x is register, y is memory location, result is memory location

| Assembly      | Address | Machine Code | Comments               |
| ------------- | ------- | ------------ | ---------------------- |
| `MVI A,1FH`   | 88F9H   | 3E           | A ← 1F (y)             |
|               | 88FAH   | 1F           |                        |
| `STA 8921H`   | 88FBH   | 32           | 8921H ← A              |
|               | 88FCH   | 21           |                        |
|               | 88FDH   | 89           |                        |
| `MVI B,3AH`   | 88FEH   | 06           | B ← 3A (x)             |
|               | 88FFH   | 3A           |                        |
| `LDA 8921H`   | 8900H   | 3A           | A ← y                  |
|               | 8901H   | 21           |                        |
|               | 8902H   | 89           |                        |
| `CMP B`       | 8903H   | B8           | y(A) compare x(B)      |
| `JNC 8910H`   | 8904H   | D2           | if y ≥ x, jump to 8910 |
|               | 8905H   | 10           |                        |
|               | 8906H   | 89           |                        |
| `MOV A,B`     | 8907H   | 78           | A ← B (x)              |
| `LXI H,8921H` | 8908H   | 21           | H-L ← y (address)      |
|               | 8909H   | 21           |                        |
|               | 890AH   | 89           |                        |
| `SUB M`       | 890BH   | 96           | A ← x - y              |
| `STA 8922H`   | 890CH   | 32           | store result at 8922H  |
|               | 890DH   | 22           |                        |
|               | 890EH   | 89           |                        |
| `RST 3`       | 890FH   | DF           | Stop                   |
| `SUB B`       | 8910H   | 90           | A ← y - x              |
| `STA 8922H`   | 8911H   | 32           | store result at 8922H  |
|               | 8912H   | 22           |                        |
|               | 8913H   | 89           |                        |
| `RST 3`       | 8914H   | DF           | Stop                   |

**Result:** 1B stored at address 8922H

--- 

## 5. Sum of an Array (Pre-Execution / Initialization)

**Initial memory:** 8900H = 01H ... 8909H = 0AH (10 bytes, values 01H–0AH) → Expected sum = 37H

| Assembly      | Address | Machine Code | Comments                          |
| ------------- | ------- | ------------ | --------------------------------- |
| `MVI C,0AH`   | 8800H   | 0E           | Loop counter C = 10               |
|               | 8801H   | 0A           |                                   |
| `XRA A`       | 8802H   | AF           | A ← 00H                           |
| `LXI H,8900H` | 8803H   | 21           | (HL pair) ← 8900H                 |
|               | 8804H   | 00           |                                   |
|               | 8805H   | 89           |                                   |
| `LOOP: ADD M` | 8806H   | 86           | A ← A + (HL)                      |
| `INX H`       | 8807H   | 23           | increment HL pair to next address |
| `DCR C`       | 8808H   | 0D           | C ← C - 1                         |
| `JNZ LOOP`    | 8809H   | C2           | jump back to LOOP if C ≠ 0        |
|               | 880AH   | 06           |                                   |
|               | 880BH   | 88           |                                   |
| `STA 890AH`   | 880CH   | 32           | (890AH) ← A, store sum            |
|               | 880DH   | 0A           |                                   |
|               | 880EH   | 89           |                                   |
| `RST 3`       | 880FH   | DF           | End program                       |

**Result:** Sum = 37H stored at 890AH
## 6. Sum of Array Elements via Pointer (address & count both in memory)

**Given:** 8900H = 00H, 8901H = 8AH (array starts at 8A00H) · 8902H = element count · Result stored at 8903H

| Label     | Assembly Instruction | Memory Address | Machine Code | Comment                                        |
| --------- | -------------------- | -------------- | ------------ | ---------------------------------------------- |
|           | `LHLD 8900H`         | 8800H          | 2A           | HL ← array start address, from (8900H)/(8901H) |
|           |                      | 8801H          | 00           |                                                |
|           |                      | 8802H          | 89           |                                                |
|           | `LDA 8902H`          | 8803H          | 3A           | A ← element count                              |
|           |                      | 8804H          | 02           |                                                |
|           |                      | 8805H          | 89           |                                                |
|           | `MOV C,A`            | 8806H          | 4F           | C ← count (loop counter)                       |
|           | `XRA A`              | 8807H          | AF           | A ← 00H (sum accumulator, reset)               |
| **LOOP:** | `ADD M`              | 8808H          | 86           | A ← A + (HL), add current element              |
|           | `INX H`              | 8809H          | 23           | HL ← HL + 1, point to next element             |
|           | `DCR C`              | 880AH          | 0D           | C ← C - 1                                      |
|           | `JNZ LOOP`           | 880BH          | C2           | loop back while C ≠ 0                          |
|           |                      | 880CH          | 08           |                                                |
|           |                      | 880DH          | 88           |                                                |
|           | `STA 8903H`          | 880EH          | 32           | (8903H) ← A, store sum                         |
|           |                      | 880FH          | 03           |                                                |
|           |                      | 8810H          | 89           |                                                |
|           | `RST 3`              | 8811H          | DF           | End program                                    |

**Check:** memory 8903H should contain the sum of all elements of the array at 8A00H.

---

## 7. Sum of Array Elements as a 16-Bit Result (avoiding overflow)

**Given:** 8900H = 00H, 8901H = 8AH (array starts at 8A00H) · 8902H = element count · Result (2 bytes) stored at 8903H (low byte) and 8904H (high byte), using register pair DE as the running sum.

| Label     | Assembly Instruction | Memory Address | Machine Code | Comment                                                 |
| --------- | -------------------- | -------------- | ------------ | ------------------------------------------------------- |
|           | `LHLD 8900H`         | 8800H          | 2A           | HL ← array start address                                |
|           |                      | 8801H          | 00           |                                                         |
|           |                      | 8802H          | 89           |                                                         |
|           | `LDA 8902H`          | 8803H          | 3A           | A ← element count                                       |
|           |                      | 8804H          | 02           |                                                         |
|           |                      | 8805H          | 89           |                                                         |
|           | `MOV C,A`            | 8806H          | 4F           | C ← count (loop counter)                                |
|           | `LXI D,0000H`        | 8807H          | 11           | DE ← 0000H (16-bit sum, reset)                          |
|           |                      | 8808H          | 00           |                                                         |
|           |                      | 8809H          | 00           |                                                         |
| **LOOP:** | `MOV A,M`            | 880AH          | 7E           | A ← current element                                     |
|           | `ADD E`              | 880BH          | 83           | A ← A + E (add to low byte of sum; sets CY on overflow) |
|           | `MOV E,A`            | 880CH          | 5F           | E ← new low byte of sum                                 |
|           | `JNC SKIP`           | 880DH          | D2           | if no carry, skip incrementing high byte                |
|           |                      | 880EH          | 11           |                                                         |
|           |                      | 880FH          | 88           |                                                         |
|           | `INR D`              | 8810H          | 14           | D ← D + 1 (propagate carry into high byte)              |
| **SKIP:** | `INX H`              | 8811H          | 23           | HL ← HL + 1, point to next element                      |
|           | `DCR C`              | 8812H          | 0D           | C ← C - 1                                               |
|           | `JNZ LOOP`           | 8813H          | C2           | loop back while C ≠ 0                                   |
|           |                      | 8814H          | 0A           |                                                         |
|           |                      | 8815H          | 88           |                                                         |
|           | `MOV A,E`            | 8816H          | 7B           | A ← low byte of sum                                     |
|           | `STA 8903H`          | 8817H          | 32           | (8903H) ← low byte of sum                               |
|           |                      | 8818H          | 03           |                                                         |
|           |                      | 8819H          | 89           |                                                         |
|           | `MOV A,D`            | 881AH          | 7A           | A ← high byte of sum                                    |
|           | `STA 8904H`          | 881BH          | 32           | (8904H) ← high byte of sum                              |
|           |                      | 881CH          | 04           |                                                         |
|           |                      | 881DH          | 89           |                                                         |
|           | `RST 3`              | 881EH          | DF           | End program                                             |

**Check:** (8903H) = low byte of the sum, (8904H) = high byte of the sum — together they give the correct 16-bit total even if the sum exceeds 255.