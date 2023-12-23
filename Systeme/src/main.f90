program transport

! appel des modules
use const_var
use initialisation
use fonctions
use sauv
use lect
use flux_num
use flux
use temps

implicit none

! lecture des données du fichier donnees.dat
call lecture()					

! allocation des tableaux
allocate(WO(2,1:ncel), WN(2,1:ncel),U(1:ncel), rho(1:ncel), G(2,1:ncel-1) )	

! initialisation U et rho
call initial()					

! initialisation date
date = 0.0_rp					

! création du pas dx
dx=(xfin-xdebut)/ncel				


! creation W en fonction de rho et U
call affectationW()

Wn(:,:) = Wo(:,:)

! boucle en temps
do					
	

	
	! appel de la subroutine time, calculant les Wn à chaque date
	call time()				
	
	! condition d'arrêt de la boucle
	if (date>=tfin) exit			
end do

! re - affectation de u et rho
call affectation_U_rho()


! ecriture de U et rho dans le fichier sauvergarde.dat
call sauvegarde()				

! libération de la mémoire
deallocate(WO, WN,U,rho, G)				

end program transport
