clear all
clc

figure;
% %Creating anonymous function
h= @(x)x.*sin(x); 
hh= @(x)2.*x.^3;
x=linspace(-pi/6,pi/3,1000);% -pi/6<x<pi/3

grid on 

% %Generate a graph 
plot(x,h(x),'m');
hold on


% formaiting a plot
xlabel('x-axis')
ylabel('y-axis')
title('Graph Q4 part b')


x0 = [5;5];
options = optimoptions('fsolve','Display','iter');
[x_intercepts,fval] = fsolve(@myfun,x0,options);
first_x = x_intercepts(1)
first_y = x_intercepts(2)

x0 = [-5;5];
options = optimoptions('fsolve','Display','iter');
[x_intercepts,fval] = fsolve(@myfun,x0,options);
second_x = x_intercepts(1)
second_y = x_intercepts(2)

% Shading the area in between
x=linspace(first_x,second_x,100);% -pi/6<x<pi/3
curve1 = x.*sin(x);
curve2 = 2*x.^3;
plot(x, curve1, 'r', 'LineWidth', 2);
hold on;
plot(x, curve2, 'b', 'LineWidth', 2);
x2 = [x, fliplr(x)];
inBetween = [curve1, fliplr(curve2)];
fill(x2, inBetween, 'g');

% To calculate area
syms i
i = linspace(first_x,second_x,1000);
y1 = i.*sin(i);
y2 = 2*i.^3;
area = trapz(i,y2)-trapz(i,y1)

% Exact points of x and y intersection  
% syms x
% Equation2= x.*sin(x)-(x)2.*x.^3;
% solution2=solve(Equation2,x)
% x_intercept(1)=double(solution2);
% x_intercept(2)=-double(solution2); %the graph is not symmetrical. 
% plot(x_intercept,y(x_intercept),'k*')

% 
% %Shade the region enclosed 
% fill(x,h(x),'b')    % fill area defined by lower curve
% fill(x,hh(x),'b') %fill area defined by upper curve
% legend('h=x.*sin(x)','hh=(x) 2.*cos(x)','','Shaded region enclosed')

% %The area of the region bounded by the curves

% Area=int(Equation2)  % I SHOULD ADD BOUNDRY?