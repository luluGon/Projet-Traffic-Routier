module flux

use const_var
implicit none
contains 

!flux f
real(rp) function f(rho)
	implicit none
	real(rp),intent(in) :: rho
	f=rho*(1.0_rp -rho)
	
	return
end function f

!f '
real(rp) function f_prime(rho)
	implicit none
	real(rp), intent(in) :: rho
	f_prime= 1.0_rp - 2.0_rp *rho
	
end function f_prime

! f'^-1 
real(rp) function inverse_f_prime(rho)
	implicit none
	real(rp), intent(in) :: rho
	inverse_f_prime= demi*(1.0_rp -rho)
	
end function inverse_f_prime

end module flux
