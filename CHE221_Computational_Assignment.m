clc,clear
P = 6.7;
A1 = 8.07131; B1 = 1730.630; C1 = 233.426;
A2 = 8.68508; B2 = 2409.29; C2 = 274.870; 
A12 = 0.9605; A21 = 2.0213;
T = zeros();
x = zeros();
y = zeros();

(* T1 = B1/(A1-log(P))-C1;
T2 = B2/(A2-log(P))-C2; *)

T = 5:0.33:90;
gamma1 = zeros();
gamma2 = zeros();
gamma1 = exp(A12*(A21*(1-x)/(A12*x+A21*(1-x)))^2);
gamma2 = exp(A21*(A12*x./(A12*x+A21*(1-x)))^2);
 for i = 1:length(T)
    Psat1(i) = exp(A1-B1/(C1+T(i)));
    Psat2(i) = exp(A2-B2/(C2+T(i)));    
 end

(*  x = 0:0.01:1; *)

x = (P-Psat2.*gamma2)./(Psat1.*gamma1-Psat2.*gamma2);
y = x.*Psat1.*gamma1/P;
figure
plot(x,T,y,T);
hold on
grid on;
title('Txy diagram: Acrylic and Water');
xlabel('Mole fraction of water');
ylabel('Temperature (in deg C)');
axis([0 1 5 90]);

figure
plot(x,y,'b');
hold on
grid on;
title('xy diagram: Acrylic and Water');
xlabel('Mole fraction of water in liquid phase');
ylabel('Mole fraction in of water Vapour phase');
axis([0 1 0 1]);

T_Exp = [71 54.6 52.4 45.3 43.6 40.7 39.8 39.1 38.5 38.4 38.3 38.2 38.1 38.1];
X1 = [0 0.0996 0.1211 0.3250 0.3936 0.5798 0.6637 0.7420 0.8875 0.9330 0.9568 0.847 0.9936 1];
Y1 = [0 0.4668 0.5308 0.7148 0.7685 0.8476 0.8745 0.9057 0.9391 0.9612 0.9791 0.9884 0.9957 1];
figure
plot(X1,T_Exp,Y1,T_Exp);

hold on
grid on;
title('TXY diagram: Acrylic and Water');
xlabel('Experimental Mole fraction of water in liquid phase');
ylabel('Temperature (in deg C)');

figure
plot(X1,Y1,'b');
hold on
grid on;
title('X1Y1 diagram: Acrylic and Water');
xlabel('Experimental Mole fraction of water in liquid phase');
ylabel('Experimental Mole fraction of water in Vapour phase');

