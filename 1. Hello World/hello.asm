
section .data
        text db "Hello, World!", 10

section .text
        global _start

_start:
        mov rax, 1    ; rax register informs which syscall to use, in this case, sys_write
        mov rdi, 1    ; rdi register informs which file descriptor to use, in this case, stdout
        mov rsi, text ; rsi register informs which buffer to use, in this case, the 'text' memory address
        mov rdx, 14   ; rdx register informs the size of the buffer, in the case of "Hello, World!" + the LF control char, 14
        syscall       ; finishes the descrition for the syscall 

        mov rax, 60   ; rax register once again informs which syscall to use, in this case, sys_exit
        mov rdi, 0    ; 
        syscall

