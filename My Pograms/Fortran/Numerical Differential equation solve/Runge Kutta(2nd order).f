	!Diff equation solve using RK2 alfa=beta=1, a=b=0.5 Method
	implicit double precision(a-h,o-z)
	real*8 k1,k2
	open(2,file="RK2B.dat")
	x=0.d0
	y=1.d0
	h=0.1
	alf=1.5
	bt=1.5
	a=2.d0/3
	b=1.d0/3
	print*,h/2
	write(2,*)x,y
	do 5 i=1,10
	k1=h*f(x,y)
	k2=h*f(x+alf*h,y+bt*k1)
	
	y=y+a*k1+b*k2
	x=h*i
	write(2,*)x,y
5	continue
	stop
	end
	
	double precision function f(x,y)
	implicit double precision(a-h,o-z)
	f=x+y
	return
	end
