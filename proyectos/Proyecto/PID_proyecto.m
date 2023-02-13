clc
close all
clear

g=tf(9.458,[1 1.378 9.615]);
g_cl=feedback(g,1);
figure
step(g,'k')
hold on
step(g_cl,'r')
title('Sistema lazo abierto y lazo cerrado')
legend('Rta en lazo abierto','Rta en lazo cerrado')

    %Deseado
Ts=1;
so=0.10;
e=sqrt((log(so))^2/(pi^2+(log(so))^2));
wn=4/(Ts*e);
g_d=tf(wn^2,[1 2*e*wn wn^2]);
figure
step(g_d,'r')
legend('Deseado')
[P Z]=pzmap(g_d)

ecu_d=[1 2*e*wn wn^2];
ecu_a=conv(ecu_d,[1 50]);       %Se aumenta el orden con un polo en -50
%--------controlador----
Kp=400/9.458;
Td=50/(9.458*Kp);
Ti=9.458*(Kp/2289);
g_c=tf([Kp*Td*Ti Kp*Ti Kp],[Ti 0]);

%Sistema compensado
sis_ol=g_c*g;
sis_cl=feedback(sis_ol,1);
figure
step(sis_cl,'k')
hold on
step(g_d,'r')
legend('Compensado','Deseado')
title('Comparación sistema compensado y sistema deseado, ante entrada escalón')
[p1 z1]=pzmap(sis_cl)
figure
pzmap(sis_cl)
title('Mapa de polos y ceros del sistema compensado')

%Discretización
Tmd=0.047/10;                        %Empirico con tiempo de subida
gc_d=c2d(g_c,Tmd,'Tustin');         %Discretiza controlador
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
step(sis_cl,'b')
title('Sistema compensado en discreto y continuo')
legend('Discreto','Continuo')

