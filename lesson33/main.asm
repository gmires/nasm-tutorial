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

_bind:
        mov     edi, eax ; socket descriptor
        push    dword   0x00000000 ; bind IPPROTO_TCP
        push    word    0x2923 ; bind port 9001 reverse
        push    word 2 ; AF_INET into stack
        mov     ecx, esp ; address of stack in ecx params
        push    byte 16 ; argument length
        push    ecx ; push the addres of the argument
        push    edi ; push socket descriptor
        mov     ecx, esp
        mov     ebx, 2 ; subroutine BIND
        mov     eax, 102 ; SYS_SOCKETCALL
        int     80h

_listen:
        push    byte 1
        push    edi
        mov     ecx, esp
        mov     ebx, 4 ; LISTEN
mov     eax, 102 ; SYS_SOCKETCALL
        int     80h

_accept:
        push    byte 0
        push    byte 0
        push    edi ; 
        mov     ecx, esp
        mov     ebx, 5 ; ACCEPT 
        mov     eax, 102
        int     80h

_fork:
        mov     esi, eax ; return of SYS_SOCKETCALL
        mov     eax, 2 ; invoke sys_fork
        int     80h

        cmp     eax, 0
        jz      _read

        jmp     _accept

_read:
        mov     edx, 255
        mov     ecx, buffer
        mov     ebx, esi
        mov     eax, 3 ; SYS_READ
        int     80h

        mov     eax, buffer
        call    sprintlf

_exit:
        call    quit

        section .data
        section .bss
buffer  resb    255,
