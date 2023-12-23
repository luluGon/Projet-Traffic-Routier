module temps

use const_var
use fonctions
use initialisation
use flux
use flux_num

implicit none

contains
subroutine time()
	implicit none
	integer :: i
	
	
	! calcul de a selon le schèma
	a=0.0_rp
	do i=1,ncel-1
		a = max(a,max_vp(Wo(1,i),-p(Wo(1,i))+Wo(2,i)/Wo(1,i)))
	end do
	
	
	! calcul du pas de temps
	
	dt=CFL*dx/a !validation de la condition CFL
	dt=min(dt,tfin-date) !astuce pour ne pas dépasser tfin
	date=date+dt
	

	!calcul des flux
	
	call flux_Rusanov()
	
	! calcul de ui(n+1)
	do i=2, ncel-1
	
		Wn(1,i) = Wo(1,i) - ( G(1,i) - G(1,i-1) )*dt/dx
		Wn(2,i) = Wo(2,i) - ( G(2,i) - G(2,i-1) )*dt/dx
		
	end do
	
	!conditions limites
	select case(CL)
		case (0) ! dirichlet
			Wn(:,1) = Wo(:,1)
			Wn(:,ncel) = Wo(:,ncel)
		case (1) ! neumann
			Wn(:,1) = Wn(:,2)
			Wn(:,ncel) = Wn(:,ncel-1)
		case (2) ! periodique
			Wn(1,1) = Wo(1,1)-(G(1,1)-G(1,ncel-1))*dt/dx
			Wn(2,1) = Wo(2,1)-(G(2,1)-G(2,ncel-1))*dt/dx
			Wn(:,ncel) = Wn(:,1)
	end select
		
	!mise a jour
	Wo(:,1:ncel) = Wn(:,1:ncel)
	!condition de sortie de la boucle infinie
end subroutine

end module temps
