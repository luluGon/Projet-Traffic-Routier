module flux_num


use const_var
use fonctions
use flux

contains


! flux numérique de Rusanov
subroutine flux_Rusanov ()

	implicit none
	real(rp), dimension(2) :: Wl,Wr,FWl,FWr
	real(rp) :: maxVP1, maxVP2,maxVP
	integer :: i
	
	do i=1,ncel-1
		
		Wl = Wo(:,i)
		Wr = Wo(:,i+1)

		
		
		! on calcul F(Wl) et F(Wr)
		call F(Wl,FWl)
		call F(Wr,FWr)
		
		! on calcul le max entre les vp
		maxVP1 = max_vp( rho(i), u(i) )
		maxVP2 = max_vp( rho(i+1), u(i+1) )
		maxVP = max (maxVP1,maxVP2)
		
		
	 	! on calcule le vecteur G(i)
		G(1,i) = demi*( FWl(1) + FWr(1) - maxVP*( Wr(1) -Wl(1) ) )
		G(2,i) = demi*( FWl(2) + FWr(2) - maxVP*( Wr(2) -Wl(2) ) )
		
		
	end do
	
	return
	
end subroutine flux_Rusanov
	


end module flux_num
