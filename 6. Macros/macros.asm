STDIN equ 0
STDOUT equ 1
STDERR equ 2

SYS_READ equ 0
SYS_WRITE equ 1
SYS_EXIT equ 60

section _data
    text db "Hello, World!", 10
section .text
    global _start

; Macro that calls the sys_write function to print the value of text to the standard output
%macro printHelloWorld 0
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, text
    mov rdx, 14
    syscall
%endmacro

%macro exit 0
    mov rax, SYS_EXIT
    mov rdi, 0
    syscall
%endmacro
_start:
    printHelloWorld
    printHelloWorld
    printHelloWorld
    exit
