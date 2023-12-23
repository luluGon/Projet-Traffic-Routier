reset 

set terminal png

unset key

# Style du tracé
set style line 1 lc rgb '#0074D9' lt 1 lw 2



# Récupérer les deux premiere lignes du fichier comme une variable
ligne1 = system('head -n 1 dat/sauvegarde.dat ')
ligne2 = system('sed -n "2p" dat/sauvegarde.dat') 
T = word(ligne1, 1)
f = word(ligne2, 1)


# recupération des noms associé au temps final de notre tracé
titre = sprintf("rho pour f%s à T=%s",f,T)
fichier_sortie = sprintf("images/rho_f%s_T%s.png",f,T)


# fichier de sortie
set output fichier_sortie


# Titre du graphique
set title titre

# Étiquettes des axes
set xlabel "x"

set ylabel "rho"

set yrange [0:1]

# Tracé de la courbe, on retire la première contenant le paramètre T
plot 'dat/sauvegarde.dat' every ::1 using 1:2 with lines ls 1

