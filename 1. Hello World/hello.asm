/*
All x86_64 assembly files have three sections, the ".data" section, the ".bss" section, and the ".text" section.

  1. The ".data" is the section of all the (guess what) DATA of the application is defined befor compilation.
  2. The ".bss" section is where data is allocated for future use
  3. The ".text" section is where the actual code goes.
*/
section .data
        text db "Hello, World!", 10 ; passes "Hello, World!" plus the LF control char to a space of memory and sets 'text' as the reference to it

section .text
        global _start

/*
Assembly files also support "labels". A label is used to (guess one more time) LABEL a part of the code.

Upon compilation, the compiler will calculate the location in which the label sit in memory.

Any time the name of the label is used afterwards, that name is replaced by the location in memory by the compiler.
*/
_start:
        mov rax, 1    ; rax register informs which syscall to use, in this case, sys_write
        mov rdi, 1    ; rdi register informs which file descriptor to use, in this case, stdout
        mov rsi, text ; rsi register informs which buffer to use, in this case, the 'text' memory address
        mov rdx, 14   ; rdx register informs the size of the buffer, in the case of "Hello, World!" + the LF control char, 14
        syscall       ; finishes the description for the syscall 

        mov rax, 60   ; rax register once again informs which syscall to use, in this case, sys_exit
        mov rdi, 0    ; rdi informs the error code (by convention, 0 means there was no error)
        syscall       ; finishes the description for the syscall

