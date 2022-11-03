[bits 64]

jmp _start

%define input_len 11
input: dq 1, 2, 4, 3, 6, 5, 4, 3, 9, 6, 8
; expected output: 1, 2, 4, 6, 9

_start:
    ; call stalin
    mov rsi, input
    sub rsp, input_len * 8
    mov rdi, rsp
    push rdi
    mov r8, input_len
    call stalin_sort
    pop rbx

    ; print elements
    mov rax, 1 ; sys_write
    mov rdx, 1 ; count
    mov rdi, 1 ; output
    push byte 0 ; single-byte buffer
    mov rsi, rsp
.print_loop:
    cmp r9, 0
    je .print_end
    mov cl, byte [rbx]
    mov byte [rsp], cl ; byte to digit (single digits only :<)
    add byte [rsp], '0'
    add rbx, 8
    dec r9
    syscall
    mov byte [rsp], ' '
    syscall
    jmp .print_loop

.print_end:
    ; exit
    mov rax, 60
    xor rdi, rdi
    syscall

%include "stalin-sort.asm"
