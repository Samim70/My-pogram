       implicit double precision(a-h,o-z)
       open(2,file='Qs-3.txt')
       write(*,*)'How many iterations you want?'
       read(*,*)n
       write(*,*)'Give Guess value'
       read(*,*)x1,x2
       write(*,*)'What precision you want? '
       read(*,*),p

       do 5 i=1,n
        x0=(x1+x2)/2
        if(f(x0)*f(x1).le.0)then
            x2=x0
        else
            x1=x0
        endif
        e=abs(x1-x2)
        if(e.lt.p)goto 8
5      continue
8      write(2,*)'The required root ',x0
       write(2,*)'Iteration needed to reach root ',i
       stop
       end

       double precision function f(x)
       implicit double precision(a-h,o-z)
       f=exp(-x/2)*log(exp(x/2)+(exp(x)-1)**0.5)-sqrt(0.044)
       return
       end



