default:
	make img

ipl.bin: ipl.asm Makefile
	nasm ipl.asm -o ipl.bin -l ipl.lst

asmhead.bin: asmhead.asm Makefile
	nasm asmhead.asm -o asmhead.bin -l asmhead.lst

nasmfunc.o: nasmfunc.asm Makefile
	nasm -g -f elf nasmfunc.asm -o nasmfunc.o

bootpack.hrb: bootpack.c har.ld nasmfunc.o Makefile
	gcc -fno-pie -no-pie -march=i486 -m32 -nostdlib -T har.ld -g hankaku.c bootpack.c dsctbl.c graphic.c mysprintf.c int.c fifo.c nasmfunc.o -o bootpack.hrb

haribote.sys: asmhead.bin bootpack.hrb Makefile
	cat asmhead.bin bootpack.hrb > haribote.sys

haribote.img: ipl.bin haribote.sys Makefile
	mformat -f 1440 -C -B ipl.bin -i haribote.img ::
	mcopy haribote.sys -i haribote.img ::

asm:
	make -r ipl.bin

img:
	make -r haribote.img

run:
	make img
	qemu-system-i386 -drive file=haribote.img,format=raw,if=floppy

clean:
	rm *.lst *.bin *.sys *.img *.hrb *.o
