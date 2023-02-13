Ga = tf(50,[1,50]);
Gd = tf(3.93,[1,1.6,3.93]);
Gda = Gd*Ga;

Gdz = c2d(Gda,0.05,'zoh');

A = [0.932,0.078,0,0;...
    -1.932,0.023,0.932,0.078;...
    1,0,-1.932,0.023;
0,0,1,0];

D = Gdz.den{1}(end:-1:1)';

C = A^-1*D;


Gc = tf([C(4),C(2)],conv([C(3),C(1)],[1,-1]),0.05);
Gp = tf([0.023,0.078],[1,-0.932],0.05);

F = feedback(Gc*Gp,1);

figure(1)
step(F)
hold on
step(Gd)
legend('Controlada','Deseada')
hold off

figure(2)
pzmap(F)
hold on
pzmap(Gc*F)
hold off
