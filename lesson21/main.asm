        %include 'functions.asm'

        global _start
        section .text
_start:
        mov     eax, msg
        call    sprint

        mov     eax, 13
        int     80h
        call    iprintlf

        call    quit

        section .data
msg      db      'Second since Jan 01 1970: ', 0h
        section .bss
