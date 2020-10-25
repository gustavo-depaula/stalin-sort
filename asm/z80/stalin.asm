                ; ** stalin-sort **
                ;
                ; sort unsigned 8 bit integers with the stalin algorithm
                ; call using
                ; - hl, pointer to list of unsorted values
                ;         byte 0: number of unsorted values
                ;         bytes 1 to 1+number: unsorted values
                ; - de, pointer to list of sorted values
                ;         byte 0: number of sorted values
                ;         bytes 1 to 1+number: sorted values
                ;
                .module stalin-sort
stalinsort:
                ld  a,(hl)              ; get number of unsorted values
                or a
                ret z                   ; nothing to sort, so return
                ld b,a
                push hl                 ; preserve original pointer
                xor a                   ; zero number of values in result
                ld (de),a
_loop:
                inc hl                  ; compare next value
                cp (hl)
                jr z,_copy              ; if same as previous then copy
                cp (hl)
                jr nc,_next             ; if less than previous try next
_copy:
                inc de                  ; increment results pointer
                ld a,(hl)               ; and copy value
                ld (de),a
                ex (sp),hl              ; increment the number of results
                inc (hl)
                ex (sp),hl
_next:
                dec b                   ; are we done comparing?
                jr nz,_loop             ; no, there's more
                pop de
                ret