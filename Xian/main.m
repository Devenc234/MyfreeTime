clear all;
clc;

% data from the table
pressure = [11 , 8.04 ,6.02 ,2.78 ,1.97 ,1.51 ]';
area = [ 10, 15, 25, 40 , 65, 100]';


% plotting the curve
figure;
plot(area,pressure);
title('Subplot 1: Pressure vs Area');
xlabel('Area (inch square)');
ylabel('Measured Pressure (Pa)');


% Plotting pressure vs 1/area
area_inverse = 1./area;
figure;
plot(area_inverse,pressure);
title('Subplot 2: Pressure vs 1/Area');
xlabel('1/Area (inverse inch square)');
ylabel('Measured Pressure (Pa)');



% Using polyfit to calculate the coefficient of the straight line
n=1;    % degree of polynomial
[p,S,mu] = polyfit(area_inverse,pressure,n);


% Coefficient of straight line
fprintf('Coeficient of straight line:\n');
fprintf(' p(x) = %f*x + %f \n ', p(1),p(2));

% What does slope of this line reflect. Show it user friendly
y1 = polyval(p,area_inverse);
figure
plot(area_inverse,pressure,'o')
hold on
plot(area_inverse,y1,'*')
hold on
plot(area_inverse,y1);
hold on
xlabel('1/Area (inverse inch square)');
ylabel('Measured Pressure (Pa)');
title('Comparision of actual data and fitted curve');
legend('actual data','fitted data','polyfitted curve');
% By looking at above graph, we can say that polyfit was not able to perfectly fit
% the curve. It is because it is a least square approach and outlier may
% degrade its accuracy.

f = fit(area_inverse,pressure,'poly1')
plot(f,area_inverse,pressure);


