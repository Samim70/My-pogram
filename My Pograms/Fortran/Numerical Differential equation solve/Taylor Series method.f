	!Taylor
	implicit double precision(a-h,o-z)
	open(2,file="Taylor.dat")
	x=0.d0
	y=1.d0
	h=0.1
	write(2,*)x,y
	do 5 i=1,10
	y=y+h*(f(x,y)-1)+((h**2)/2.0)*f(x,y)+((h**3)/6)*f(x,y)+((h**4)/24)*f(x,y)
	x=x+h
	write(2,*)x,y
5	continue
	stop
	end
	
	double precision function f(x,y)
	implicit double precision(a-h,o-z)
	f=x+y+1
	return
	end
