        %include 'functions.asm'

        global _start
        section .text
_start:
        mov     ebx, filename
        mov     eax, 10 ; SYS_UNLINK
        int     80h

        call    quit

        section .data
filename    db      'readme.txt', 0h
        section .bss
