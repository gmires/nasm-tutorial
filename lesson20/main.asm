        %include 'functions.asm'

        global _start
        section .text
_start:
        mov     eax, 2
        int     80h

        cmp     eax, 0
        jz      child

parent:
        mov     eax, parentm
        call    sprintlf
        jmp     finish

child:
        mov     eax, childm
        call    sprintlf

finish:
        call    quit

        section .data
childm      db      'This is the child process', 0h
parentm     db      'This is the parent process', 0h
        section .bss
