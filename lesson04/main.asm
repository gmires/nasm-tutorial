        global _start

        section .text
_start: 
        mov     eax, msg
        call    strlen

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

strlen:
        push    ebx
        mov     ebx, eax

nextchar:
        cmp     byte [eax],0
        jz      finished
        inc     eax
        jmp     nextchar

finished:
        sub     eax, ebx
        pop     ebx
        ret

        section .data
msg:    db      'Hello, brave the World', 0Ah
