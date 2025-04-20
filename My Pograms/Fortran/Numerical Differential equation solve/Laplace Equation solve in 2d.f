!	laplace equation solve for lattice
	implicit double precision(a-h,o-z)
	real::nlat(100,100),lat(100,100)
	open(10,file="lap.dat")
	
	do 2 i=1,100
	nlat(1,i)=5.d0
	nlat(i,100)=5.d0
	nlat(100,i)=0.d0
	nlat(i,1)=0.d0
	lat(1,i)=5.d0
	lat(i,100)=5.d0
	lat(100,i)=0.d0
	lat(i,1)=0.d0
2	continue

	do 3 i=2,99
		do 4 j=2,99
			lat(i,j)=rand()
4	continue
3	continue

	e=1.d0
	do 5 while(e>0.00001)
	e=0.d0
	
	do 6 i=2,99
	do 7 j=2,99
	nlat(i,j)=(lat(i+1,j)+lat(i-1,j)+lat(i,j+1)+lat(i,j-1))/4.d0
	er=abs(nlat(i,j)-lat(i,j))
	if(er.ge.e)then
		e=er
	endif
7	continue
6	continue
	lat=nlat
5	continue
	do 8 k=1,100
		write(10,*)nlat(k,:)
8	continue
	print*,5
	stop
	end
