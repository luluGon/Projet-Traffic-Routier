# Projet Traffic routier

Ce projet contient deux dossiers, l'un pour un modèle scalaire, l'autre pour un Système.

Ils sont composé de la même structure.

## Structure des Dossiers

   - **src**: Contient les fichiers source `.f90`.
   - **mod**: Contient les fichiers module `.mod` créés par la compilation.
   - **obj**: Contient les fichiers objet `.o`.
   - **script_gnuplot**: Contient les scripts Gnuplot.
   - **script_bash**: Contient les scripts Bash utilisés dans le Makefile.
   - **dat**: Contient les fichiers `.dat`.
   - **images**: Contient les images générées par la compilation.

Chaque dossier contient deux fichiers :
## Fichiers

- **makefile**: Contient les instructions de compilation.
- **exe**: Exécutable qui exécute le programme.

## Instructions de Compilation

Pour compiler le projet, utilisez le fichier `makefile` en exécutant la commande suivante dans le terminal :

```bash
make
```
Ensuite vous pouvez executer le programme par la commande :
```bash
./exe
```
Si vous possèder eog, pour créer et ouvrir les graphiques que vous voulez générer vous pouvez même utiliser la commande :
```bash
make plot
```

## Instructions de modifications

Pour changer les paramètres, vous pouvez vous rendre dans le fichier 'dat/donnees.dat', et changer les paramètre que vous souhaitez.

Dans le dossier 'Modele\_Scalaire' vous avez le choix entre plusiseurs fonctions initiales.

Pour la fonction 0:

$\rho_0(x) = 0.2 \text{ si } x<1, \quad 0.9 \text{ si } x>1$

Pour la fonction 1:

$\rho_1(x) = 0,9 \text{ si } x<1,\quad  0.25 \text{ si } x>1$

Pour la fonction 2:

$\rho_2(x) = 0,2 \text{ si } x<1, \quad 0,4 \text{ si } 1\lt x\lt 2,\quad 0,9 \text{ si } x>2$

