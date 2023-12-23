module temps

use const_var
use flux
use flux_num

implicit none

contains
subroutine time()
	implicit none
	integer :: i
	a=0.0_rp
	! différentes a pour condition CFL selon la méthode 
	select case(choix)
		case (0) 
			do i=1, ncel
				a=max(abs(rho_O(i)),a)
			end do
			
		case (1)
			do i=1, ncel
				a=max(abs(f_prime(rho_O(i))),a)
			end do
			
		case (2)
			do i=1, ncel
				a=max(abs(rho_O(i)),a)
			end do
	end select 
	
	! calcul du pas de temps
	
	dt=CFL*dx/a !validation de la condition CFL
	dt=min(dt,tfin-date) !astuce pour ne pas dépasser tfin
	date=date+dt
	
	!calcul des flux, la valeur de choix definie le schema 
	select case(choix)
		case (0) 
			call flux_LF()
		case (1)
			call flux_Go()
		case (2)
			call flux_M_R()
	end select 
	
	! calcul de ui(n+1)
	do i=2, ncel-1
		rho_N(i)=rho_O(i)-(dt/dx)*(g(i)-g(i-1))
		
	end do
	
	!conditions limites
	select case(CL)
		case (0) ! dirichlet
			rho_N(1)=rho_O(1)
			rho_N(ncel)=rho_O(ncel)
		case (1) ! neumann
			rho_N(1)=rho_N(2)
			rho_N(ncel)=rho_N(ncel-1)
		case (2) ! periodique
			rho_N(1)=rho_O(1)-(g(1)-g(ncel-1))*dt/dx
			rho_N(ncel)=rho_N(1)
	end select
		
	!mise a jour
	rho_O(1:ncel)=rho_N(1:ncel)
	!condition de sortie de la boucle infinie
end subroutine

end module temps
