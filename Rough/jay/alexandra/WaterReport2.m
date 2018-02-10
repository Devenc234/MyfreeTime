clc;
clear all;

% Given information
customer = 3;
metersize = 1.5;

% Reading data from xlsx file
filename = 'WaterUsage.xlsx';
waterusage1 = xlsread(filename,1);
waterusage2 = xlsread(filename,2);

% calculating AWC for consumer 3
[A B C_awc ] = AWC(waterusage1);
Month = [ "January","February","March","April","May","June","July","Auguust","September","October","November","December"];


% Calculating charges for period Mar2015-Feb2016
for i = 1:length(waterusage2)
    if(waterusage2(i,1)==customer)
        month = waterusage2(i,2);
        KgalUsage(month,1) = waterusage2(i,3);
        WaterCharge(month,1) = round(WaterCharge(metersize,C_awc,KgalUsage(month,1),month),2);  
    end
end

% calculating summer billing
avgSummerBill = mean(KgalUsage(3:8,1));
avgSummerConsumption = mean(WaterCharge(3:8,1));


% calculating winter billing
avgWinterBill = mean(str2double(winterBilling(:,2)));
avgWinterConsumption = mean(str2double(winterBilling(:,3)));


% Printing Summer Billing

fprintf('Summer Billing:\n');
fprintf('   Month   Usage    Bill \n');
fprintf('  ======= =======  ====== \n');
for i=1:6
    fprintf(' %8s  %5.2f  $%5.2f \n',summerBilling(i,1),str2double(summerBilling(i,2)),str2double(summerBilling(i,3)));
end
fprintf('Average summer bill = $%.2f \n',avgSummerBill);
fprintf('Average summer consumption = %.2f kgal',avgSummerConsumption);


% Printing Winter Billing

fprintf('\n\nWinter Billing:\n');
fprintf('   Month     Usage    Bill \n');
fprintf('  =======   =======  ====== \n');

for i=1:6
fprintf(' %10s  %5.2f  $%5.2f \n',winterBilling(i,1),str2double(winterBilling(i,2)),str2double(winterBilling(i,3)));
end
fprintf('Average Winter bill = $%.2f \n',avgWinterBill);
fprintf('Average Winter consumption = %.2f kgal',avgWinterConsumption);


% Plotting bar graph
waterConsumption = str2double(summerBilling(:,2));
waterConsumption(7:12) = str2double(winterBilling(:,2));
figure;
title('Water Consumption over period March15-Feb16');
xlabel('Months(March15-Feb16');
ylabel('Water consumption(KGal)');
grid on;
