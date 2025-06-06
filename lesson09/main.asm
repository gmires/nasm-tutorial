        %include 'functions.asm'

        global _start
        section .text
_start:
        mov     eax, msg1
        call    sprint

        mov     edx, 255
        mov     ecx, sinput
        mov     ebx, 0
        mov     eax, 3  ; SYS_READ on kernel
        int     80h

        mov     eax, msg2
        call    sprint
        mov     eax, sinput
        call    sprint

        call    quit

        section .data
msg1:   db  'Please enter your name: ', 0h
msg2:   db  'Hello, ', 0h

        section .bss
sinput: resb    255
