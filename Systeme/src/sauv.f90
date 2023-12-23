module sauv

use const_var
implicit none

contains
subroutine sauvegarde()

integer :: i
real(rp) ::  x
	open(unit=41, file='dat/sauvegarde.dat', status='unknown', action='write')
		
		write(41,*) Tfin
		do i=1, ncel
			x=xdebut+i*(xfin-xdebut)/ncel
			write(41,*)  x, rho(i) ,u(i)
		end do
	close(41)
end subroutine
end module sauv
