module sauv

use const_var
implicit none

contains

! subroutine sauvergardant les valeur de rho à T final
subroutine sauvegarde()

integer :: i
real(rp) ::  x
	open(unit=41, file='dat/sauvegarde.dat', status='unknown', action='write')
	
		write(41,*) Tfin
		write(41,*) choix_fonction
		do i=1, ncel
			x=xdebut+i*(xfin-xdebut)/ncel
			write(41,*)  x, rho_O(i)
		end do
	close(41)
end subroutine
end module sauv
