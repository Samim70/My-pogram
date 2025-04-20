	implicit double precision(a-h,o-z)
	double complex G,E
	t=1
	ep=0
	open(5,file="data")
	do 1 i=1,100
	E=(-2.5,0.01)

	do 2 while(t.le.1.0d-08)
	t=(t**2)/(E-ep)
	ep=ep+(2*t**2)/(E-ep)
2       continue
	
	G=1/(E-(ep+(2*t**2)/(E-ep)))
	rho=-(1/pi)*dimag(G)
	write(5,*)real(E),rho
	E=E+0.25
1	continue
	stop
	end
