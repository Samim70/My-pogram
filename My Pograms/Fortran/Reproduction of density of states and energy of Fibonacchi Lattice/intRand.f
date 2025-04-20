	program statistical method
	implicit double precision(a-h,o-z)
	write(*,*)"No of ponits:"
	read(*,*)N
	open(5,file="data")
	open(10,file="data1")
	open(15,file="data2")
	do 1 j=1,N
	a=0.d0
	do 2 i=1,j
	xi=rand()
	yi=rand()
	f=sqrt(1-xi*xi)
	if (yi.le.f) then
		a=a+1.0d0
		write(10,*)xi,yi
	else if (yi.gt.f) then 
		write(15,*)xi,yi
	end if
2	continue
cc	write(*,*)a
	write(5,*)j,(4*a/j)
1	continue
	areac=a/N
	write(*,*)"value of pi=",4*areac
	stop
	end program