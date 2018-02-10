clear all;
clc;
equation1 = [-8,0,0,3,0,-2.11];
equation2 = [1,-1,0,0,0,0];
equation3 = [3,1,-4,0,0,0];
equation4 = [0,0,1,-3,0,-0.448];
equation5 = [0,1,3,0,-4,0];

m = length(equation1)-1;
equations = [equation1;equation2;equation3;equation4;equation5];

A = equations(:,1:m);
b = equations(:,m+1);
x = A\b;

fprintf('Concentration of sulfur in Tank 1 = %f mg per cubic meter \n',x(1));
fprintf('Concentration of sulfur in Tank 2 = %f mg per cubic meter \n',x(2));
fprintf('Concentration of sulfur in Tank 3 = %f mg per cubic meter\n',x(3));
fprintf('Concentration of sulfur in Tank 4 = %f mg per cubic meter\n',x(4));
fprintf('Concentration of sulfur in Tank 5 = %f mg per cubic meter\n\n',x(5));

fprintf('the fuel delivered to the tanker = %f mg per minute\n',3*x(2));
fprintf('the fuel delivered to the pipeline = %f mg per minute\n\n',4*x(5));

