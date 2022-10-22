clc
close all
clear

%proceso
g=tf(1,[1 3 5]);
step(g,'k')
g_cl=feedback(g,1);
hold on
step(g_cl,'r')
%deseado
Ts=1;
so=0.13;
e=sqrt((log(so))^2/(pi^2+(log(so))^2));
wn=4/(Ts*e);
g_d=tf(wn^2,[1 2*e*wn wn^2]);
figure
step(g_cl,'b')
hold on
step(g_d,'r')
legend('sin compensar en CL','Deseado')
[P Z]=pzmap(g_d)

pol_d=[1 2*e*wn wn^2];
pol_a=conv(pol_d,[1 40]);

%------controlador----
K_p=373.9-5;
T_i=K_p/2157.5;
T_d=(48-3)/K_p;
g_c=tf([K_p*T_i*T_d K_p*T_i K_p],[T_i 0]);

%--------compensado----
sis_ol=g_c*g;
sis_cl=feedback(sis_ol,1);
figure
step(sis_cl,'k')
hold on
step(g_d,'r')
legend('Compensado','Deseado')
[p z]=pzmap(sis_cl)
figure
pzmap(sis_cl)


%-----------lugar geometrico---
figure
rlocus(g)
figure
rlocus(sis_ol)
