clc
clear
close all


%------proceso
den=conv([1 0],[1 1]);
den= conv([0.5 1], den);
g=tf(1,den);
g_cl=feedback(g,1);
step(g_cl)
title('Respuesta en lazo cerrado del proceso sin compensador')


%---------encontrar el MF y MG de K*G(s)
K=5;
g1=K*g;
figure
margin(g1)

%-------se encuentra la nueva frecuencia de cruce de ganancia---
MFd=40;
MF= -180+MFd+12;
w=0.46;%0.56;%0.63;

%-------a partir de w se encuentra la ubicacion del cero y el polo--
%---G_c(s)=Kc*(s+z)/(s+p)---> z=1/T, p=-1/(BT) 
% selecionar un w una decada antes de la frecuencia de cruce de ganancia
w=w*0.1;
T=1/w;
z=1/T;
%calcular B---- -20log(B)=db necesarios para llevar la magniutd a 0 db en
%la nueva frecuencia de cruce de ganancia
%%-20log(B)=-16;
%%-20log(B)=-17;  sumando 5° al MF
%%-20log(B)=-19;  sumando 12° al MF
B=10^(19.5/20);
p=1/(T*B);
Kc=K/B;
gc=Kc*tf([1 z],[1 p]);

s_comp=gc*g;
figure
margin(s_comp)
s_comp_clo=feedback(s_comp,1);
figure
step(s_comp_clo)
title('Respuesta en lazo cerrado del proceso con compensador')


figure
step(s_comp_clo,'k')
hold on
step(g_cl,'b')
legend('compensado','no compensado')

figure
pzmap(s_comp_clo)



