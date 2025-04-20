       implicit double precision(a-h,o-z)
       write(*,*)'Assume 2 values near the root: '
       read(*,*)x0,x1
       write(*,*)'How many times you want the loop to be iterated?'
       read(*,*)n
       write(*,*)'Precision value? '
       read(*,*)p
       pi=acos(-1.d0)
       do 4 i=1,n
        d=f(x1)-f(x0)
        x2=x0*f(x1)-x1*f(x0)
        x2=x2/d
        e=abs(x2-x1)
        if(e.le.p)goto 5
        write(*,*)x2,x1
        x0=x1
        x1=x2
4      continue

5      write(*,*)"The required root is :",x2
       write(*,*)'Actual value: ',pi
       write(*,*)"No of iteration to reach required precision: ",i
       stop
       end

       double precision function f(x)
       implicit double precision(a-h,o-z)
       f=sin(x)
       return
       stop
       end








