	implicit double precision(a-h,o-z)
	double complex tl,ts,tprl,tprs,epsa,epsb,epsg,epspra,epsprb
	double complex epsprg,greena,greenb,greeng,e
	open(12,file="datafa")
	open(13,file="datafb")
	open(14,file="datafg")
	do 3 i=0,1000
	
	epsa=(0.0,0.0)
	epsb=(0.0,0.0)
	epsg=(0.0,0.0)
	tl=(1.0,0.0)
	ts=(2.0,0.0)
	pi=4*atan(1.0)
	
	d=-2.5+i*0.005
	e=dcmplx(d,0.001)
	
	do 1 k=1,1000
	
	tprl=tl*ts/(e-epsb)
	tprs=tl
	
	epspra=epsg+(tl**2+ts**2)/(e-epsb)
	epsprb=epsg+(ts**2)/(e-epsb)
	epsprg=epsa+(tl**2)/(e-epsb)
	
	tl=tprl
	ts=tprs
	epsg=epsprg
	epsa=epspra
	epsb=epsprb
	
	if((cdabs(tprl)+cdabs(tprs)).le.0.0000001) exit
  1     enddo
       greena=1/(e-epspra)
       roa=-(1/pi)*dimag(greena)
       write(12,*)d,roa
       greenb=1/(e-epsprb)
       rob=-(1/pi)*dimag(greenb)
       write(13,*)d,rob
       greeng=1/(e-epsprg)
       rog=-(1/pi)*dimag(greeng)
       write(14,*)d,rog
  3    continue
       stop
       end
	
