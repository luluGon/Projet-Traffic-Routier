/usepackage{amsath}
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

Dans le dossier 'Modele\_Scalaire' vous avez le choix entre plusiseurs fonctions de bases.

Pour la fonction 0:

$\rho_0(x) = \left\{\begin{align*} 0 & \text{si } x < 1 \\ 1 & \text{si } 1 < x < 2 \end{align}\right.$



