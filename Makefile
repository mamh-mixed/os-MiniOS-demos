NASM_FORMAT_BIN=bin
NASM_FORMAT_ELF=elf

define clean
	@rm -rf bin/*.bin obj/*.o
endef

# nasm(format, dest, origin)
define nasm
	@nasm -f $(1) -o $(2)  $(3)
endef

# gcc(-On, dest, origin)
define gcc
	@gcc -O$(1) -m32 -I inc -c -Wno-builtin-declaration-mismatch -Wno-strict-aliasing -fno-stack-protector -finput-charset=UTF-8 -o $(2) $(3)
endef

# ld(entryName, entryAddr, dest, origin)
define ld
	@ld -m elf_i386 -e $(1) -Ttext $(2) -o $(3) $(4)
endef


mbr : src/mbr.asm inc/const.asm Makefile
	$(call nasm,$(NASM_FORMAT_BIN),bin/mbr.bin,src/mbr.asm)

clean : Makefile
	$(call clean)

kernel : src/kernel.c Makefile
	@make util
	$(call gcc,0,obj/kernel.o,src/kernel.c)
	$(call gcc,0,obj/string.o,src/string.c)
	$(call gcc,0,obj/stdlib.o,src/stdlib.c)
	$(call nasm,$(NASM_FORMAT_ELF),obj/interrupt.o,src/interrupt.asm)
	$(call ld,main,0x80100000,bin/kernel.bin,obj/asm_util.o obj/c_util.o obj/string.o obj/stdlib.o obj/interrupt.o obj/kernel.o)

loader : src/loader.asm inc/const.asm Makefile
	$(call nasm,$(NASM_FORMAT_BIN),bin/loader.bin,src/loader.asm)


util : src/util.asm src/util.c inc/util.h Makefile
	$(call gcc,0,obj/c_util.o,src/util.c)
	$(call nasm,$(NASM_FORMAT_ELF),obj/asm_util.o,src/util.asm)


all : Makefile
	@make clean mbr loader kernel