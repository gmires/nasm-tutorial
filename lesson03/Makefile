all:main

main.o:main.asm
	nasm -felf main.asm

main:main.o
	ld -m elf_i386 main.o -o main

clean:
	rm main main.o
