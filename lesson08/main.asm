        %include 'functions.asm'

        global _start
        section .text
_start:
        pop     ecx

nextarg:
        cmp     ecx, 0h
        jz      noargs
        pop     eax
        call    sprintlf
        dec     ecx
        jmp     nextarg


noargs:
        call    quit
