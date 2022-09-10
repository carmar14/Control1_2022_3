clc
close all
clear

den=conv([1 1 0],[1 8]);
h=tf(1,den);
step(h)

figure
rlocus(h)

k=50;
hcl=feedback(k*h,1)
figure
step(hcl)
figure
pzmap(hcl)

k=1.5;
hcl=feedback(k*h,1)
figure
step(hcl)
figure
pzmap(hcl)

k=72;
hcl=feedback(k*h,1)
figure
step(hcl)
figure
pzmap(hcl)

k=73;
hcl=feedback(k*h,1)
figure
step(hcl)
figure
pzmap(hcl)