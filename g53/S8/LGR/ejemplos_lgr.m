clc
clear 
close all

%--------ejemplo con ceros-------
f=tf([1 1],[1 3 0 0]);
rlocus(f)
title('LGR de $F(s)=\frac{s+1}{s^2(s+3)}$','Interpreter','latex')

f=tf([1 3],[1 2 0]);
figure
rlocus(f)
title('LGR de $F(s)=\frac{s+3}{s(s+2)}$','Interpreter','latex')


f=tf([1 3],[1 2 0])*tf([1 3],1);
figure
rlocus(f)
title('LGR de $F(s)=\frac{(s+3)^2}{s(s+2)}$','Interpreter','latex')

a= conv([1 0],[1 4]);
b= conv(a,[1 6]);
c= conv(b,[1 1.4 1]);
f=tf([1 2 4],c);
figure
rlocus(f)
title('LGR de $F(s)=\frac{s^2+2s+4}{s(s+4)(s+6)(s^2+1.4s+1)}$','Interpreter','latex')
xlim([-10 2]);
ylim([-5 5]);


%--------otros ejemplos--------------
%--------tabla 6.1 libro de Ogata(pag 337)----
a=[1 1];
b=[1 3];
c=[1 4];
den= conv(a,b);
den = conv(den,c);
h=tf(1,den);
figure
subplot(4,3,1)
rlocus(h);

den=conv([1 1-2*i],[1 1+2*i]);
h=tf([1 0.5],den);
subplot(4,3,7)
rlocus(h);


den=conv([1 1],[1 0]); %(s+1)(s)
num=conv([1 2],[1 3]); %(s+2)(s+3) 
h=tf(num,den);
subplot(4,3,12)
rlocus(h);



