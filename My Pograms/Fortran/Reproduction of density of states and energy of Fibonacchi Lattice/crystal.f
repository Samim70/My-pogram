	implicit double precision(a-h,o-z)
	double complex G,E,ep,t,t1,ep1
	pi=4*atan(1.d0)
	open(5,file="crystal.dat")
	
	do 2 i=0,500
	t=(1.0,0.0)
	ep=(0.0,0.0)
	E=dcmplx(-2.5+i*0.01,0.01)
	
	do 3 j=1,30
	t1=(t**2)/(E-ep)
	ep1=ep+(2*t**2)/(E-ep)
	t=t1
	ep=ep1
3       continue
	
	G=1/(E-ep)
	rho=-(1/pi)*AIMAG(G)
	write(5,*)real(E),rho
2	continue
	stop
	end
