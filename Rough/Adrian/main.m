

%%
clc
clear all;
[My_run,Sally_run,winner,win_score]=game(877)

%%

sum =0;
while number>0
   remainder = mod(number,10);
   number =fix(number/10);
   sum = sum + remainder;   
end
