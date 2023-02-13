clc
clear all
ts=10
so=0.01;
zita=sqrt((log(so))^2/(pi^2+(log(so))^2));
wn=4/(zita*ts)
numd=wn^2
dend=[1 2*wn*zita wn^2]
deseada=tf(numd,dend)
polosdeseados=roots(dend)
pd=polosdeseados(1)
%%
deseada4=conv(conv(dend,[1 20]),[1 20])
deseada6=conv(conv(deseada4,[1 20]),[1 20])
deseada7=conv(deseada6,[1 20])
f=deseada7(8:-1:1)
C=f'

%%
A=[0          1          0          0           0          0           0           0;
   47.54      0          0          1           0          0           0           0;
   573        0          47.54      0           0          1           0           0 ;
   14.71      0          573        0           47.54      0           0           1;
   1          0          14.71      0           573        0           47.54       0;
   0          0          1          0           14.71      0           573         0;
   0          0          0          0           1          0           14.71       0;
   0          0          0          0           0          0           1           0]

B=inv(A)*C
P0=B(1)
Q0=B(2)
P1=B(3)
Q1=B(4)
P2=B(5)
Q2=B(6)
P3=B(7)
Q3=B(8)

%% CONTROLADOR
C=tf([Q3 Q2 Q1 Q0],[P3 P2 P1 P0])
polos=roots([P3 P2 P1 P0])
zeros=roots([Q3 Q2 Q1 Q0])
discreto=c2d(C,0.01,'tustin')