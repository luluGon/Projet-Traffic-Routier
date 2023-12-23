#!/bin/bash

# script visant à construire et renvoyer les deux images de U et rho
# calculé au temps T par notre programme

# Nom du fichier de données
nomfichier="dat/sauvegarde.dat"

# Récupérer la première ligne contenant T final
first_line=$(head -n 1 "$nomfichier")
second_line=$(awk 'NR==2' "$nomfichier")

# on enlève les espaces vides
first_line="${first_line// /}"
second_line="${second_line// /}"
T="$first_line"
f="$second_line"


extension=".png"
chemin="images/"

rho="rho"


# réecriture du chemin de l'image
nom_rho="${chemin}${rho}_f${f}_T${T}${extension}"

# trace rho au temps T avec le script gnuplot
gnuplot script_gnuplot/rho.gnu

# ouvre l'image correspondante
eog "$nom_rho"

