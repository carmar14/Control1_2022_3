clc
close all
clear 

R=200;
L= 0.001;
C= 0.0001;

H=tf(1,[L*C R*C 1]);
step(H)
