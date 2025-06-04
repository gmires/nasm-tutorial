%include        'functions.asm'

        global _start

        section .text
_start: 
        mov     eax, msg1
        call    sprintlf

        mov     eax, msg2
        call    sprintlf

        call    quit

        section .data
msg1:   db      'Hello, brave the World!', 0h
msg2:   db      'This is how we recycle in NASM.', 0h
