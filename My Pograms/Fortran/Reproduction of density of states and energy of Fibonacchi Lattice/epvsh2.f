	implicit double precision(a-h,o-z)
	open(1,file="FD")
	open(2,file="CD")
	open(3,file="value")
c	write(3,*)0.5,0.2,0.1,0.05,0.02,0.01
	exact=f(1.0d0)
	do 4 i=1,6
	read(3,*)h
	dydx1=(f(1+h)-f(1.0d0))/h
	ep1=exact-dydx1
	write(1,*)1/h,abs(ep1)
	dydx2=(f(1+h)-f(1-h))/(2*h)
	ep2=exact-dydx2
	write(2,*)1/h,abs(ep2)
4	continue
	stop
	end

	double precision function f(x)
	implicit double precision(a-h,o-z)
	f=dexp(x)
	return
	end
