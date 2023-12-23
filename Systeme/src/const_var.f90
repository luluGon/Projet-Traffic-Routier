module const_var
!module servant à définir les constantes et variables que l'on utilisera tout au long du programme
use iso_fortran_env 

implicit none

!!!!!!!!!!!!!
! PARAMETRE !
!!!!!!!!!!!!!
integer, parameter 	:: rp=REAL64
real(rp), parameter :: pi=acos(-1.0_rp)
real(rp), parameter :: zero=epsilon(1.0_rp)
real(rp), parameter :: demi= 0.5_rp 


!!!!!!!!!!!!!!!!!!!!
! VARIABLE GLOBALE !
!!!!!!!!!!!!!!!!!!!!
real(rp) :: xdebut, xfin, CFL, Tfin, date, dt, dx, a, rhomax,Vmax
real(rp), allocatable, dimension(:) 	:: rho, U
real(rp), allocatable, dimension(:,:) 	:: Wo,Wn,G
integer :: ncel, choix,CL, choix_fonction


end module const_var
