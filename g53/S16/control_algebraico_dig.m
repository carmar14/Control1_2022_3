clc
clear
close all

%--------proceso------
Tm=0.01;
g=tf([0.368 0.264],[1 -1.368 0.368],Tm);
gd=tf(1,[1 0 0 0],Tm);
%-----controlador-----
A=[0 0 1 0;
   0.368 0 -1.368 1;
   0.264 0.368 0.368 -1.368;
   0 0.264 0 0.368];
b=[1 0 0 0]';
x=inv(A)*b;
q1=x(1);
q0=x(2);
p1=x(3);
p0=x(4);
gc=tf([q1 q0],[p1 p0],Tm);

sis_ol=gc*g;
sis_cl=feedback(sis_ol,1);

step(sis_cl,'k')
hold on
step(gd,'r')
legend('Controlado','Deseado');