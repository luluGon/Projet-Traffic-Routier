program transport

! appel des modules
use const_var
use initialisation
use sauv
use lect
use flux_num
use flux
use temps

implicit none


call lecture()					! lecture des données du fichier donnees.dat


allocate(rho_O(1:ncel), rho_N(1:ncel), g(1:ncel-1))	! allocation des tableaux


call initial()					! initialisation rho_O


date = 0.0_rp					! initialisation date


dx=(xfin-xdebut)/ncel				! création du pas dx


do						! boucle en temps

	
	call time()				! appel de la subroutine time, calculant les rho_N à chaque date
	
	
	if (date>=tfin) exit			! condition d'arrêt de la boucle
end do

call sauvegarde()				! ecriture de notre rho_N dans le fichier sauvergarde.dat


deallocate(rho_O, rho_N, g)				! libération de la mémoire

end program transport
