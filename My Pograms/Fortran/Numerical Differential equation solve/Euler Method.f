	!Modified Euler & Euler
	implicit double precision(a-h,o-z)
	open(2,file="Euler.dat")
	open(3,file="Exact.dat")
	open(4,file="MEuler.dat")
	x=0.d0
	y=1.d0
	y2=1.d0
	h=0.1d0
	write(2,*)x,y
	write(4,*)x,y2
	do 5 i=0,10
	y1=g(x) !Exact
	write(3,*)x,y1
	
	y=y+h*f(x,y) !Euler
	y2=y2+(h/2.0)*(f(x,y2)+f(x+h,y2+h*f(x,y2))) !MEuler
	x=x+h
	write(2,*)x,y
	write(4,*)x,y2
	
5	continue
	stop
	end
	double precision function f(x,y)
	implicit double precision(a-h,o-z)
	f=x+y
	return
	end
	double precision function g(x)
	implicit double precision(a-h,o-z)
	g=2*exp(x)-1-x
	return
	end
