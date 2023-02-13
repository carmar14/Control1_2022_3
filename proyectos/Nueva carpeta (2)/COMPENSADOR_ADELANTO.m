clc
close all
clear

%proceso
n=9.818;
d=[1 11.8];
g=tf(n,d);
figure
rlocus(g)

% elimina el error en estado estacionario
pol_a = conv(d,[1 0]);
m=tf(n,pol_a);
m_cl=feedback(m,1)
figure
rlocus(m_cl)
[P Z]=pzmap(m_cl)
figure
step(m_cl)

% deseado
wn=6;
e=1.88; %mismo que el sistema anterior 
g_d=tf(wn^2,[1 2*e*wn wn^2])
[P Z]=pzmap(g_d)

%CONTROLADOR 
pol_b = conv(pol_a,[1 20.8319]);
nc=n*33.9;
gd=tf(nc,pol_b);
g_cl=feedback(gd,1);
figure
rlocus(gd)
figure
hold on
step(g,'k')
step(m_cl,'b')
step(g_cl,'--r')
step(g_d,'y')
legend('inicial','sin ess','controlado','deseado')
%----------discretizada---------
Tm=0.017;
gdd=c2d(m_cl,Tm,'tustin')
g_cd=c2d(g_cl,Tm,'tustin')
figure
step(g_cd,'k')
hold on
step(gdd,'r')
legend('con controlador discreto','sin ess discreto')