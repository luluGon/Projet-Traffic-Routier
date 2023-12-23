module initialisation

use const_var
implicit none 

contains

subroutine initial()
	implicit none
	integer :: i
	real(rp) :: x
	select case (choix_fonction)
	
	case (0)
		do i=1, ncel
			x=xdebut+i*(xfin-xdebut)/ncel
			if (x<=1.0_rp) then
				rho_O(i)=0.0_rp
			elseif (1.0_rp<x .and. x<=2.0_rp) then
				rho_O(i)=1.0_rp
			elseif (x>2.0_rp) then
				rho_O(i)=0.0_rp
			end if
		end do
	
	case (1) 
		do i=1, ncel
			x=xdebut+i*(xfin-xdebut)/ncel
			if (x<=1.0_rp) then
				rho_O(i)=1.0_rp
			elseif (1.0_rp<x .and. x<=2.0_rp) then
				rho_O(i)=0.25_rp
			elseif (x>2.0_rp) then
				rho_O(i)=0.0_rp
			end if
		end do
	
	case (2) 
		do i=1, ncel
			x=xdebut+i*(xfin-xdebut)/ncel
			if (x<=1.0_rp) then
				rho_O(i)=0.2_rp
			elseif (1.0_rp<x .and. x<=2.0_rp) then
				rho_O(i)=0.4_rp
			elseif (x>2.0_rp) then
				rho_O(i)=0.9_rp
			end if
		end do
	case default 
		write(6,*) 'Veuillez choisir une fonction initiale'
		STOP
	end select

end subroutine initial


end module initialisation
