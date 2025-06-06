        %include 'functions.asm'

        global _start
        section .text
_start:
        mov     ecx, 0
        pop     ecx
        pop     eax
        dec     ecx
        mov     eax, 0 ; remove program path

;nextarg:
;        cmp     ecx, 0
;        je      noargs
;        pop     eax
;        call    sprintlf
;        dec     ecx
;        jmp     nextarg

;noargs:
;        call    quit

        mov     edx, environment
        mov     ecx, [esp + ecx - 1]
        mov     ebx, command
        mov     eax, 11
        int     80h

        call    quit

        section .data
command     db  '/bin/echo', 0h
arg1        db  'Hello World!', 0h
arguments   dd  command
            dd  arg1
            dd  0h
environment dd  0h

        section .bss
