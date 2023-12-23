module flux_num
use const_var
use flux
contains


subroutine flux_LF()
	implicit none
	integer :: i
	
	!methode de lax-fredrich
	do i=1, ncel-1
		g(i)=demi*(f(rho_o(i)+rho_o(i+1))-(rho_o(i+1)-rho_o(i))*dx/dt)
	end do
	
	return
end subroutine flux_LF


subroutine flux_Go() 
	implicit none
	real(rp) :: sigma
	integer :: i
	
	!méthode de Godunov
	do i=1, ncel-1
		if (rho_o(i)==rho_o(i+1)) then
			g(i)=f(rho_o(i))
		
		else if (rho_o(i)>rho_o(i+1)) then 					! détente ici f concave
		
			if (f_prime(rho_o(i))>zero ) then 
				g(i)=f(rho_o(i))
			else if (f_prime(rho_o(i+1))<-zero ) then
				g(i)=f(rho_o(i+1))
			else 
				g(i)=f(inverse_f_prime(0.0_rp))
			end if
			
		else 								! choc ici f concave
		
			sigma= (f(rho_o(i+1))-f(rho_o(i)))/(rho_o(i+1) -rho_o(i))
			if (sigma >zero) then 
				g(i)=f(rho_o(i))
			else if (sigma <-zero) then
				g(i)=f(rho_o(i+1))
			else 
				g(i)=f(rho_o(i))
			end if

		
		end if
		
	end do
	
	return
	
end subroutine flux_Go


!definition de la vitesse a porho_r le schèma de Morman-Roe
real(rp) function a_MR(rho_l,rho_r)
	implicit none
	real(rp), intent(in) :: rho_l, rho_r
	
	if (abs(rho_l-rho_r)<zero) then
		a_MR=f_prime(rho_l)	
	else 
		a_MR=(f(rho_l)-f(rho_r))/(rho_l-rho_r)
	end if
	return 
end function a_MR
	
	
subroutine flux_M_R()
	implicit none
	real(rp) :: rho_l,rho_r
	integer :: i
	
	!methode de Morman-Roe
	do i=1, ncel-1
		rho_l = rho_o(i)
		rho_r = rho_o(i+1)
		
		g(i)=demi*(f(rho_l)+f(rho_r)-abs(a_MR(rho_l,rho_r))*(rho_r-rho_l))
	end do
	
	return
end subroutine flux_M_R

end module flux_num
