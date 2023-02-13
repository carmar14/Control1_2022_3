%parametro 1 
%ts=4.5 segundos  % Sobreimpulso=1%
clc
clear all
close all
ts=2.5
so=0.18;
zita=sqrt((log(so))^2/(pi^2+(log(so))^2));
wn=5/(zita*ts)
numd=wn^2;
dend=[1 2*zita*wn wn^2]
deseada=tf(numd,dend)
polosdeseados=roots(dend)
deseadisc=c2d(deseada,0.05)


process=tf([1.151 0.1774],[1 0.739 0.921 0])
polos=roots([1 0.739 0.921 0])
conv([1 2.22 1.809],[1 11])
s=tf('s')
controller=(8.27*s)+(0/s)+(20.75)
sistemasincomp=feedback(process,1)
syscomp=feedback(controller*process,1)
step(syscomp,sistemasincomp,10)
%% PUNTO 2
numtwo=[-0.023 -2.092]
dentwo=[1 -1.408]
processtwo=tf(numtwo,dentwo)
sensor=1/(s+20)
truxalcontroller=1.8/((processtwo)*(s^2+2.22*s+1.8-((1.8)/(s+20))))
sistema2compensado=feedback(processtwo*truxalcontroller,sensor)
figure
step(sistema2compensado,10)
grid on
%% PUNTO 3
NUM=[-0.023 -2.092]
DEN=[1 0 -1.408+2.05 0]
sys=tf(NUM,DEN)
s=tf('s')
ziegler=(-30*10^6)+(-30*10^6/(0.0031*s))+((-30*10^6*10000)/(1+(10000/s)))
syscloseloop=feedback(ziegler*sys,1)
figure
step(syscloseloop)
grid on





numdisc=[0.023 0.078]
dendisc=[1 -0.932]
plantadisc=tf(numdisc,dendisc,0.05)

A=[0.932  0.075 0      0;
   -1.932 0.023 0.932  0.075;
   1      0     -1.932 0.023;
   0      0     1      0]
D=[0;0.8187;-1.779;1]
x=inv(A)*D
p0=x(1)
q0=x(2)
p1=x(3)
q1=x(4)
int=tf(1,[1 -1],0.05)
algebraico=tf([q1 q0],[p1 p0],0.05)
sys4comp=feedback(algebraico*int*plantadisc,1);
figure
step(sys4comp)
