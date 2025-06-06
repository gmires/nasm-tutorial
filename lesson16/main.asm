        %include 'functions.asm'

        global _start
        section .text
_start:
        pop     ecx
        pop     edx
        sub     ecx, 1
        mov     edx, 0

nextargs:
        cmp     ecx, 0h
        jz      noargs
        pop     eax
        call    atoi
        add     edx, eax
        dec     ecx
        jmp     nextargs

noargs:
        mov     eax, edx
        call    iprintlf
        call    quit

        section .data
        section .bss
