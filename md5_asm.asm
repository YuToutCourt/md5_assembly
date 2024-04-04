%include "headers.s"

BITS 64

global _start

section .data
    prompt db "input: ", 0
    len equ $-prompt
    buff db 100 dup(0)

section .text

_start: 


    sub rsp, 800

    push QWORD[prompt]
    push len
    
    call write_message
    

    ; read input from stdin
    mov rax, 0              ; syscall number for sys_read
    mov rdi, 0              ; file descriptor 0 (stdin)
    lea rsi, [buff]         ; adresse du tampon d'entrée
    mov rdx, 100            ; longueur maximale à lire
    syscall

    mov r13, buff
    call write_message

    ; exit program
    mov r12, 100
    mov rdi, 0
    mov rax, 60             ; syscall number for sys_exit
    syscall



write_message:
    ; Arguments pour l'appel système write :
    ; rdi = file descriptor (STDOUT = 1)
    ; rsi = adresse du message à afficher
    ; rdx = longueur du message

    mov rsi, rsp ; Longueur du message 
    add rsi, 16
    lea rsi, [rsi]

    mov rdi, 1         ; STDOUT
    ;mov rsi, r13       ; Adresse du message
    ;mov rdx, r12       ; Longueur du message
    mov rax, 1         ; Code pour l'appel système write
    syscall            ; Appel système

    ret                ; Retour de la fonction

