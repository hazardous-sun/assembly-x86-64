; Here is a very simple subroutine for displaying a single digit between
; 0 and 9.
;
; The digit it displays comes from the rax register.
;
; The value in the rax register is incremented by 48. If you check the 
; ASCII chart, 48 is the value of the "0" character, 48+1 is the value 
; of the "1" character and so on.
;
; The lower byte of the rax register in then moved into the memory
; address that "digit" points to.
;
; "digit" is actually defined with two bytes, being 0 and 10, a new line 
; character. Since we are only loading the lower byte of the rax register
; into "digit", it only overwrites the first byte and does not affect the 
; newline character.
;
; We then print the two bytes to the screen. This wil display the digit
; as well as the newline character, since our length is set to 2.

section .data
        digit db 0, 10

section .text
        global _start

_start:
        call _printRAXDigit
      
        ; exits
        mov rax, 60
        mov rdi, 0
        syscall

_printRAXDigit:
        ; loading the character to memory
        mov rax, 48
        add rax, 9
        mov [digit], al

        ; displaying the character 
        mov rax, 1
        mov rdi, 1 
        mov rsi, digit 
        mov rdx, 2
        syscall
        
        ret 

