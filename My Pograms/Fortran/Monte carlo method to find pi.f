	!pi
	implicit double precision(a-h,o-z)
	open(2,file="pi.dat")
	write(*,*)'upto how much point do u want to generate? '
	read(*,*)n
	fm=1.d0
	a=0
	b=1.d0
	
	do 4 i=10,n
	ic=0
	do 5 j=1,i
	x=a+(b-a)*rand()
	y=fm*rand()
	
	if(y.le.f(x))then
	ic=ic+1
	endif
5	continue
	Ac=(1.d0*ic)/i
	pi=4.d0*Ac
	write(2,*)i,pi
4	continue
	stop
	end
	
	double precision function f(x)
	implicit double precision(a-h,o-z)
	f=(1-x**2)**0.5
	return
	end
