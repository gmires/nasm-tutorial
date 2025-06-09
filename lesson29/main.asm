        %include 'functions.asm'

        global _start
        section .text
_start:
        xor     eax, eax
        xor     ebx, ebx
        xor     esi, esi
        xor     edi, edi

_socket:
        push    byte 6  ; 6 byte onto the stack (IPPROTO_TCP)
        push    byte 1  ; 6 byte onto the stack (SOCK_STREAM)
        push    byte 2  ; 6 byte onto the stack (PF_INET)
        mov     ecx, esp ; move stack poiter address arguments
        mov     ebx, 1   ; SOCKET subroutine
        mov     eax, 102 ; SYS_SOCKETCALL        
        int     80h

        call    iprintlf

_exit:
        call    quit

        section .data
        section .bss
