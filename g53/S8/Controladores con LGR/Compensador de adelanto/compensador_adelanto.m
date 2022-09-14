clc
clear
close all

%---------sistema en lazo abierto---
g=tf(4,[1 2 0]);
rlocus(g)
figure
g_cl=feedback(g,1);
step(g_cl)
%---------sistema en lazo abierto---

%----------polos deseados-----------
s1=-2+2*sqrt(3)*i;
s2=-2-2*sqrt(3)*i;
den=conv([1 -s1],[1 -s2]);
hd=tf(den(3),den);
figure
step(hd)
legend('Sistema deseado')


%---------sistema en lazo abierto con G_c(s)=(s+z)/(s+p)---
%----------Encontrando angulo faltante------
ang = rad2deg(angle(4/(s1*(s1+2))));
angf= 180-ang;
phi=90;
theta=phi-angf;

% phi=90;
% theta=phi-angf;
%---------encontrando el cero y el polo---
x1=imag(s1)/tand(phi);
x2=imag(s1)/tand(theta);
z=x1+abs(real(s1));
p=x2+abs(real(s1));


gc=tf([1 z],[1 p]);
ol=gc*g;
%----verificamos condicion del angulo---
ang = rad2deg(angle(4*(s1+z)/(s1*(s1+2)*(s1+p))));
figure
rlocus(ol)
%---------sistema en lazo abierto con G_c(s)---


%---------encontrando la ganancia----

num=4*(s1+z);
den=s1*(s1+2)*(s1+p);
%num=4*(s1/3.26+1);
%den=s1*(s1+2)*(s1/6.13+1);
div=abs(num/den);
%K=5.061;
K=1/div;
%---------encontrando la ganancia----

%-------controlador completo----
gc=K*gc;
%-------controlador completo----
sc=gc*g; % sistema completo en lazo abierto
cl=feedback(sc,1) % sistema compensado en lazo cerrado
sis=feedback(g,1); % sistema sin compensador en lazo cerrado
figure
step(cl,'k')
hold on
step(sis,'b')
step(hd,'.r')
title('Respuesta al escalon')
legend('Sistema compensado', 'Sistema no compensado', 'Sistema deseado')

figure
subplot(1,2,1)
pzmap(sis,'b')
title('Sistema no compensado')
subplot(1,2,2)
pzmap(cl,'k')
title('Sistema compensado')
%----------compensador usando operacionales-------

R1=30.67e3;
R2=16.31e3;
R3=10e3;
R4=50.061e3;
C1=10e-6;
C2=C1;

K_c=R4*C1/(R3*C2);
z=1/(R1*C1);
p=1/(R2*C2);
Gc=tf(K_c*[1 z],[1 p]);
s_con=feedback(Gc*g,1)
figure
step(s_con,'k')
hold on
step(sis,'b')

title('Respuesta al escalon-Controlador implementado con operacionales')
legend('Sistema compensado', 'Sistema no compensado')


%-----------otra red de adelanto------

%---------sistema en lazo abierto con G_c(s)---
gc_2=tf([1 8],1);

ol=gc_2*g;
figure
rlocus(ol)
%---------sistema en lazo abierto con G_c(s)---


%---------encontrando la ganancia----
s1=-2+2*sqrt(3)*i;
num=4*(s1+8);
den=s1*(s1+2);
%num=4*(s1/3.26+1);
%den=s1*(s1+2)*(s1/6.13+1);
div=abs(num/den);
K=1/div;

%---------encontrando la ganancia----

sc=K*ol; % sistema completo en lazo abierto
cl=feedback(sc,1) % sistema compensado en lazo cerrado
sis=feedback(g,1); % sistema sin compensador en lazo cerrado
figure
step(cl,'k')
hold on
step(sis,'b')
step(hd,'.r')
title('Respuesta al escalon')
legend('Sistema compensado', 'Sistema no compensado', 'Sistema deseado')

figure
subplot(1,2,1)
pzmap(sis,'b')
title('Sistema no compensado')
subplot(1,2,2)
pzmap(cl,'k')
title('Sistema compensado')
%----------compensador usando operacionales-------

C=10e-6;
R3=10e3;
R4=10e3;
R1=1/(8*C);
R2=K/C;%C*K*R1^2;

K_c=R4*R2*C/(R3);%R4*R2/(R1^2*R3*C);
z=1/(R1*C);
Gc=tf(K_c*[1 z],1);
s_con=feedback(Gc*g,1);
figure
step(s_con,'k')
hold on
step(sis,'b')
title('Respuesta al escalon-Controlador implementado con operacionales')
legend('Sistema compensado', 'Sistema no compensado')



