clc
clear
close all

%-------------parametros del sistema------
K = 2;
tau =[2 4 6];

figure
for i=1:length(tau)
    h(i) = tf (K,[tau(i) 1]);
    step(3*h(i))
    hold on
end
title('Respuesta al escalon')
xlabel('Tiempo')
ylabel('Amplitud')
legend('h_1','h_2', 'h_3')
grid on

figure
for i =1:length(tau)
    pzmap(h(i))
    hold on
end
legend('h_1','h_2', 'h_3')
grid on




