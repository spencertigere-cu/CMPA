
%Spencer Tigere 101001717
%ELEC 4700 Lab 8

clc
set(0,'DefaultFigureWindowStyle','docked')

%Part 1 
Is=0.01e-12;
Ib=0.1e-12;
Vb=1.3;
Gp=0.1;

I= @(V) Is.*(exp(1.2/0.025.*V)-1)+ Gp.*V-Ib.*(exp(-1.2/0.025.*(V+Vb)-1));
V=linspace(-1.95,0.7,200);
I1=I(V);
IN=I1+I1.*(0.4*rand(1,length(I1))-0.2);

figure(1)
plot(V,IN)

figure(2)
semilogy(V,I1)
hold on;
semilogy(V,IN)
hold off;

%Part 2
P_4=polyfit(V,IN,4);
P_8=polyfit(V,IN,8);

figure(3)
hold on;
plot(V,IN)
plot(V,polyval(P_4,V));
plot(V,polyval(P_8,V));
hold off;
legend('Raw','4O poly','8O poly');

figure(4)
semilogy(V,IN)
hold on;
semilogy(V,abs(polyval(P_4,V)));
semilogy(V,abs(polyval(P_8,V)));
hold off;
legend('Raw','4O poly','8O poly');

%Part 3
x=V;

%a)
fo_a=fittype('A.*(exp(1.2/0.025.*x)-1)+0.1.*x-C.*(exp(-1.2/0.025.*(x+1.3)-1))');
ff_a = fit(V',IN',fo_a);
If_a = ff_a(x);

%b)
fo_b=fittype('A.*(exp(1.2/0.025.*x)-1)+B.*x-C.*(exp(-1.2/0.025.*(x+1.3)-1))');
ff_b = fit(V',IN',fo_b);
If_b = ff_b(x);

%c)
fo_c=fittype('A.*(exp(1.2/0.025.*x)-1)+B.*x-C.*(exp(-1.2/0.025.*(x+D)-1))');
ff_c = fit(V',IN',fo_c);
If_c = ff_c(x);

figure(5)
hold on;
plot(V,IN);
plot(x,If_a);
plot(x,If_b);
plot(x,If_c);
hold off;
legend('Raw','AC','ABC','ABCD');

figure(6)
semilogy(V,IN);
hold on;
semilogy(x,abs(If_a));
semilogy(x,abs(If_b));
semilogy(x,abs(If_c));
hold off;
legend('Raw','AC','ABC','ABCD');