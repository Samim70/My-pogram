      dimension A(10,10),C(10),X(10)
      open(10,file="gauss seidel2")
      write(*,*)"Enter Dimension"
      read(*,*)n
      write(*,*)"Enter the elements of A(Row-wise)"
      do 1 i=1,n
        read(*,*)(A(i,j),j=1,n)
1     continue
      write(*,*)"Enter the element of C"
      do 2 i=1,n
        read(*,*)C(i)
2     continue
      write(*,*)"Enter the element of X"
      do 3 i=1,n
        read(*,*)X(i)
3     continue
      write(*,*)"Precision="
      read(*,*)p
      do i=1,n
        s=0
        do j=1,n
            if(i.ne.j)then
                s=s+abs(A(i,j))
            endif
        enddo
        if(abs(A(i,i)).lt.s)then
            write(10,*)"this is not diagonally dominant"
        endif
      enddo
      do i=1,n
        d=A(i,i)
        do j=1,n
            A(i,j)=A(i,j)/d
        enddo
        C(i)=C(i)/d
      enddo
      iter=0
      k=0
      do while(iter.lt.50.d0.and.k.eq.0.d0)
        iter=iter+1
        k=1
        do i=1,n
            o=X(i)
            sum=C(i)
            do j=1,n
                if(i.ne.j)then
                    sum=sum-A(i,j)*X(j)
                endif
            enddo
            X(i)=sum
            if(X(i).ne.0.and.k.eq.1)then
                e=(abs(x(i)-o)/x(i))*100
            if(e.gt.p)then
                k=0
            endif
            endif
        enddo
      enddo
      write(10,*)"The number of iteration=",i
      write(10,*)"The solution vector is-"
      do i=1,n
        write(10,60)i,X(i)
      enddo
60    format("X(",i2,")",f20.10)
      stop
      end
