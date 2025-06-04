        global _start

        section .text
_start: mov     edx, 13
        mov     ecx, msg
        mov     ebx, 1 
        mov     eax, 4
        int     80h

        ; sys_exit
        mov     ebx, 0  ; no error
        mov     eax, 1  ; sys_exit
        int     80h

        section .data
msg:    db      'Hello World', 0Ah
