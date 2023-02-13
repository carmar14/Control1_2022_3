clc
close all
clear

%proceso
g=tf(35.848,[1 15.58 35.848]);
step(g,'k')
g_cl=feedback(g,1);
figure
step(g_cl,'r')
%deseado
Ts=0.15;
so=0.9;
e=sqrt((log(so))^2/(pi^2+(log(so))^2));
wn=4/(Ts*e);
g_d=tf(wn^2,[1 2*e*wn wn^2]);
figure
step(g_d,'r')
legend('Deseado')
[P Z]=pzmap(g_d)

pol_d=[1 2*e*wn wn^2];
%--------controlador----
Kp=2.050;
Td=7/(4*Kp);
gc=tf([Kp*Td Kp],1);


%------------
sis_ol=gc*g;
sis_cl= feedback(sis_ol,1);
figure
step(sis_cl,'k')
hold on
step(g_d,'r')
legend('Compensado','Deseado')

figure
pzmap(sis_cl)

%-----------lugar geometrico---
figure
rlocus(g)
figure
rlocus(sis_ol)


%--------pid------------
pol_a = conv(pol_d,[1 100]);
Kp=2.050;
Td=1.0369;
Ti=0.013006;
g_c=tf([Kp*Td*Ti Kp*Ti Kp],[Ti 0]);


%------------
sis_ol=g_c*g;
sis_cl= feedback(sis_ol,1);
figure
step(sis_cl,'k')
hold on
step(g_d,'r')
legend('Compensado PID','Deseado')

figure
pzmap(sis_cl)

%-----------lugar geometrico---
figure
rlocus(g)
figure
rlocus(sis_ol)

