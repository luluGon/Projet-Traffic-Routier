module lect

use const_var
implicit none

contains 
subroutine lecture()

	open(unit=54, file='dat/donnees.dat', status='unknown', action='read')
		read(54,*) xdebut
		read(54,*) xfin
		read(54,*) ncel
		read(54,*) rhomax
		read(54,*) Vmax
		read(54,*) CFL
		read(54,*) tfin
		read(54,*) choix
		read(54,*) CL
		read(54,*) choix_fonction
		close(54)
	end subroutine

end module lect
