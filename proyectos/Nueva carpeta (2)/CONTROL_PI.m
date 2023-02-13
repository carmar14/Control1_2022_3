clc
close all
clear

%proceso
n=9.818;
d=[1 11.8];
g=tf(n,d);
step(g,'k')
g_cl=feedback(g,1);
hold on
step(g_cl,'--r');
[P Z]=pzmap(g)

%deseado

g_d= tf(1,[1 0.14]);
pol_a = conv([1 0.14],[1 14]);

%------controlador pi----
Kp=14.1414-11.8/n;
Ti=(n*Kp)/1.96;
g_c=tf([Kp*Ti Kp],[Ti 0]);


%---compensado---------
sis_ol=g_c*g;
sis_cl= feedback(sis_ol,1);
figure
step(sis_cl,'k')
hold on
step(g,'r')
legend('Compensado PI','Deseado')

figure
pzmap(sis_cl)

%-----------lugar geometrico---
figure
rlocus(g)
figure
rlocus(sis_ol)

%----------discretizada---------
Tm=0.0017;
gdd=c2d(g,Tm,'tustin')
g_cd=c2d(g_c,Tm,'tustin')
sis_old=g_cd*gdd;
sis_cld= feedback(sis_old,1);
figure
step(sis_cld,'k')
hold on
step(gdd,'r')
legend('Compensado PI','Deseado')