clc
clear
close all


%-------------sistema de primer orden---------
k = 4;
tao = 2;

h=tf(k,[tao 1]);
figure
subplot(2,1,1)

%---------respuesta en lazo abierto-----------
step(h,'k')
title('Lazo abierto SPO')

%---------respuesta en lazo cerrado-----------
hn = feedback(h,1);
subplot(2,1,2)
step(hn,'r')
%legend('OL','CL')
title('Lazo cerrado SPO')

figure
pzmap(h,'k')
hold on
pzmap(hn,'r')
legend('OL','CL')

%------------nuevo parametros-----------
k_N = k/(1+k)
tao_N = tao/(1+k)

%-------------sistema de segundo orden---------
k = 9;
e = 0.5;
wn = 1;

h=tf(k*wn^2,[1 2*e*wn wn^2]);
figure
subplot(2,1,1)

%---------respuesta en lazo abierto-----------
step(h,'k')
title('Lazo abierto SSO')

%---------respuesta en lazo cerrado-----------
hn = feedback(h,1);
subplot(2,1,2)
step(hn,'r')
%legend('OL','CL')
title('Lazo cerrado SSO')

figure
pzmap(hn,'r')
hold on
pzmap(h,'k')
legend('CL','OL')

%------------nuevo parametros-----------
K_N = k*wn^2/(wn^2+k*wn^2)
e_N = e*wn/(sqrt(wn^2+k*wn^2))
w_N = sqrt(wn^2+k*wn^2)

if (e_N > 0) && (e_N < 1)
    Ts = 4/(e_N*w_N)
end


