reset 

set terminal png

unset key

# Style du tracé
set style line 1 lc rgb '#0074D9' lt 1 lw 2

# Fonction pour récupérer la première ligne du fichier
recup_ligne1(nomfic) = system('head -n 1 '.nomfic)

nom_fichier = 'dat/sauvegarde.dat'


# Récupérer la première ligne du fichier comme une variable
ligne1 = recup_ligne1(nom_fichier)
T = word(ligne1, 1)

# recupération des noms associé au temps final de notre tracé
titre = sprintf("rho à T=%s",T)
fichier_sortie = sprintf("images/rho_T%s.png",T)


# fichier de sortie
set output fichier_sortie


# Titre du graphique
set title titre

# Étiquettes des axes
set xlabel "x"

set ylabel "rho"

set yrange [0:1]

# Tracé de la courbe, on retire la première contenant le paramètre T
plot nom_fichier every ::1 using 1:2 with lines ls 1

