num = [-0.023,-2.092];
den = [1,-1.408,2.05];

G = tf(num,den);
kcr = -1.408/0.023;
Pcr = 2*pi/sqrt(130.135);

F = feedback(kcr*G,1);

figure(1)
step(F,Pcr:0.01:3*Pcr)


kp = -36.7357;
Ti = 0.2754;
Td = 0.06885;

s = tf('s');
Gc = kp*(1+1/(Ti*s)+Td*s);

F = feedback(Gc*G,1);

figure(2)
step(F)

figure(3)
pzmap(F)

figure(4)
rlocus(Gc*G)