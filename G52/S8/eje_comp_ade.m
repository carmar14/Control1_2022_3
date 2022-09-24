clc
clear
close all

%---------sistema en lazo abierto---
g=tf(1,[1 3 2 0])
step(g)
title('Respuesta al escalón en lazo abierto')
%---------sistema en lazo abierto---
gcl=feedback(g,1); % sistema sin compensador en lazo cerrado
figure
step(gcl)
title('Respuesta al escalón en lazo cerrado sin compensar')
figure
rlocus(g)


%----------polos deseados-----------
so=0.14;
Ts=8;
e=sqrt((log(so))^2/(pi^2+(log(so))^2));
wn=4/(Ts*e);
hd=tf(wn^2,[1 2*e*wn wn^2]);
figure
step(gcl,'b')
hold on
step(hd,'r')
title('Respuesta al escalón en lazo cerrado')
legend('Lazo cerrado sin compensar','Deseado')
[p z] =pzmap(hd)

s1=p(1);
s2=p(2);

%---------sistema en lazo abierto con G_c(s)=(s+z)/(s+p)---
%----------Encontrando angulo faltante------
ang = rad2deg(angle(1/(s1*(s1^2+3*s1+2))));
angf= 180-ang;
phi=90; %90 70 60 57.97
theta=phi-angf;
%---------encontrando el cero y el polo---
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


% z=x1+abs(real(s1));
% p=x2+abs(real(s1));

gc=tf([1 z],[1 p]);
ol=gc*g;
figure
rlocus(ol)
%---------sistema en lazo abierto con G_c(s)---

%---------encontrando la ganancia----
num=s1+z;
den=s1*(s1^2+3*s1+2)*(s1+p);
div=abs(num/den);
K=1/div;
%---------encontrando la ganancia----

%-------controlador completo----
gc=K*gc;
%-------controlador completo----
sc=gc*g; % sistema completo en lazo abierto
cl=feedback(sc,1) % sistema compensado en lazo cerrado

figure
step(cl,'k')
hold on
step(gcl,'b')
step(hd,'.r')
title('Respuesta al escalon')
legend('Sistema compensado', 'Sistema no compensado', 'Sistema deseado')

figure
subplot(1,2,1)
pzmap(gcl,'b')
title('Sistema no compensado')
subplot(1,2,2)
pzmap(cl,'k')
title('Sistema compensado')
%----------compensador usando operacionales-------
%comparador
R1=10e3;
R2=R1;
R3=R1;
R4=R1;
%------red de adelanto-atraso-----
C1=10e-6;
C2=C1;
R1c=1/(z*C1);
R2c=1/(p*C2);
R3c=10e3;
R4c=K*R3c;


