%include        'functions.asm'

        global _start

        section .text
_start: 
        mov     eax, msg1
        call    sprint

        mov     eax, msg2
        call    sprint

        call    quit

        section .data
msg1:   db      'Hello, brave the World!', 0Ah, 0h
msg2:   db      'This is how we recycle in NASM.', 0Ah, 0h
