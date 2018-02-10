clc;
clear all;

customer = 3;
metersize = 1.5;

filename = 'WaterUsage.xlsx';
waterusage1 = xlsread(filename,1);
waterusage2 = xlsread(filename,2);

[A B C_awc ] = AWC(waterusage1);
Month = [ "January","February","March","April","May","June","July","Auguust","September","October","November","December"];

for i = 1:length(waterusage2)

    if(waterusage2(i,1)==customer)
        
        month = waterusage2(i,2);
        kgal = waterusage2(i,3);
        Result(month,1) = Month(month);
        Result(month,2) = kgal;
        Result(month,3) = round(WaterCharge(metersize,C_awc,kgal,month),2);  

    end

end

summerBilling = Result(3:8,:);
avgSummerBill = mean(str2double(summerBilling(:,2)));
avgSummerConsumption = mean(str2double(summerBilling(:,3)));

winterBilling = Result(9:12,:);
winterBilling(5:6,:) = Result(1:2,:);
avgWinterBill = mean(str2double(winterBilling(:,2)));
avgWinterConsumption = mean(str2double(winterBilling(:,3)));

fprintf('Summer Billing:\n');
fprintf('   Month   Usage    Bill \n');
fprintf('  ======= =======  ====== \n');


for i=1:6
fprintf(' %8s  %5.2f  $%5.2f \n',summerBilling(i,1),str2double(summerBilling(i,2)),str2double(summerBilling(i,3)));
end
fprintf('Average summer bill = $%.2f \n',avgSummerBill);
fprintf('Average summer consumption = %.2f kgal',avgSummerConsumption);

fprintf('\n\nWinter Billing:\n');
fprintf('   Month     Usage    Bill \n');
fprintf('  =======   =======  ====== \n');


for i=1:6
fprintf(' %10s  %5.2f  $%5.2f \n',winterBilling(i,1),str2double(winterBilling(i,2)),str2double(winterBilling(i,3)));
end
fprintf('Average Winter bill = $%.2f \n',avgWinterBill);
fprintf('Average Winter consumption = %.2f kgal',avgWinterConsumption);


waterConsumption = str2double(summerBilling(:,2));
waterConsumption(7:12) = str2double(winterBilling(:,2));

figure;
bar(waterConsumption)
title('Water Consumption for year 2015');
xlabel('Months (March2015-Feb2016');
ylabel('Water Consumption (KGal)');
grid on;








