        global _start

        section .text
_start: 
        mov     ebx, msg
        mov     eax, ebx

nextchar:
        cmp     byte [eax],0
        jz      finished
        inc     eax
        jmp     nextchar

finished:
        sub     eax, ebx

        ; print 
        mov     edx, eax ; size of msg
        mov     ecx, msg
        mov     ebx, 1
        mov     eax, 4
        int     80h

        ; sys_exit
        mov     ebx, 0  ; no error
        mov     eax, 1  ; sys_exit
        int     80h

        section .data
msg:    db      'Hello, brave the World', 0Ah
