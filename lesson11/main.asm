        %include 'functions.asm'

        global _start
        section .text
_start:
        mov     ecx, 0

nextnumber:
        inc     ecx
        mov     eax, ecx
        call    iprintlf
        cmp     ecx, 10
        jne     nextnumber

        call    quit

        section .data
        section .bss
