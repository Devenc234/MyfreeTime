clear all;
clc;
% Data from the table
time = [ 0 , 10 , 15 , 20 , 32, 59 , 62 , 125]';
velocity = [ 0 , 56.40 , 97.23 , 136.25 , 226.16 , 403.86 , 440.44 , 1265.23]';


% Fitting data to curve for veloctiy expression
f = fit(time,velocity,'poly4');
plot(f,time,velocity);
legend('data','fitted curve');
title('Velocity vs time');
xlabel('time (s)');
ylabel('velocity (m/s)');

p1 =   1.141e-05;
p2 =   -0.001941 ;
p3 =       0.102;
p4 =       5.417;
p5 =      -1.554;
velo = @(x) p1*x.^4 + p2*x.^3 + p3*x.^2 + p4*x + p5;

% Plotting distance vs time
count = 1;
step = 1;
for i=0:step:125
    t(count,1) = i;
    distance(count,1) =  integral(velo,0,i);
    count = count +1;
end
figure;
plot(t,distance);
title('Distance vs time');
xlabel('time (s)');
ylabel('Distance(m)');

% syms x;
% v =  0.04651*x^2 + 4.123*x + 18.12
% acceleration = diff(v);

% Plotting acceleration vs time
count = 1;
for i=0:step:125
    time(count,1) = i;
    acceleration(count,1) = 4*p1*i^3 + 3*p2*i^2 + 2*p3*i + p4;
    count = count + 1;
end
figure;
plot(time,acceleration);
title('Acceleration vs time');
xlabel('time (s)');
ylabel('Acceleration (m/s^2)');


% Finding min amd max acceleration

min_acc = min(acceleration);
max_acc = max(acceleration);

index_min = find(acceleration == min_acc);
index_max = find(acceleration == max_acc);

distance_at_min = distance(index_min(1));
distance_at_max = distance(index_max(1));

fprintf('\n\n Minimum acceleration = %f m/s^2 at distance = %f meters\n',min_acc,distance_at_min);
fprintf(' Maximum acceleration = %f m/s^2 at distance = %f meters\n',min_acc,distance_at_max);



