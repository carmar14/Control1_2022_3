%discretizacion

clc
clear 
close all
ts=0.1;
den=[1 20.42 12.33 0]
g=tf(10.32,den)
step(g)
%% discretizacion
gdis=c2d(g,ts,'tustin')
step(gdis)
%% polos=pole(gdis)
a=-polos(1)
b=-polos(2)
c=-polos(3)
zeros=zero(gdis)
d=-zeros(1)
e=-zeros(2)
f=-zeros(3)
%% adelanto atrazo
kc=29.87
z1=0.42984; 
p1=4.2984;
z2=0.351141039329555
p2=0.046517174423448
num=conv(kc*[1 z1],[1 z2]);
den=conv([1 p1],[1 p2]);
adelanto=tf(num,den)
adelantoatrazo=c2d(adelanto,ts,'tustin')
%% pid
s=tf('s')
pid=6.6771+(4.5325*(100*s)/(s+100))
pidd=c2d(pid,ts,'tustin')
%% algebraico
s=tf('s')
algebraico=(82.11*s*s+1741.46*s+2283.52)/(s*s+37*s+388.63)
algebraicod=c2d(algebraico,ts,'tustin')
