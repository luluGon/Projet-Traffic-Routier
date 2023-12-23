# Variables
FC := gfortran
SRCDIR := src
OBJDIR := obj
MODDIR := mod
SRC := $(SRCDIR)/const_var.f90 $(SRCDIR)/fonctions.f90 $(SRCDIR)/initialisation.f90 $(SRCDIR)/lect.f90 $(SRCDIR)/sauv.f90 $(SRCDIR)/flux.f90 $(SRCDIR)/flux_num.f90 $(SRCDIR)/temps.f90 $(SRCDIR)/main.f90
OBJ := $(patsubst $(SRCDIR)/%.f90,$(OBJDIR)/%.o,$(SRC))
EXE := exe

# Flags de compilation
FCFLAGS :=  -O0
MODFLAGS := -J$(MODDIR)

# Règle de construction du programme
all: $(EXE)

# Règle pour générer l'exécutable
$(EXE): $(OBJ)
	$(FC) $(FCFLAGS)  $^ -o $@

# Règle générique pour la compilation des fichiers source en fichiers objets
$(OBJDIR)/%.o: $(SRCDIR)/%.f90
	@mkdir -p $(@D)
	$(FC) $(FCFLAGS) $(MODFLAGS) -c $< -o $@

$(shell mkdir -p $(MODDIR))

# Nettoyer les fichiers objets et l'exécutable
clean:
	rm -rf $(OBJDIR)/*.o $(MODDIR)/*.mod $(EXE)
	
run: $(EXE)
	./$(EXE)

plot: 
	bash script_bash/plot_U_rho.sh
	
.PHONY: all clean run plot
	
	
