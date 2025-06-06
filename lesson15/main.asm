        %include 'functions.asm'

        global _start
        section .text
_start:
        mov     eax, 90
        mov     ebx, 9
        div     ebx
        call    iprint
        mov     eax, msg
        call    sprint
        mov     eax, edx
        call    iprintlf

        call    quit

        section .data
msg:    db  ' reminder '
        section .bss
