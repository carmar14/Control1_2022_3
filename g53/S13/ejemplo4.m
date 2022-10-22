clc
close all
clear

%proceso
den = conv([1 50 0],[1 51]);
g=tf(50,den);
step(g,'k')
g_cl=feedback(g,1);
figure
step(g_cl,'r')
%deseado
pol_d=conv([1 5-5j],[1 5+5j]);
g_d=tf(pol_d(3),pol_d);
figure
step(g_d,'r')
legend('Deseado')
[P Z]=pzmap(g_d)

%pol_a=conv(pol_d,[1 101-10]);
pol_a=conv(pol_d,[1 50])
%--------controlador----
Kp=4550/50;
Td=(960-2550)/(50*Kp);
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
