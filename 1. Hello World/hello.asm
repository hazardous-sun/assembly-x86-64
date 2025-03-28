/*
All x86_64 assembly files have three sections, the ".data" section, the ".bss" section, and the ".text" section.
*/
section .data
        text db "Hello, World!", 10 ; passes "Hello, World!" plus the LF control char to a space of memory and sets 'text' as the reference to it

section .text
        global _start

_start:
        mov rax, 1    ; rax register informs which syscall to use, in this case, sys_write
        mov rdi, 1    ; rdi register informs which file descriptor to use, in this case, stdout
        mov rsi, text ; rsi register informs which buffer to use, in this case, the 'text' memory address
        mov rdx, 14   ; rdx register informs the size of the buffer, in the case of "Hello, World!" + the LF control char, 14
        syscall       ; finishes the description for the syscall 

        mov rax, 60   ; rax register once again informs which syscall to use, in this case, sys_exit
        mov rdi, 0    ; rdi informs the error code (by convention, 0 means there was no error)
        syscall       ; finishes the description for the syscall

