	implicit double precision(a-h,o-z)
	open(5,file="ElplotG.dat")
	!write(*,*)"How many iteration you want?"
	!read(*,*)n
	n=6
	tL=1
	tS=2
	Ea=0
	Eb=0
	Eg=0
	do 3 i=1,600
	l=1
	E=(-3)+(0.01d0*i)
	x1=(E-Ea)/tL
	x2=((E-Eg)*(E-Eb)-tS*tS-tL*tL)/(tL*tS)
	x3=((E**3)-tS*tS*E-tL*tL*E)/(tL*tL*tS)
	
	do 2 j=1,n
	if(abs(x1).le.2.d0)then
	write(5,*)l,E
	endif
	if(abs(x2).le.2.d0)then
	write(5,*)l+1,E
	endif
	if(abs(x3).le.2.d0)then
	write(5,*)l+2,E
	endif	
	x1=x3*x2-x1	!x4 is my new x1
	x2=x1*x3-x2	!x5 new x2
	x3=x2*x1-x3	!x6 is new x3
	l=l+3
2	continue

3	continue
	stop
	end
