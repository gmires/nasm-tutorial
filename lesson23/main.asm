        %include 'functions.asm'

        global _start
        section .text
_start:
        mov     ecx, 0777o
        mov     ebx, filename
        mov     eax, 8
        int     80h

        push    eax ; file descriptor
        mov     eax, content
        call    slen
        mov     edx, eax
        mov     ecx, content
        pop     eax
        mov     ebx, eax
        mov     eax, 4
        int     80h

        call    quit

        section .data
filename    db      'readme.txt', 0h
content     db      'Hello World!', 0h
        section .bss
