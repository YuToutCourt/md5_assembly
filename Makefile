# Nom du fichier assembleur (sans l'extension)
ASM_FILE = md5_asm

# Nom du fichier exécutable (sans l'extension)
EXECUTABLE = md5_asm

# Compilateur assembleur
AS = nasm

# Options pour le compilateur assembleur
ASFLAGS = -f elf64

# Liens
LD = ld
LDFLAGS =

# Commande pour nettoyer les fichiers temporaires
RM = rm -f

# Liste des fichiers objets
OBJS = $(ASM_FILE).o

# Règles de compilation
all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^

$(ASM_FILE).o: $(ASM_FILE).asm
	$(AS) $(ASFLAGS) $< -o $@

# Règle pour nettoyer les fichiers temporaires
clean:
	$(RM) $(OBJS) $(EXECUTABLE)

# Commande pour lancer la compilation par défaut
default: all

# Commande pour nettoyer puis compiler
rebuild: clean all
