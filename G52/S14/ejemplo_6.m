clc
close all
clear

%---------proceso--------
g=tf(25,[1 1 -2]);

step(g,'b')

gcl=feedback(g,1);
figure
step(gcl)

figure
rlocus(g)
%----------ecuacion deseada----
den = conv([1 8],[1 100]);
den = conv(den,[1 81]);

%--------controlador-----
A=[0 0 1 0;
   0 0 1 1;
   25 0 -2 1;
   0 25 0 -2];
B=den';
x=inv(A)*B;

q1 = x(1);
q0 = x(2);
p1 = x(3);
p0 = x(4);

gc = tf([q1 q0],[p1 p0]);
sis_ol = gc*g;
sis_cl = feedback(sis_ol,1);
figure
step(20*sis_cl,'k')

figure
pzmap(sis_cl);

figure
rlocus(sis_ol)

%----------sin error en estado estacionario

den = conv([1 8],[1 80]);
den = conv(den,[1 80]);
den = conv(den,[1 81]);
den = conv(den,[1 85]);

%--------controlador-----
A=[0 0 0 1 0 0;
   0 0 0 1 1 0;
   0 0 0 -2 1 1;
   25 0 0 0 -2 1;
   0 25 0 0 0 -2;
   0 0 25 0 0 0];
B=den';
x=inv(A)*B;

q21 = x(1);
q11 = x(2);
q01 = x(3);
p21 = x(4);
p11 = x(5);
p01 = x(6);

gc = tf([q21 q11 q01],[p21 p11 p01 0]);
sis_ol = gc*g;
sis_cl = feedback(sis_ol,1);
figure
step(2*sis_cl,'k')

figure
pzmap(sis_cl)

figure
rlocus(sis_ol)

