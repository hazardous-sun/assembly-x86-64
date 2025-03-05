section _data
    text db "Hello, World!", 10
section .text
    global _start

; Macro that calls the sys_write function to print the value of text to the standard output
%macro printHelloWorld 0
    mov rax, 1
    mov rdi, 1
    mov rsi, text
    mov rdx, 14
    syscall
%endmacro

%macro exit 0
    mov rax, 60
    mov rdi, 0
    syscall
%endmacro
_start:
    printHelloWorld
    printHelloWorld
    printHelloWorld
    exit
