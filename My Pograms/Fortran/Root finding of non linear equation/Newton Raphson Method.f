       implicit double precision(a-h,o-z)
       open(3,file='2.root.txt')
       write(*,*)'How many times you want the loop to be iterated? '
       read(*,*)n
       write(*,*)'What is the precision you want? '
       read(*,*)h
       write(*,*)'The nearest value you want to assume: '
       read(*,*)x0
       do 5 i=1,n
        x1=x0-(y(x0)/y1(x0))
        e=abs(x1-x0)
        if(e.le.h)go to 12
        x0=x1
5      continue

12     write(3,*)'the required root of the function  :',x0
       write(3,*)'No.of iteration needed to get required accuracy:',i
       stop
       end

       double precision function y(x)
       implicit double precision(a-h,o-z)
       y=3*exp(-x)+x-3
       return
       stop
       end

       double precision function y1(x)
       implicit double precision(a-h,o-z)
       y1=-3*exp(-x)+1
       return
       stop
       end
