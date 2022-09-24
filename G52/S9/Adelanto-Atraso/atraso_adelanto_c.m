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
so=0.163;
Ts=1.6;
e=sqrt((log(so))^2/(pi^2+(log(so))^2));
wn=4/(Ts*e);
% wn=5;
% e=0.5;
% so = 100*exp(-e*pi/sqrt(1-e^2))
% Ts= 4/(e*wn)
k=1;
sis_d=tf(k*wn^2,[1 2*e*wn wn^2])
[p z]=pzmap(sis_d)
step(sis_d)
legend('Sistema sin compensador','Respuesta deseada')

%--------angulo faltante------
s1=p(1); %polo deseado
ang = rad2deg(angle(4/(s1*(s1+0.5))));
t1=90+atand(2.5/4.33);
t2=90+atand(2/4.33);
t1+t2
angf=180-ang;%-180+t1+t2
%---------encontrando el cero y el polo---
phi = rad2deg(angle(s1+0.5));%110; %114.7966; %angulo del cero 
theta = phi-angf; %angulo del polo para completar lo que falta
if phi<=90
    x1=imag(s1)/tand(phi);
    x2=imag(s1)/tand(theta);
    z=x1+abs(real(s1));  %funciona si se ubica el cero por debajo o al lado izquierdo del polo deseado
    p=x2+abs(real(s1));
else
    x1=imag(s1)/tand(180-phi);
    x2=imag(s1)/tand(theta);
    z=abs(real(s1))-x1;
    p=x2+abs(real(s1));    
end
z1=z;
p1=p;
% phi=90+atand(2/4.33);
% t3=phi-af
% x=4.33/tand(t3)
%---------encontrando el cero y el polo---

%---------econtrando K----
num=4*(s1+z1);
den=s1*(s1+0.5)*(s1+p1);
div=abs(num/den);
K=1/div;


%----------red de atraso----
Kvd=80;
razon=Kvd/(8*K*z1/p1);
p2=0.002;
z2=p2*razon;%0.2; %0.2
num=s1+z2;
% p2=z2/16;
den=s1+p2;
div2=abs(num/den); % verificamos que la magnitud sea
%aprox 1.

%verificamos angulo entre -5° y 0°
ang2=rad2deg(angle((s1+z2)/(s1+p2)));
%---------documento---
% t4=90+atand((2.5-p2)/4.33);
% phi2=90+atand((2.5-z2)/4.33);
% phi2-t4

%-----------controlador completo--

g_c=K*tf([1 z1],[1 p1])*tf([1 z2],[1 p2]);%K*tf([1 0.5],[1 5])*tf([1 0.2],[1 0.0125])

s_c=feedback(g_c*g,1);
[p z] = pzmap(s_c)
step(s_c,'k')

figure
rlocus(g_c*g)

figure
pzmap(s_c)


%-----------amplificadores operacionales

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
