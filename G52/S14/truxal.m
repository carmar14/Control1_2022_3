clc
clear
close all

%-----deseado----
hd=tf(123.2,[1 9.99 123.2]);
step(hd,'r')

num=conv([1 2 0],[1 10])
den=conv([1 2],[1 9.99 123.2]);
den= den-[0 0 0 123.2];
den=100*den;
gc=tf(123.2*num,den);

sis_ol=gc*tf(100,[1 10 0]);
sis_cl=feedback(sis_ol,tf(1,[1 2]));
hold on
step(sis_cl,'--b')

figure
pzmap(sis_cl)

