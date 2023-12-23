# script visant à construire et renvoyer les deux images de U et rho
# calculé au temps T par notre programme

# Nom du fichier de données
nomfichier="dat/sauvegarde.dat"

# Récupérer la première ligne du fichier contenant la date T final
first_line=$(head -n 1 "$nomfichier")

# on enlève les espaces vides
first_line="${first_line// /}"
T="$first_line"

extension=".png"
chemin="images/"

rho="rho_T"
U="U_T"

# réecriture des chemins des images
nom_rho="${chemin}${rho}${T}${extension}"
nom_U="${chemin}${U}${T}${extension}"


gnuplot script_gnuplot/U.gnu
gnuplot script_gnuplot/rho.gnu


eog "$nom_rho"
eog "$nom_U"
