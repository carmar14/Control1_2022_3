clc
clear
close all

%--------proceso---
g=tf(4,[1 0.5 0]);
rlocus(g)
g_r=feedback(g,1);
[p z]=pzmap(g_r)
figure
step(g_r)

hold on

%-----deseado---
wn=5;
e=0.5;
k=1;
sis_d=tf(k*wn^2,[1 2*e*wn wn^2])
[p z]=pzmap(sis_d)
step(sis_d)
legend('Sistema sin compensador','Respuesta deseada')

%--------angulo faltante------
t1=90+atand(2.5/4.33);
t2=90+atand(2/4.33);
t1+t2
af=-180+t1+t2
%angulo del cero para el adelanto
phi=90+atand(2/4.33);
t3=phi-af
x=4.33/tand(t3)


%---------econtrando K----
s1=-2.5+4.33*i;
num=4;
den=s1*(s1+5);
div=abs(num/den);
K=1/div


%----------red de atraso----7

z2=0.2; %0.2
num=s1+z2;
p2=z2/16;
den=s1+p2;
div2=abs(num/den); % verificamos que la magnitud sea
%aprox 1.

%verificamos angulo entre -5° y 0°
t4=90+atand((2.5-p2)/4.33);
phi2=90+atand((2.5-z2)/4.33);
phi2-t4

%-----------controlador completo--

g_c=K*tf([1 0.5],[1 5])*tf([1 0.2],[1 0.0125])

s_c=feedback(g_c*g,1);
[p z] = pzmap(s_c)
step(s_c,'k')

figure
rlocus(g_c*g)

figure
pzmap(s_c)


%-----------amplificadores operacionales
z1=0.5;
p1=5;

C1=10e-6;
C2=C1;
R1c=1/(p1*C1);
R2c=1/(z2*C2);
R3c=1/(z1*C1)-R1c;
R4c=1/(p2*C2)-R2c;

a=R2c*R4c*(R1c+R3c)/(R1c*R3c*(R2c+R4c));
R5c=10e3;
R6c=K*R5c/a;

R1=10e3;
R2=R1;
R3=R1;
R4=R1;
