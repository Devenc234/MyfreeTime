clear; close all;

% Ask user to provide filename, so code can be tested with any file
% give input as    'data1D.csv'
filename = input('Please enter csv file name \n');
data = dlmread(filename);

min = 20;
max = 80;
reference = data(1,:);
[ rows,cols ] = size(data);

% plotting reference signal
plot(1:100,reference);
title('Reference signal: first 1D signal');
xlabel('signal 1D profile');
ylabel('Signal intensity (a.u.)');

% finding smallest MSE
min_MSE = 100;
index = 2;

for i=2:rows
    new_signal = data(i,:);
    diff_signal = reference - new_signal;
    square_diff_signal = diff_signal.*diff_signal;
    sum_sds = sum( square_diff_signal(min:max));
    MSE = sum_sds/(max-min+1);
    if(min_MSE > MSE)
        min_MSE = MSE;
        index = i;
    end
end

% plotting Best Matched signal
figure;
plot(1:100,reference,1:100,data(index,:));
title('Best-Matched signal');
xlabel('signal 1D profile');
ylabel('Signal intensity (a.u.)');
legend('reference','best-matched');

% finding the average shift during the end-expiration position
shift = zeros(rows,1);
for i=1:rows
    signal = data(i,:);
    shift_range = find(signal>0.3 & signal<0.7);
    shift(i) = round(mean(shift_range));
end
% 20 percentage of 200 rows = 40
sorted_shifts = sort(shift);
avg_shift_EEP = mean(sorted_shifts(1:40));

% Calculate the number of measurements that were performed during the end-expiration phase
count_measurement_during_EEP = 0;
result = zeros(rows,2);
b_count = 1;
n_count = 1;

for i=1:rows
    result(i,1)=shift(i);
    if( (shift(i)<=(avg_shift_EEP+5)) && (shift(i) >= (avg_shift_EEP-5)))
        count_measurement_during_EEP = count_measurement_during_EEP +1;
        result(i,2)=1;
        blue_x(b_count) = i;
        blue_y(b_count) = shift(i);
        b_count = b_count + 1;
    else
    normal_x(n_count) = i;
    normal_y(n_count) = shift(i);
    n_count = n_count + 1;
    end
end

% writing result to a text file
dlmwrite('myFile.txt',result,'delimiter',';');

% Plot the evolution of the shift as a function of time (during the 10s of acquisition)
plot(1:rows,result(:,1)-shift(1))
hold on;
scatter(blue_x,blue_y-shift(1),30,'s','MarkerEdgeColor',[0 0 .5],...
              'MarkerFaceColor',[0 0 .7],...
              'LineWidth',0.5)
hold on;
plot(1:rows,(avg_shift_EEP-5-shift(1))*ones(rows,1),'g')
hold on;
plot(1:rows,(avg_shift_EEP+5-shift(1))*ones(rows,1),'g')
legend('shifts','measurement in EE window','EE window start','EE window end')
% Display the following information: 1) the average shift during the end-expiration window,
% and 2) the number of measurements acquired within the end-expiration window.

fprintf('Average shift in end-experiatory position: %f \n',avg_shift_EEP-shift(1));
fprintf('percentage of measurements within gating window: %f % \n',b_count*100/rows);

