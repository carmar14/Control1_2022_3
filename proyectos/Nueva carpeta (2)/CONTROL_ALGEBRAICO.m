clc
close all
clear

%---------proceso integrado ----
g=tf([9.818],[1 11.8 0]);
gcl=feedback(g,1);
%----------ecuacion deseada----
den = conv([1 1.4],[1 14.5]);
den = conv(den,[1 14.0]);
d=tf(1,den);
%--------controlador-----
A=[0 0 1 0;
   0 0 11.8 1;
   9.818 0 0 11.8;
   0 9.818 0 0];
B=den';
x=inv(A)*B;

q1 = x(1);
q0 = x(2);
p1 = x(3);
p0 = x(4);

gc = tf([q1 q0],[p1 p0])
sis_ol = gc*g;
sis_cl = feedback(sis_ol,1);
figure
hold on
step(gcl)
step(sis_cl,'k')
%--------discretizado-----
Tm=0.017;
gdd=c2d(g,Tm,'tustin');
g_cd=c2d(gc,Tm,'tustin');
g_cld=c2d(gcl,Tm,'tustin');
sis_old=g_cd*gdd;
sis_cld= feedback(sis_cl,1);
figure

hold on
step(sis_cld,'k')
step(g_cld,'b')
legend('Compensado PI','sistema sin ess')


