clear all;
clc;

x=[-10:0.01:10];
y=3*x-5;
plot(x,y, 'r', 'linewidth' , 1), hold on, grid on, box on
axis([-5.0 5.0 -10 10])
 
x_2=[-10:0.01:10];
y_2=2*x_2.^4 +3;
plot(x_2,y_2, 'b', 'linewidth' , 1),grid on, hold on
 
x_3=[-10:0.01:10];
y_3=5*x_3.^2 -7;
plot(x_3,y_3, 'k', 'linewidth' , 1), grid on, box on
 
% formaiting a plot
xlabel('x-axis')
ylabel('y-axis')
title('Graph Q1')

%%

%for 0<= x <= 1
f_1 = @(x) pi*(3*x-5).^2;
volume_1 = integral(f_1, 0, 1)
 
%for 1<= x <= 4
f_2 = @(x) pi*(2*(x.^4)+3).^2;
volume_2 = integral(f_2, 1, 4)
 
%for 4< x <= 5
f_3 = @(x) pi*(5*(x.^2)-7).^2;
volume_3 = integral(f_3, 4, 5)
 
f_final = volume_1 + volume_2 + volume_3