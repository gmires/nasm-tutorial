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

        mov     ecx, 0
        mov     ebx, filename
        mov     eax, 5
        int     80h

        mov     edx, 12
        mov     ecx, contread
        mov     ebx, eax
        mov     eax, 3
        int     80h

        mov     eax, contread
        call    sprintlf

        mov     ebx, ebx ; close file descriptor
        mov     eax, 6
        int     80h

        call    quit

        section .data
filename    db      'readme.txt', 0h
content     db      'Hello World!', 0h
        section .bss
contread    resb    255
