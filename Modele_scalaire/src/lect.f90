module lect

use const_var
implicit none

contains 
subroutine lecture()

	open(unit=19, file='dat/donnees.dat', status='unknown', action='read')
		read(19,*) xdebut
		read(19,*) xfin
		read(19,*) ncel
		read(19,*) CFL
		read(19,*) tfin
		read(19,*) choix
		read(19,*) CL
		read(19,*) choix_fonction
		close(19)
	end subroutine

end module lect
