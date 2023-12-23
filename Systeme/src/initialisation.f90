module initialisation

use const_var
use fonctions

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
				rho(i)= 0.2_rp
			else
				rho(i)= 0.4_rp
			end if
			
			if (x<=1.0_rp) then
				U(i) = 0.9_rp
			else
				U(i) = 0.5_rp
			end if
			
		
		end do
		

		
	case default 
		write(6,*) 'Veuillez choisir une fonction initiale'
		STOP
	end select

end subroutine initial

! routine affectant les valeur de W en fonction de u et rho
subroutine affectationW()
	
	implicit none
	integer :: i
	
	do i=1, ncel
		
		Wo(1,i) = rho(i)						
		Wo(2,i) = rho(i)*(u(i) + p(rho(i)))
	end do
	
	return 
	
end subroutine affectationW

! routine réaffectant u et rho en fonction de W à chaque itération.
subroutine affectation_U_rho()

	implicit none
	integer :: i
	
	do i=1,ncel
		
		rho(i) = Wo(1,i)
		U(i) = Wo(2,i)/Wo(1,i) - p(Wo(1,i))
	end do

	return 

end subroutine affectation_U_rho

end module initialisation
