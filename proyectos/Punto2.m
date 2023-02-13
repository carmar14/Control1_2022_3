s = tf('s');

k = -(1.408)*(20)/2.092;

G = tf([-0.023,-2.092],[1,-1.408]);
H = tf(1,[1,20]);

F1 = feedback(k*G,H);

Gc = 2345*(s+18.9)/((0.3096*s^2+34.35*s+563.2)*(s+80));

Gd = 2345/(s^2+80*s+2345);
F2 = feedback(Gc*F1,1);

figure(1)
step(F2)
hold on
step(Gd)
hold off

figure(2)
pzmap(F2)
hold on
pzmap(Gc*G)
hold off