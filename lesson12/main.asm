        %include 'functions.asm'

        global _start
        section .text
_start:
        mov     eax, 90
        mov     ebx, 9
        add     eax, ebx
        call    iprintlf

        call    quit

        section .data
        section .bss
