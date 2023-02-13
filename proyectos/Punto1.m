D = 0;
P = 1.75;
I = 2.49;

Gp = tf([1.151,0.1774],[1,0.739,0.921,0]);

Gc1 = tf([D,P,I],[1,0]);
Gc2 = tf([1,0.739,0.921],[1,0.1541]);
Gc = Gc2*Gc1;

F = feedback(Gc*Gp,1);

Gd = tf(2.86,[1,2,2.86]);

figure(1)
step(F)
hold on
step(Gd)
hold off

figure(2)
pzmap(F)
hold on
pzmap(Gc*Gp)
hold off

