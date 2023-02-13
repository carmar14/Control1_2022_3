clc
close all
clear

    %Proceso
g=tf(9.458,[1 1.378 9.615]);     %Función transferencia obtenida 
pzmap(g)
[p,z] = pzmap(g);

figure
step(g,'b')
gcl=feedback(g,1);
hold on
step(gcl, 'r')
title('Rta a escalón del sistema en lazo abierto y cerrado')
legend ('Sis. lazo abierto','Sis. lazo cerrado')

    %Sis. Deseado
Ts=1;
so=0.1;                %Sobre impulso del 10%
e=sqrt((log(so))^2/(pi^2+(log(so))^2));
wn=4/(Ts*e);
g_d=tf(wn^2,[1 2*e*wn wn^2]);       %Función de transferencia del sistema deseado en lazo abierto
[m,z1] = pzmap(g_d);
figure
step(g_d,'b')
title('Sistema deseado, rta a entrada escalón')

    %Aumenta ecu. caracteristica deseada
a=conv([1 8 45.78],[1 50]);

    %Controlador

A=[0 0 1 0;
   0 0 1.378 1;
   9.458 0 9.615 1.378;
   0 9.458 0 9.615];
b=[1 58 445.78 2289]';
x=inv(A)*b;
q1=x(1);
q0=x(2);
p1=x(3);
p0=x(4);
gc=tf([q1 q0],[p1 p0]);

A1=[0 0 0 1 0 0;
   0 0 0 1.378 1 0;
   0 0 0 9.615 1.378 1;
   9.458 0 0 0 9.615 1.378;
   0 9.458 0 0 0 9.615;
   0 0 9.458 0 0 0];
b1=[1 161 9071.7799 202020.3348 1417975.56 6070428]';
xn=inv(A1)*b1;
q21=xn(1);
q11=xn(2);
q01=xn(3);
p21=xn(4);
p11=xn(5);
p01=xn(6);
gc1=tf([q21 q11 q01],[p21 p11 p01 0]);

%Sistema con controlador
sis_ol=gc*g;                   %Sistema controlado en lazo abierto
sis_cl=feedback(sis_ol,1);      %Sistema controlado en lazo cerrado

sis_ol1=gc1*g;                   %Sistema controlado sin error en estado estacionario en lazo abierto
sis_cl1=feedback(sis_ol1,1);      %Sistema controlado sin error en estado estacionario en lazo cerrado

figure
step(sis_cl,'k')
hold on
step(sis_cl1,'b')
hold on
step(g_d,'r')
legend('Controlado','Controlado sin ess','Deseado');
title('Comparación sis. controlado, controlado sin ess y deseado ante entrada escalón')

    %Discretización
Tmd=0.0746/10;                      %Empirico por tiempo de subida
gc_d=c2d(gc1,Tmd,'Tustin');         %Discretiza controlador
gp_d=c2d(g,Tmd,'Tudtin');           %Discretiza el proceso
sis_ol_d=gc_d*gp_d;                 %Sistema en lazo abierto en discreto
sis_cl_d=feedback(sis_ol_d,1);      %Sistema en lazo cerrrado en discreto
figure
step(sis_cl_d,'k')
hold on
step(g_d,'r')
legend('Compensado en discreto','Deseado')
title('Respuesta del sistema en discreto')

figure
step(sis_cl_d,'k')
hold on
step(sis_cl1,'b')
title('Sistema compensado en discreto y continuo')
legend('Discreto','Continuo')
