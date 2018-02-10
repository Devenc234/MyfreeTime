clear all
clc

gamma_distribution(1,2);
gamma_distribution(1,5);
gamma_distribution(1,10);
gamma_distribution(5,1);
gamma_distribution(10,1);
gamma_distribution(10,2);


x=[3 11 22 31 64 92 112 176 259 362]';
y=[2 3 4 5 6 7 8 12 15 21]';
f = fit(x,y,'poly1');
figure;
plot(f,x,y);
eq = getting_equation(f)
legend('data',strcat('fitted curve:',eq));


% part 2
%   chi = chi_from_normal(dof,iteration)

chi1 = chi_from_normal(1,10000);
figure;
histogram(chi1);

chi2 = chi_from_normal(10,10000);
figure;
histogram(chi2);
