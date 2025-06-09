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

_connect:
        mov     edi, eax
        push    dword 0x13aab5c3 ; -- asmtutor.com 0x4227a28b
        push    word  0x5000
        push    word  2
        mov     ecx, esp
        push    byte 16
        push    ecx
        push    edi
        mov     ecx, esp
        mov     ebx, 3
        mov     eax, 102
        int     80h
        

_write:
        mov     eax, request
        call    slen
        mov     edx, eax
        mov     ecx, request
        mov     ebx, esi
        mov     eax, 4 ; SYS_WRITE
        int     80h

_read:
        mov     edx, 1
        mov     ecx, buffer
        mov     ebx, edi
        mov     eax, 3 ; SYS_READ
        int     80h

        cmp     eax, 0
        jz      _close

        mov     eax, buffer
        call    sprint
        jmp     _read

_close:
        mov     ebx, esi
        mov     eax, 6
        int     80h

_exit:
        call    quit

        section .data
;request     db 'GET / HTTP/1.1', 0Dh, 0Ah, 'Host: 139.162.39.66:80', 0Dh, 0Ah, 0Dh, 0Ah, 0h
request     db 'GET / HTTP/1.1', 0Dh, 0Ah, 'Host: 195.181.170.19:80', 0Dh, 0Ah, 0Dh, 0Ah, 0h
        section .bss
buffer  resb    1,
