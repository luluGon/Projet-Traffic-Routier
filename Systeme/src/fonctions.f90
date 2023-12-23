module fonctions


use const_var

contains

! fonction p décrivant le comportement des usagers en focntion de la densité de voiture
real(rp) function p(rho_var)
	implicit none
	real(rp), intent(in) :: rho_var
	
	!p = Vmax*rho_var*rho_var/rhomax
	p=rho_var
	return 
	
end function p

real(rp) function p_prime(rho_var)

	implicit none
	
	real(rp), intent(in) :: rho_var
	
	!p_prime = 2.0_rp *Vmax*rho_var/rhomax
	p_prime = 1.0_rp
	return
	
end function p_prime

! premiere valeur propre
real(rp) function lambda1(rho_var,u_var)

	implicit none
	
	real(rp), intent(in) :: rho_var, u_var
	
	lambda1 = u_var - rho_var *p_prime(rho_var)
	
	return
	
end function lambda1

! seconde valeur propre
real(rp) function lambda2(rho_var,u_var)

	implicit none
	
	real(rp), intent(in) :: rho_var, u_var
	
	lambda2 = u_var
	
	return
	
end function lambda2

real(rp) function max_vp(rho_var,u_var)

	implicit none
	real(rp), intent(in) :: rho_var, u_var
	max_vp = max(abs(lambda1(rho_var,u_var)),abs(lambda2(rho_var,u_var)))
	
	return 
	
end function max_vp

end module fonctions


