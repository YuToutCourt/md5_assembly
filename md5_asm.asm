BITS 64

global _start

section .data
    msg db "Hello, world!", 10, 0
    msg_len equ $-msg

section .text

_start:
    ; write message to stdout
    mov rax, 1              ; syscall number for sys_write
    mov rdi, 1              ; file descriptor 1 (stdout)
    mov rsi, msg            ; address of the message
    mov rdx, msg_len             ; message length
    syscall


    ; exit program
    mov rdi, 0
    mov rax, 60             ; syscall number for sys_exit
    syscall
