                ; CP/M 2.2 utility to sort uint8 numbers
                ;
bdos            .equ $05                ; bdos vector
conout          .equ $02                ; console output function
writestr        .equ $09                ; output string function
cmdtail         .equ $80                ; location of the ccp command tail
                                        ; byte 0: length of tail
                                        ; bytes 1 to 1+length: command tail
bufsize         .equ $40                ; sort buffer size
stksize         .equ $40                ; working stack size

                .org $100

                ld (stksave),sp         ; set our stack (and save old one)
                ld sp,stack
                ld a,(cmdtail)          ; check number of characters in command tail
                or a
                jp z,done               ; none, so we're done
                ld hl,buf               ; pointer to buffer for parsed values 
                push hl
                ld de,cmdtail+1         ; pointer to first character in command tail
skipspace:
                ld a,(de)               ; get next character
                or a                    ; is it zero?
                jr z,sort               ; yes, we're done parsing the command tail
                cp ' '                  ; is it a space?
                jr nz,parseval          ; no, try parsing as a numeric value
                inc de                  ; yes, try next character
                jr skipspace
parseval:
                ld hl,0                 ; use hl to store the parsed value
                ld b,h                  ; use b to count the number of digits
parsechr:
                cp '0'                  ; do we have an ascii character less than '0'?
                jr c,cont               ; yes, we're done parsing 
                cp ':'                  ; is a non-digit ascii character
                jr nc,qhow              ; yes, bail out
                inc b                   ; increment number of digits
                push bc
                ld b,h                  ; new value is 10*hl+(new digit)
                ld c,l                  ; where multiply is done by shift and add
                add hl,hl
                add hl,hl
                add hl,bc
                add hl,hl
                and $0f                 ; and (digit) by stripping the the ascii code
                add a,l
                ld l,a
                ld a,0
                adc a,h                 ; check if value is now greater than 255
                or a
                jr nz,qhow              ; yes, bail out because it's not an 8 bit integer
                pop bc
                inc de                  ; get next character from command tail
                ld a,(de)
                jr parsechr             ; and parse
cont:
                ld a,b                  ; check the number of digits in our value
                or a
                jr z,qhow               ; none, so bail out
                ld a,l                  ; copy value to our buffer
                pop hl
                inc hl
                ld (hl),a
                push hl
                ld hl,buf
                inc (hl)                ; increment the number of values in our buffer
                jr skipspace            ; and try the next argument in command tail
sort:
                ld hl,buf               ; set up to sort in place 
                ld de,buf
                call stalinsort         ; and sort
                ld a,(de)               ; get number of sorted values
                ld b,a
prtlist:
                inc de                  ; get next value from sorted list
                ld a,(de)
                ld h,0
                ld l,a
                push bc
                push de
                call prtdec             ; and print as decimal
                pop de
                pop bc
                dec b                   ; are there any values left to write
                jr z,done               ; no, all done
                ld a,' '                ; output space
                call prtchr
                jr prtlist              ; followed by next value       
prtdec:
                ld e,'0'                ; output value as decimal number
                ld bc,-100              ; process 100s digit
                call prtdigit
                ld c,-10                ; process 10s digit
                call prtdigit
                ld e,0
                ld c,-1                
prtdigit:
                ld a,'0'-1              ; process digit
incdgt:
                inc a                   ; convert to ascii digit
                add hl,bc
                jr c,incdgt
                sbc hl,bc
                cp e                    ; is it a leading zero?
                ret z                   ; yes, skip digit
                call prtchr
                ret
prtchr:
                push bc                 ; save registers
                push de
                push hl                
                ld e,a                  ; write ascii character
                ld c,conout
                call bdos
                pop hl                  ; restore registers
                pop de
                pop bc
                ret
qhow:
                ld de,how               ; output 'how?' error message
                ld c,writestr
                call bdos
done:
                ld sp,(stksave)         ; restore stack
                ret                     ; and return to CP/M without restart

                .include "stalin.asm"

how             .db "how?$"
buf             .dw 0
                .fill bufsize,0
stksave         .dw 0
                .fill stksize,0
stack           .equ $

                .end
