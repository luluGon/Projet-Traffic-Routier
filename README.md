# Projet Équation de transport

Ce projet contient deux dossiers, l'un pour un modèle scalaire, l'autre pour un Système.

Ils sont composé de la même structure.

## Structure des Dossiers

1. **Modèle Scalaire**

   - **src**: Contient les fichiers source `.f90`.
   - **mod**: Contient les fichiers module `.mod` créés par la compilation.
   - **obj**: Contient les fichiers objet `.o`.
   - **script_gnuplot**: Contient les scripts Gnuplot.
   - **script_bash**: Contient les scripts Bash utilisés dans le Makefile.
   - **dat**: Contient les fichiers `.dat`.
   - **images**: Contient les images générées par la compilation.

2. **Systeme**

   - **src**: Contient les fichiers source `.f90`.
   - **mod**: Contient les fichiers module `.mod` créés par la compilation.
   - **obj**: Contient les fichiers objet `.o`.
   - **script_gnuplot**: Contient les scripts Gnuplot.
   - **script_bash**: Contient les scripts Bash utilisés dans le Makefile.
   - **dat**: Contient les fichiers `.dat`.
   - **images**: Contient les images générées par la compilation.

## Fichiers

- **makefile**: Contient les instructions de compilation.
- **exe**: Exécutable qui exécute le programme.

## Instructions de Compilation

Pour compiler le projet, utilisez le fichier `makefile` en exécutant la commande suivante dans le terminal :

```bash
make
