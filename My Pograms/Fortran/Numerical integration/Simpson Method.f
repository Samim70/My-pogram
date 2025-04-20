	implicit double precision(a-h,o-z)
	write(*,*)"No of interval? "
	read(*,*)n
	a=0
	b=2.5
	h=(b-a)/n
	s=0
	z=4
	do 5 i=1,n
	x=i*h
	s=s+z*f(x)
	z=6-z
5	continue
	s=(h/3)*(s+f(a)+f(b))
	print*,s
	stop
	end	
	
	double precision function f(x)
	implicit double precision(a-h,o-z)
	f=tanh(x)
	return
	end
