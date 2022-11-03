[bits 64]

; == STALIN SORT ==
; Sorts the array by eliminating each element that is not in order
;
; ds:rsi = input array ptr (signed qwords) [clobbered, data intact]
; ds:rdi = output array ptr (signed qwords) [clobbered, data output]
; r8 = size of input array [clobbered]
; r9 = size of output array [output]
stalin_sort:
    xor r9, r9
    mov rbx, [rdi]

_do_stalin:
    ; return if reached end
    cmp r8, 0
    je _do_stalin_end

    ; read next element
    mov rax, [rsi]
    add rsi, 8
    dec r8

    ; copy element if >= last
    cmp rax, rbx
    jl _do_stalin
    mov [rdi], rax
    add rdi, 8
    inc r9

    ; remember last element
    mov rbx, rax
    jmp _do_stalin

_do_stalin_end:
    ret
