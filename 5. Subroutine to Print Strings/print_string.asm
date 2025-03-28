section .data
        text db "Hello, World!", 10, 0
        text2 db "World?", 10, 0
        text3 db "ANTEDEGUEMON roberto carlos Voldemort 1234567890 da Fonseca _!", 10, 0

section .text
        global _start

_start:
        mov rax, text 
        call _print

        mov rax, text2
        call _print

        mov rax, text3 
        call _print 

        mov rax, 60
        mov rdi, 0
        syscall

; input: rax as pointer to string 
; output: print string at rax 
_print:
        push rax 
        mov rbx, 0
        
_printLoop:
        inc rax 
        inc rbx
        mov cl, [rax]
        cmp cl, 0
        jne _printLoop 
        
        ; print 
        mov rax, 1    ; sys_print
        mov rdi, 1    ; stdout
        pop rsi       ; text to print that was stored in the stack 
        mov rdx, rbx  ; length that was stored in rbx
        syscall 
        
        ret
