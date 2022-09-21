clc
clear
close all

%------------planta o proceso----
a=[1 1];
b=[1 2];
c=[1 0];
den= conv(a,b);
den= conv(den,c);

g=tf(1.06,den);

rlocus(g)
figure
gr=feedback(g,1);
pzmap(gr)
title('Mapa de polos y ceros sin compensador')
figure
step(gr)
[p z] = pzmap(gr);

%polos dominantes: 
s1=-0.33+0.586*i;
s2=-0.33-0.586*i;

%polinomio caracteristico:
pol = conv([1 -s1],[1 -s2])

wn=sqrt(pol(3))
e=pol(2)/(2*wn)

sis_d=tf(wn^2,pol); %sistema deseado


so = 100*exp(-e*pi/sqrt(1-e^2))
Ts= 4/(e*wn)
% constante Kv actual
Kv_a=0.53;
Kv=5;
% se desea Kv cerca a 5 la razón es 9.43, se puede acerca a 10 para fines
% practicos

%------G_c(s)=(s+z)/(s+p)-----
razon= 10 ;%Kv/Kv_a;
p=0.001; %0.005
z=razon*p; %0.05;

cond_ang= rad2deg(angle((s1+z)/(s1+p)))
%atand((0.33-0.05)/0.586)-atand((0.33-0.005)/0.586)


g_c = tf([1 z],[1 p]);

%nuevo lgr
sis_c=g_c*g;
figure
rlocus(sis_c)
hold on
rlocus(g,'-.')
legend('Nuevo LGR','Antiguo LGR')


%ubicar los nuevos polos dominantes teniendo en cuenta G_c*G
sis_rc=feedback(g_c*g,1);
[p1 z1]=pzmap(sis_rc)
figure
pzmap(sis_rc)
title('Mapa de polos y ceros con compensador')

% determinar la ganancia K para ubicar los polos deseados en lazo cerrado
% s1= -0.309+0.56*i;%0.332+0.466*i;
% s2= -0.309+0.56*i;%0.332-0.466*i;
s1= p1(2);%-0.308+0.566i;%p1(2);%-0.332+0.466*i;
s2= p1(3);%-0.332-0.466*i;
num = 1.06*(s1+z);
den = s1*(s1+p)*(s1+1)*(s1+2);

div = abs(num/den);

K=1/div;

%polinomio caractetistcio nuevo
pol = conv([1 -s1],[1 -s2])

wn=sqrt(pol(3))
e=pol(2)/(2*wn)


%sistema completo realimentado
g_c = K*g_c;
sis_r_c=feedback(g_c*g,1)
figure
step(gr,'b')
hold on
step(sis_r_c,'k')
%step(sis_d,'r')
title('Respuesta al escalon')
legend('Sistema no compensado', 'Sistema compensado')
%legend('Sistema no compensado', 'Sistema compensado','Sistema deseado')
figure
pzmap(sis_r_c)

%---------implementación de Gc con operacioneales----
%Gc=K(s+z)/(s+p)

C1=1000e-6;
C2=C1;
R1=1/(C1*z);
R2=1/(C2*p);
R3=10e3;
R4=K*R3;

% funcion de trasnferencia del controlador con los parametros del
% operacional
g_cao= tf((R4*C1/(R3*C2))*[1 1/(R1*C1)],[1 1/(R2*C2)]);
SR=feedback(g_cao*g,1);
figure
step(SR,'k')
hold on
step(gr,'b')
title('Respuesta al escalon-Controlador implementado con operacionales')
legend('Sistema compensado', 'Sistema no compensado')



%--------- parametros para la simulacion con operacionales---
R1=10e3;
R2=R1;
R3=R1;
R4=R1;

C1=1000e-6;
C2=C1;
R1c=1/(C1*z);
R2c=1/(C2*p);
R3c=10e3;
R4c=K*R3;

