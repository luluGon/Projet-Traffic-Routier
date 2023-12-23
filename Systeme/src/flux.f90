module flux

use const_var
use initialisation
use fonctions

implicit none
contains 

!flux F
subroutine F(W_in,W_out)
	implicit none
	real(rp),dimension(2),intent(in) :: W_in
	real(rp),dimension(2),intent(out) :: W_out
	real(rp) :: u_loc
	
	u_loc = -p(W_in(1)) +W_in(2)/W_in(1)			! on recalcule u
	
	W_out(1) = u_loc*W_in(1)						! rho*u
	W_out(2) = u_loc*W_in(2)						! rho*u(u + p(rho))
	
	return
end subroutine F



end module flux
