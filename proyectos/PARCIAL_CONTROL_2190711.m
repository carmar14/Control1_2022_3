%------------------------------------------------------------------------------------------------------------
%PRIMER PUNTO

%REQUISITOS
%Ts = 11
%Mp < 7% 

%---------------------------------------------------
%METODO ANALITICO                                  |
%---------------------------------------------------
clc
close all
clear

% Funcion de la planta

Ft=tf([1.151 0.1774],[1 0.739 0.921 0]);

%             1.151s^1 + 0.1774
% Ft=    ---------------------------
%        [s^3 + 0.739s^2 + 0.921^1])

step(Ft,'k')
Ft_LC=feedback(Ft,1);
figure
step(Ft_LC,'r')

% Funcion Deseada

Ts=11;
Mp=0.05;
e=sqrt((log(Mp))^2/(pi^2+(log(Mp))^2));
wn=4/(Ts*e);
Fdes=tf(wn^2,[1 2*e*wn wn^2]);

%                  0.2777
% Fdes=  --------------------------
%        [s^2 + 0.7273^1 + 0.2777])

[P Z]=pzmap(Fdes)

%  -0.3636 + 0.3813i
%  -0.3636 - 0.3813i

%     Aumento de orden (Para comparacion)
Fdes_den=[1 2*e*wn wn^2];
pol_a=conv(Fdes_den,[1 3.636])
%                    Polo aumentado x10  

%------------------------------------
%     Diseño de controlador (PD)    |
%------------------------------------

KpPD=1.2872;
TdPD=3.6242/(1.151*KpPD);
Fc=tf([KpPD*TdPD KpPD],1);

sis_LAPD=Fc*Ft;
sis_LCPD= feedback(sis_LAPD,1);

figure
step(sis_LCPD,'k')
hold on
step(Fdes,'r')
legend('CompensadoPD','Deseado')

%------------------------------------
%     Diseño de controlador (PI)    |
%------------------------------------

KpPI=16.3559;
TiPI=1.5795;

Fc2=tf([KpPI*TiPI KpPI],[TiPI 0])

sis_LAPI=Fc2*Ft;
sis_LCPI=feedback(sis_LAPI,1);

figure
step(sis_LCPI,'b')
hold on
step(Fdes,'r')
legend('CompensadoPI','Deseado')
%------------------------------------------------------------------------------------------------------------
%%
%SEGUNDO PUNTO

%REQUISITOS
%Ts<0.02 Ts=0.01;
%Mp<15% Mp=0.14;

%---------------------------------------------------
%METODO TRUXAL                                     |
%---------------------------------------------------
clc
close all
clear

% Funcion Deseada
Ts=0.01;
Mp=0.14;
e=sqrt((log(Mp))^2/(pi^2+(log(Mp))^2));
wn=4/(Ts*e);
%      Funcion deseada |Fdes|
Fdes=tf(wn^2,[1 2*e*wn wn^2]) 

%                5.685e05
% Fdes=  --------------------------
%        [s^2 + 800S^1 + 5.685e05])

%      Polos del sistema deseado
[P Z]=pzmap(Fdes) 


%        Operaciones de la formula de Truxal [CONVOLUCIONES]

%               -0.023s -2.092
% Fplanta=  --------------------------
%                [S^1 - 1.408]

%                  1
% Fsensor=    -----------
%                 s+20
num=conv([1 -1.408],[1 20])
%         PLANTA     SENSOR
den=conv([1 20],[1 800 5.685e05]);
%         SENSOR     DESEADA
den=den-[0 0 0 5.685e05];
%         RESTA (METODO TRUXAL)
den= conv([-0.023 -2.092],den);
%         PLANTA(NUM)     [SENSOR*DESEADA]
gc=tf(5.685e05*num,den);


sis_ol=gc*tf([-0.023 -2.092],[1 -1.408]);


%        Sistema Controlado LC

sis_cl=feedback(sis_ol,tf(1,[1 20]));
figure
step(Fdes,'r')
hold on
step(sis_cl,'--b')
legend('Sistema Deseado','Sistema Controlado LC')
title(['Respuesta del sistema'])

%        Polos y ceros sistema controlado

figure
pzmap(sis_cl)
title('Polos y ceros SC LC')
%------------------------------------------------------------------------------------------------------------
%%
%TERCER PUNTO

%---------------------------------------------------
%METODO Ziegler Nichols                            |
%---------------------------------------------------
%ASUMIENDO QUE EL PUNTO 2 TIENE COMO DENOMINADOR [1 0 -1.408+2.05 0]
clc; 
clear; 
close all;

numft=[-0.023 -2.092];
denft=[1 0 -1.408+2.05 0];
ft=tf(numft,denft);
clf,rlocus(ft);
%Se usa rloc find para sacar el mapa de polos y ceros y de ahi extraer los
%valores(Kcr, Wm) para continuar con los calculos del diseño del PID 
[Kcr,pole]=rlocfind(ft)
Wm=max(imag(pole))

kp=0.6*Kcr;
kd=(kp*pi)/(4*Wm);
ki=(kp*Wm)/pi;

numc=[kd kp ki];
denc=[1 0];
ftc=tf(numc,denc)
ftpc=ftc*ft

FTPC=feedback(ftpc,1)
step(FTPC,'r') 
hold on
ft_LC=feedback(ft,1)
step(ft_LC,'g') 
legend('Funcion controlada','Funcion LC')

%% 
% CODIGO DE LA CLASE
clc
close all
clear
num = [-0.023 -2.092];
den = [1 0 -1.408+2.05 0];
g = tf(num,den)

figure
rlocus(g)
%K_cr se saca de el mapa de polos y ceros, este equivale a la ganancia en
%el momento que los polos se encuentran en el eje imaginario
K_cr=0.03;
Wm=4.1111;
%se procede a calcular los valores de Kp, Ti, Td (Formulas extraidas de tablas)
K_p=0.6*K_cr;
T_i=(K_p*Wm)/pi;
T_d=(K_p*pi)/(4*Wm);
%se establece la ecuacion del controlador
g_c=tf([K_p*T_i*T_d K_p*T_i K_p], [T_i 0]); 
sis_ol=g_c*g;
sis_cl=feedback(sis_ol,1);

figure
hold on
step(sis_cl,'--k')
legend('PID')
title('Segundo método')

%%
%ASUMIENDO QUE EL PUNTO 2 TIENE COMO DENOMINADOR [1 -1.408 2.05 0]
clc; 
clear; 
close all;

numft=[-0.023 -2.092];
denft=[1 -1.408 2.05 0];
ft=tf(numft,denft);
clf,rlocus(ft);
[Kcr,pole]=rlocfind(ft)
Wm=max(imag(pole))

kp=0.6*Kcr;
kd=(kp*pi)/(4*Wm);
ki=(kp*Wm)/pi;

numc=[kd kp ki];
denc=[1 0];
ftc=tf(numc,denc)
ftpc=ftc*ft

FTPC=feedback(ftpc,1)
step(FTPC,'r') 
hold on
ft_LC=feedback(ft,1)
step(ft_LC,'g') 
legend('Funcion controlada','Funcion LC')

%% CODIGO DE LA CLASE
clc; 
clear; 
close all;
num = [-0.023 -2.092];
den = [1 -1.408 2.05 0];
g = tf(num,den)


figure
rlocus(g)

K_cr=1.35;
Wm=6.21;
K_p=0.6*K_cr;
T_i=(K_cr*Wm)/pi;
T_d=(K_cr*pi)/(4*Wm);

g_c=tf([K_p*T_i*T_d K_p*T_i K_p], [T_i 0]); 
sis_ol=g_c*g;
sis_cl=feedback(sis_ol,1);

figure
hold on
step(sis_cl,'--k')
legend('PID')
title('Segundo método')
%-------------------------------------------------------------------------------------------------------------------------------
%CONCLUSION : El metodo no es aplicable :u
%-------------------------------------------------------------------------------------------------------------------------------
%%
%CUARTO PUNTO
%---------------------------------
% METODO ALGEBRAICO DISCRETIZADO |
%---------------------------------

%REQUISITOS
% 1 < Ts < 5       | Ts=3;
% 10% < Mp < 30%   | Mp=25%;
% Tm=50ms
% Matriz
clc; 
clear; 
close all;

A=[ 0.932  0.075  0      0     ;
   -1.932  0.023  0.932  0.075 ;
    1      0     -1.932  0.023 ;
    0      0      1      0     ]

D=[0;0.8187;-1.779;1]

x=inv(A)*D
p0=x(1)
q0=x(2)
p1=x(3)
q1=x(4)

ft=tf([0.023 0.075],[1 -0.932],0.05);

%             0.023z^1 + 0.075
% Ft=    ---------------------------
%                   z - 0.932

Ftc=tf([q1 q0],conv([1 p0],[1 -1]),0.05);

%             1.794z^1 - 1.389
% Ft=    ---------------------------
%           z^2 - 0.8883z^1 - 0.1117

figure
sys_LC=feedback(ft*Ftc,1)
step(sys_LC,ft)
legend('F CompensadoPD','F Planta')
title('Respuesta del sistema')
%----------------------------------------------------------------------------------------------------------------------------------
