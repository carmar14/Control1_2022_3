clc
clear 
close all
Kc=29.87
den=conv([1 0.622816],[1 19.797184]);
den=conv(den,[1 0])
g=tf(Kc*10.32,den)
%%
gl=feedback(g,1);
figure
step(gl)
figure
margin(g)
grid on
[Gm,Pm,wg,Wcp] = margin(g)
wg%2;
%%
wm=wg*0.1
T2=1/wm;
z2=1/T2
MF_d=45;
phi=MF_d+5;
B=(sind(phi)+1)/(1-sind(phi))
p2=1/(B*T2)
%%
z1=0.42984; 
p1=4.2984;
num=conv([1 z1],[1 z2]);
den=conv([1 p1],[1 p2]);
gc=tf(num,den);
s_comp=gc*g;
figure
margin(s_comp)
s_comp_clo=feedback(s_comp,1);
figure
step(s_comp_clo)
title('Respuesta en lazo cerrado del proceso con compensador')

figure
pzmap(s_comp_clo)