clear all
close all
%% Implementacion pid analitico
Gs1=tf([1.151 0.1774],[1 0.739 0.921 0])
s=tf('s')
controladorPID=768.5725+(47.14*s)+(3418/s)
sistema1compensado=feedback(controladorPID*Gs1,1)
figure
step(sistema1compensado,2)
hold on
%% IMPLEMENTACION CONTROLADOR TRUXALL
Gs2=tf([-0.023 -2.092],[1 -1.408])
s=tf('s')
sensor=1/(s+20)
controlTruxal=18.91/...
    (Gs2*(s^2+5*s+18.91-((18.91)/(s+20))))
sistema2compensado=feedback(Gs2*controlTruxal,sensor)
figure
step(sistema2compensado)
%% Implementazion ziegler
proceso3=tf([-0.023 -2.092],[1 0 -1.408+2.05 0])
s=tf('s')
Kp=-3.6
ti=23.09
td=5.77
N=500
ziegler=Kp*(1+(1/(ti*s))+(td*(N/(1+(N/s)))))
sistema3compensado=feedback(proceso3*ziegler,1);
figure
step(sistema3compensado)
%% Controlador algebraico
plantadisc=tf([0.023 0.078],[1 -0.932],50*10^-3)
A=[0.932  0.075 0 0;-1.932 0.023 0.932  0.075;1  0  -1.932 0.023;0 0  1  0]
%deseada= (z^2 - 1.768 z + 0.8187)*z
D=[0;0.8187;-1.783;1]
incognitas=inv(A)*D
p0=incognitas(1)
q0=incognitas(2)
p1=incognitas(3)
q1=incognitas(4)
algebraico=tf([q1 q0],conv([p1 p0],[1 -1]),50*10^-3)%CON INTEGRADOR va aqui no en la planta
sys4comp=feedback(algebraico*plantadisc,1);
figure
step(plantadisc,sys4comp)
grid on

