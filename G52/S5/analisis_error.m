clc
clear
close all

%----------sistema tipo 0-------------

G = tf(5,[1 2]);
%G = tf(5/2,[1/2 1]);
H = tf(1,1);

h_0= feedback(G,H);

[y t]=step(h_0);

figure
plot(t,y,'k')
r = ones(length(y),1);
hold on
plot(t,r, 'r')
ylim([0 1.1])
grid on
xlabel('time(s)')
ylabel('y')
title('Respuesta al escalón')
legend('y','r')

%x = [1,1]/1.4;
%y = [0.93,0.7]/1.1;
%a = annotation('doublearrow',x,y,'$e_{ss}=\frac{1}{1+k}$','Interpreter','latex');%,'X',[1.1/1.4 1.1/1.4],'Y',[0.8 0.8]/1.1);
%a.X=[1.1,1.1]/1.4;
%a.Y=[0.8,0.7]/1.1;
%x = [1.1,1.1]/1.4;
%y = [0.8,0.7]/1.1;
%a = annotation('textarrow',x,y,'String',);%, 'Position',[0.2 0.2 0.3 0.1]);

%------respuesta a la rampa-----


[y t]=step(h_0*tf(1,[1 0])); %agrego un polo para usar step
x=1*t;

figure
plot(t,y,'k')
hold on
plot(t,x, 'r')
ylim([0 1.5])
%xlim([0 1.4])
grid on
xlabel('time(s)')
ylabel('y')
title('Respuesta a la rampa')
legend('y','r')

%------respuesta a la parabola-----
[y t]=step(h_0*tf(1,[1 0 0])); %agrego dos polos para usar step
x=0.5*t.^2;

figure
plot(t,y,'k')
hold on
plot(t,x, 'r')
ylim([0 1.5])
%xlim([0 1.4])
grid on
xlabel('time(s)')
ylabel('y')
title('Respuesta a la parábola')
legend('y','r')

%$e_{ss}=\infty$


%----------sistema tipo 1-------------

G = tf(5,[1 2 0]);
%G = tf(5/2,[1/2 1]);
H = tf(1,1);

h_0= feedback(G,H);

[y t]=step(h_0);

figure
plot(t,y,'k')
r = ones(length(y),1);
hold on
plot(t,r, 'r')
%ylim([0 1.1])
grid on
xlabel('time(s)')
ylabel('y')
title('Respuesta al escalón')
legend('y','r')

%x = [1,1]/1.4;
%y = [0.93,0.7]/1.1;
%a = annotation('doublearrow',x,y,'$e_{ss}=\frac{1}{1+k}$','Interpreter','latex');%,'X',[1.1/1.4 1.1/1.4],'Y',[0.8 0.8]/1.1);
%a.X=[1.1,1.1]/1.4;
%a.Y=[0.8,0.7]/1.1;
%x = [1.1,1.1]/1.4;
%y = [0.8,0.7]/1.1;
%a = annotation('textarrow',x,y,'String',);%, 'Position',[0.2 0.2 0.3 0.1]);

%------respuesta a la rampa-----

[y t]=step(h_0*tf(6,[1 0])); %agrego un polo para usar step
x=6*t;

figure
plot(t,y,'k')
hold on
plot(t,x, 'r')
%ylim([0 1.5])
xlim([0 10])
grid on
xlabel('time(s)')
ylabel('y')
title('Respuesta a la rampa')
legend('y','r')

%------respuesta a la parabola-----

[y t]=step(h_0*tf(1,[1 0 0])); %agrego dos polos para usar step
x=0.5*t.^2;

figure
plot(t,y,'k')
hold on
plot(t,x, 'r')
%ylim([0 1.5])
xlim([0 10])
grid on
xlabel('time(s)')
ylabel('y')
title('Respuesta a la parábola')
legend('y','r')

%$e_{ss}=\infty$

%----------sistema tipo 2-------------

G = tf(5,[1 12])*tf([1 1],[1 0 0])*tf(1,[1 5]);
%G = tf(5/2,[1/2 1]);
H = tf(1,1);

h_0= feedback(G,H);

[y t]=step(h_0);

figure
plot(t,y,'k')
r = ones(length(y),1);
hold on
plot(t,r, 'r')
%ylim([0 1.1])
grid on
xlabel('time(s)')
ylabel('y')
title('Respuesta al escalón')
legend('y','r')

%x = [1,1]/1.4;
%y = [0.93,0.7]/1.1;
%a = annotation('doublearrow',x,y,'$e_{ss}=\frac{1}{1+k}$','Interpreter','latex');%,'X',[1.1/1.4 1.1/1.4],'Y',[0.8 0.8]/1.1);
%a.X=[1.1,1.1]/1.4;
%a.Y=[0.8,0.7]/1.1;
%x = [1.1,1.1]/1.4;
%y = [0.8,0.7]/1.1;
%a = annotation('textarrow',x,y,'String',);%, 'Position',[0.2 0.2 0.3 0.1]);

%------respuesta a la rampa-----


[y t]=step(h_0*tf(6,[1 0])); %agrego un polo para usar step
x=6*t;

figure
plot(t,y,'k')
hold on
plot(t,x, 'r')
%ylim([0 1.5])
xlim([0 200])
grid on
xlabel('time(s)')
ylabel('y')
title('Respuesta a la rampa')
legend('y','r')

% create a new pair of axes inside current figure
axes('position',[.65 .175 .25 .25])
box on % put box around new pair of axes
indexOfInterest = (t < 200) & (t > 198); % range of t near perturbation
plot(t(indexOfInterest),y(indexOfInterest),'k') % plot on new axes
hold on
plot(t(indexOfInterest),x(indexOfInterest),'r') % plot on new axes
grid on

%------respuesta a la parabola-----

[y t]=step(h_0*tf(1,[1 0 0])); %agrego dos polos para usar step
x=0.5*t.^2;

figure
plot(t,y,'k')
hold on
plot(t,x, 'r')
%ylim([0 1.5])
xlim([0 200])
grid on
xlabel('time(s)')
ylabel('y')
title('Respuesta a la parábola')
legend('y','r')

% create a new pair of axes inside current figure
axes('position',[.65 .175 .25 .25])
box on % put box around new pair of axes
indexOfInterest = (t < 200) & (t > 198); % range of t near perturbation
plot(t(indexOfInterest),y(indexOfInterest),'k') % plot on new axes
hold on
plot(t(indexOfInterest),x(indexOfInterest),'r') % plot on new axes
grid on

%$e_{ss}=\infty$