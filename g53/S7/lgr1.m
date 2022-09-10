clc
close all
clear

h=tf(1,[1 6 0]);
step(h)

%----lgr-----
figure
rlocus(h);

k=6.82;
s1=-3+sqrt(9-k)
s2=-3-sqrt(9-k)

%----verificar que el polo sea parte del lgr
s=-3+2*i;
ang=-angle(s*(s+6));
ang=rad2deg(ang);
k=abs(s*(s+6))

%---------lazo cerrado----
hcl=feedback(h*k,1);
figure
step(hcl)
figure
pzmap(hcl)