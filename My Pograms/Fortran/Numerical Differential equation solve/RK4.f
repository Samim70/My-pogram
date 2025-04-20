	!Diff equation solve using RK4 Method
	implicit double precision(a-h,o-z)
	real*8 k1,k2,k3,k4
	open(2,file="RK4.dat")
	x=0.d0
	y=1.d0
	h=0.1
	print*,h/2
	write(2,*)x,y
	do 5 i=1,10
	k1=h*f(x,y)
	k2=h*f(x+(h/2),y+(k1/2))
	k3=h*f(x+(h/2),y+(k2/2))
	k4=h*f(x+h,y+k3)
	y=y+(k1+2*k2+2*k3+k4)/6.d0
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
