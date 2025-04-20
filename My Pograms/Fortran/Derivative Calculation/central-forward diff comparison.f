	implicit double precision(a-h,o-z)
	real::h(5)
	open(2,file="deri.dat")
	write(*,*)'whcih point u want to evaluate the derivative? '
	read(*,*)x0
	h=(/0.2,0.1,0.05,0.02/)
	
	do 5 i=1,4
	fd=(f(x0+h(i))-f(x0))/h(i)
	cd=(f(x0+h(i))-f(x0-h))/h(i)
	write(*,*)h(i),fd,cd
5	continue
	stop
	end
	
	double precision function f(x)
	implicit double precision(a-h,o-z)
	f=exp(-x)
	return
	end
