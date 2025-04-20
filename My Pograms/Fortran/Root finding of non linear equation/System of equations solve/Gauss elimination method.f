       dimension A(10,11),X(10)
       open(10,file="gauss elemenation")
       write(*,*)"Enter Dimension"
       read(*,*)n
       write(*,*)"Enter the elements of A(Row-wise)"
       do 1 i=1,n
        read(*,*)(A(i,j),j=1,n+1)
1      continue
       do 2 k=1,n-1
        pivot=A(k,k)
        do 3 i=k+1,n
            factor=A(i,k)/pivot
            do 4 j=1,n+1
                 A(i,j)=A(i,j)-factor*A(k,j)
4           continue
3       continue
2      continue
       write(10,*)"The upper Triangular Matrix is-"
       do 5 i=1,n
        write(10,*)(A(i,j),j=1,n+1)
5      continue
       X(n)=A(n,n+1)/A(n,n)
       do 6 k=n-1,1,-1
        s=0
        do 7 j=k+1,n
            s=s+A(k,j)*X(j)
7       continue
        X(k)=(A(k,n+1)-s)/A(k,k)
6      continue
       write(10,*)"The solution vector is"
       do 8 i=1,n
         write(10,60)i,X(i)
8      continue
60     format("X(",i2,")",f20.10)
       stop
       end
