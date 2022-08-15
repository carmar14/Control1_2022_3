clear
close all
clc

%--------------primer orden-------------
k=1;
tao=4;
spo=tf(k,[tao 1]);
subplot(3,1,1)
step(spo)

za = tf([1.9*tao 1],1);
subplot(3,1,2)
step(spo*za)

%figure
%pzmap(spo*za)

pa = tf(1,[0.5*tao 1]);
subplot(3,1,3)
step(spo*pa)

figure
pzmap(spo*za)

%--------------segundo orden-------------
e=0.3;
wn=2;
k=-3;
sso=tf(k*wn^2,[1 2*e*wn wn^2]); 
figure
%subplot(3,1,1)
step(sso,'k')

wn = 1;
sso=tf(k*wn^2,[1 2*e*wn wn^2]); 
hold on
step(sso,'r')

wn = 3;
sso=tf(k*wn^2,[1 2*e*wn wn^2]); 

step(sso,'b')

figure


za = tf([1/200 1],1);  % probar con 10%, 5% 2%
pzmap(sso*za)
%subplot(3,1,2)
step(sso)
hold on
step(sso*za, '.r')

pa = tf(1,[1/0.0009 1]);

figure
%subplot(3,1,3)
step(sso)
hold on
step(sso*pa, '.r')

figure
pzmap(sso*za)



