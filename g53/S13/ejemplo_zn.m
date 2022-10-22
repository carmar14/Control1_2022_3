clc
close all
clear

%---------proceso--------
den=conv([1 0.5],[1 0.5]);
g=tf(1,den);
g=tf(1,den,'InputDelay',1);
step(g,'b')

L=1;
T=3;%3;
% g_est=tf(1,[T 1],'InputDelay',L);
% hold on
% step(g_est,'.r')

%-----------controlador p-----
K_p=T/L;
K_p=T/(4*L);
K_p=K_p/2;
g_c=tf(K_p,1);
sis_ol=g_c*g;
sis_cl=feedback(sis_ol,1);
hold on
step(sis_cl,'k')


%------controlador PI----

K_p=0.9*T/L;
K_p=K_p/4;
K_p=K_p/2;
T_i=L/0.3;
g_c=tf([K_p*T_i K_p],[T_i 0]);
sis_ol=g_c*g;
sis_cl=feedback(sis_ol,1);
hold on
step(sis_cl,'r')

%------controlador PID----
K_p=1.2*T/L;
K_p=K_p/4;
K_p=K_p/2;
T_i=2*L;
T_d=0.5*L;
g_c=tf([K_p*T_i*T_d K_p*T_i K_p], [T_i 0]); 
sis_ol=g_c*g;

sis_cl=feedback(sis_ol,1);
hold on
step(sis_cl,'--k')

legend('OL','P','PI','PID')
title('Primer método')

%-----Segundo método---------
den = conv([1 1],[1 5]);
den = conv(den,[1 0]);
g=tf(1,den);

figure
rlocus(g)

K_cr=30;
% K_cr=20;
sis_ol=K_cr*g;
sis_cl=feedback(sis_ol,1);
figure
step(sis_cl,'k')
P_cr=2.8;
%-----------controlador p-----
K_p=0.5*K_cr;
K_p=K_p/2;
g_c=tf(K_p,1);
sis_ol=g_c*g;
sis_cl=feedback(sis_ol,1);
figure
step(sis_cl,'k')


%------controlador PI----
K_p=0.45*K_cr;
K_p=K_p/2;
T_i=P_cr/1.2;
g_c=tf([K_p*T_i K_p],[T_i 0]);
sis_ol=g_c*g;
sis_cl=feedback(sis_ol,1);
hold on
step(sis_cl,'r')

%------controlador PID----
K_p=0.6*K_cr;
K_p=K_p/2;
T_i=0.5*P_cr;
T_d=0.125*P_cr;
g_c=tf([K_p*T_i*T_d K_p*T_i K_p], [T_i 0]); 
sis_ol=g_c*g;
sis_cl=feedback(sis_ol,1);
hold on
step(sis_cl,'--k')

legend('P','PI','PID')
title('Segundo método')