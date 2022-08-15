clc
close all
clear

%-------------------criticamente amortiguado------------
e=1;
wn=[1 2 4];
k=4;
figure
for i =1:length(wn)
    h(i)=tf(k*wn(i)^2,[1 2*e*wn(i) wn(i)^2]);
    step(h(i))
    hold on
end

legend('h1','h2','h3')
figure
for i = 1:length(wn)
    pzmap(h(i))
    hold on
end
legend('h1','h2','h3')


%-------------------criticamente amortiguado------------

%-------------------sobre amortiguado------------
wn=1;
e=[1.5 2 4];
k=4;
figure
for i =1:length(e)
    h(i)=tf(k*wn^2,[1 2*e(i)*wn wn^2]);
    step(h(i))
    hold on
end

legend('h1','h2','h3')
figure
for i = 1:length(e)
    pzmap(h(i))
    hold on
end
legend('h1','h2','h3')
%-------------------sobre amortiguado------------


%-------------------sub amortiguado------------
wn=1;
e=[0.1 0.5 0.7];
k=4;
figure
for i =1:length(e)
    h(i)=tf(k*wn^2,[1 2*e(i)*wn wn^2]);
    step(h(i))
    hold on
end

legend('h1','h2','h3')
figure
for i = 1:length(e)
    pzmap(h(i))
    hold on
end
legend('h1','h2','h3')
%-------------------sub amortiguado------------


%--------------------marginalmente------------
wn=[1 2 3];
e=0;
k=4;
figure
for i =1:length(wn)
    h(i)=tf(k*wn(i)^2,[1 2*e*wn(i) wn(i)^2]);
    step(h(i))
    hold on
end
xlim([0 10])
legend('h1','h2','h3')
figure
for i = 1:length(wn)
    pzmap(h(i))
    hold on
end
legend('h1','h2','h3')
%-------------------marginalmente------------