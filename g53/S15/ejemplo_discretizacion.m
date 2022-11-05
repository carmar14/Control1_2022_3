clc
clear
close all

g=tf(1,[2.5 1])
step(g,'k')
T=1;
g1=tf(0.4,[1 -0.6],T);
g2=tf([0.2857 0],[1 -0.7143],T);
g3=tf([0.1667 0.1667],[1 -0.6667],T);

hold on
step(g1,'r')
step(g2,'b')
step(g3,'--r')
legend('continua','euler adelanto','euler atraso','Tustin')