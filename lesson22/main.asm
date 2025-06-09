        %include 'functions.asm'

        global _start
        section .text
_start:
        mov     ecx, 0777o
        mov     ebx, filename
        mov     eax, 8
        int     80h

        call    quit

        section .data
filename      db      'readme.txt', 0h
        section .bss
