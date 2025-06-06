        %include 'functions.asm'

        global _start
        section .text
_start:

subroutineOne:
        mov     eax, msg1
        call    sprintlf
        jmp     .finished

.finished:
        mov     eax, msg2
        call    sprint
        mov     eax, 1
        call    iprintlf

subroutineTwo:
        mov     eax, msg1
        call    sprintlf
        jmp     .finished

.finished:
        mov     eax, msg2
        call    sprint
        mov     eax, 2
        call    iprintlf

        mov     eax, msg1
        call    sprintlf
        jmp     finished      

finished:
        mov     eax, msg3
        call    sprintlf
        call    quit

        section .data
msg1:   db      'Jumping to finished label.', 0h
msg2:   db      'Inside subroutine number: ', 0h
msg3:   db      'Inside subroutine "finished".', 0h
        section .bss
