all: kernel boot

kernel: kernel.c
	gcc -ffreestanding -c kernel.c -o kernel.o
	ld  -o kernel.bin -Ttext 0x1000 kernel.o --oformat binary

boot: boot.asm
	nasm boot.asm
	qemu-system-i386 boot
