        %include 'functions.asm'

        global _start
        section .text
_start:
        mov     ecx, 0

nextnumber:
        inc     ecx

        mov     eax, ecx
        add     eax, 48
        push    eax
        mov     eax, esp
        call    sprintlf
        pop     eax

        cmp     ecx, 10
        jne     nextnumber

        call    quit

        section .data
        section .bss
