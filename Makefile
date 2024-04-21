ASM_FILE = md5_asm
EXECUTABLE = md5_asm

AS = nasm
ASFLAGS = -f elf64

LD = ld
LDFLAGS =

RM = rm -f

OBJS = $(ASM_FILE).o

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^

$(ASM_FILE).o: $(ASM_FILE).asm
	$(AS) $(ASFLAGS) $< -o $@

clean:
	$(RM) $(OBJS) $(EXECUTABLE)


cry:
	echo "cry"

default: all
rebuild: clean all
