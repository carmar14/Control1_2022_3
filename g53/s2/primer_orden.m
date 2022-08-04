clc
close all
clear

%% parametros

k=-0.3;
tau = 0.1;

h= tf(k,[tau 1]);

step(3*h)




