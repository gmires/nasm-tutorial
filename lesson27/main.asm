        %include 'functions.asm'

        global _start
        section .text
_start:
        mov     ecx, 1
        mov     ebx, filename
        mov     eax, 5 ; SYS_OPEN
        int     80h

        mov     edx, 2 ; SEEK_END
        mov     ecx, 0
        mov     ebx, eax    ; file descriptor
        mov     eax, 19 ; SYS_SEEK
        int     80h

        mov     eax, content
        call    slen
        mov     edx, eax
        mov     ecx, content
        mov     ebx, ebx
        mov     eax, 4  ; SYS_WRITE
        int     80h

        call    quit

        section .data
filename    db      'readme.txt', 0h
content     db      '-updated-', 0h
        section .bss
