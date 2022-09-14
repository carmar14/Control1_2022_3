clc
clear
close all

tao= 1;
h=tf(1,[tao 1]);
subplot(1,3,1)
rlocus(h)
title('LGR de $F(s)=\frac{1}{\tau s +1}$','Interpreter','latex')


%---------polos adicionales---------
tao = 1/2;
h2=tf(1,[tao 1]);
subplot(1,3,2)
rlocus(h*h2)
title('LGR de $F(s)=\frac{1}{(\tau_1 s +1)(\tau_2 s +1)}$','Interpreter','latex')

tao = 2;
h3=tf(1,[tao 1]);
subplot(1,3,3)
rlocus(h*h2*h3)
title('LGR de $F(s)=\frac{1}{(\tau_1 s +1)(\tau_2 s +1)(\tau_3 s +1)}$','Interpreter','latex')

%---------polos adicionales---------

%---------ceros adicionales---------
tao = 1/1.5;
hz=tf([tao 1],1);
figure
subplot(1,3,1)
rlocus(hz*h*h2*h3)
title('LGR de $F(s)=\frac{\tau_z+1}{(\tau_1 s +1)(\tau_2 s +1)(\tau_3 s +1)}$','Interpreter','latex')

tao = 1/4;
hz=tf([tao 1],1);
subplot(1,3,2)
rlocus(hz*h*h2*h3)
title('LGR de $F(s)=\frac{\tau_z+1}{(\tau_1 s +1)(\tau_2 s +1)(\tau_3 s +1)}$','Interpreter','latex')

tao = 1/0.1;
hz=tf([tao 1],1);
subplot(1,3,3)
rlocus(hz*h*h2*h3)
title('LGR de $F(s)=\frac{\tau_z+1}{(\tau_1 s +1)(\tau_2 s +1)(\tau_3 s +1)}$','Interpreter','latex')


%---------ceros adicionales---------

% tao = 10;
% h4=tf(1,[tao 1]);
% figure
% rlocus(h*h2*h3*h4)

