	implicit double precision(a-h,o-z)
	double complex Ga,Gb,Gg,E,ea,eb,eg,tl,ts,ea1,eb1,eg1,tl1,ts1
	pi=4*atan(1.d0)
	open(5,file="greena.dat")
	open(6,file="greenb.dat")
	open(7,file="greeng.dat")
	
	do 2 i=0,500
	tl=(1.0,0.0)
	ts=(1.0,0.0)
	ea=(0.0,0.0)
	eb=(0.0,0.0)
	eg=(0.0,0.0)
	E=dcmplx(-2.5+i*0.01,0.01)
	abst=cdabs(tl)+cdabs(ts)
	
	do while(abst.ge.0.0000001)
	ea1=eg+(tl**2+ts**2)/(E-eb)
	eb1=eg+(ts**2)/(E-eb)
	eg1=ea+(tl**2)/(E-eb)
	tl1=(tl*ts)/(E-eb)
	ts1=tl
	
	ea=ea1
	eb=eb1
	eg=eg1
	tl=tl1
	ts=ts1
	abst=cdabs(tl)+cdabs(ts)
	end do
	
	Ga=1/(E-ea)
	Gb=1/(E-eb)
	Gg=1/(E-eg)
	rhoa=-(1/pi)*dimag(Ga)
	rhob=-(1/pi)*dimag(Gb)
	rhog=-(1/pi)*dimag(Gg)
	write(5,*)real(E),rhoa
	write(6,*)real(E),rhob
	write(7,*)real(E),rhog
	
2	continue
	stop
	end
