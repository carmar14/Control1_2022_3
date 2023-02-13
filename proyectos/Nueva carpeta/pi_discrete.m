clc
close all
clear all


pi = tf([-0.9875 0.1], [1 0])
discreto = c2d(pi,0.01,'Tustin')