#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Mar 12 22:18:12 2023

@author: samim
"""

import numpy as np
import pylab as pl
#x,y=np.loadtxt("sin-diffrac.dat",unpack=True)
#x=[14.72,17.60,31.50,66.5,79.0]
#y=[0.075,0.090,.16,.34,.42]
#x=[17.6,14.72,31.48,66.5,79.4]
#y=[0.40,0.32,0.72,1.50,1.80]
x=[25,87.5,171,5.35]
y=[1.80,6,8.8,.42]

n=int(input("Order of Polynomial?? "))
C=np.zeros((n+1,1))
P=np.zeros((n+1,n+1))
m1=0
m2=0
#calculating the slope
for i in range(0,n+1):
    m1=m1+(x[i]*y[i])
    m2=m2+(x[i]**2)
m=(m1/m2)
print("slope= ",m)   
#Forming the main MAtrix
for j in range(0,n+1):
    l=j
    for k in range(0,n+1):
        s=0
        for i in range(0,len(x)):
            s=s+(x[i]**l)
        
        P[j,k]=s
        l=l+1
        
#Forming the Y Matrix
for j in range(0,n+1):
    s3=0
    for i in range(0,len(x)):
        s3=s3+y[i]*(x[i]**j)
    C[j,0]=s3
    
#Solving the matrix
A=np.linalg.solve(P, C)
print(A)
#Calculating the value of standered deviation
sd=0
for i in range(0,len(x)):
    s2=0
    for k in range(0,n+1):
        s2=s2+A[k]*(x[i]**k)
    sd=sd+(y[i]-s2)**2
print("The value of standered deviation- ",sd)

'''#Uncertainty in the coefficients
B=np.linalg.inv(P)
print("Uncertainty in the coefficients",np.sqrt(np.diag(B)))'''

#Plot and fit
Z=[]
u=np.linspace(0, max(x), 100)
for i in range(0,100):
    s4=0
    for j in range(0,n+1):
        s4=s4+A[j]*(u[i]**j)
    Z.append(s4)
pl.scatter(x,y)
#pl.xlabel("order")
#pl.ylabel("distance bet diffrac minima")
#pl.title("single helix (interference minima)")
pl.xlabel("Capacitor(C_{T}(nF))")
pl.ylabel("Time period(ms)")
pl.title("Capacitor(C_{T}) vs Time period(R_{T}=79Kohm)")
pl.plot(u,Z)
pl.show()
