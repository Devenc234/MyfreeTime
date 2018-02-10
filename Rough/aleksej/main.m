clear all;
clc;

A = [ 0,1,1;2,0,3;1,1,1];
b= [2,5,3]';
x = GaussElimination_with_pivoting(A,b);


%% 
clear all;
A = [ 1,1,1;1,2,2;3,4,4];
b= [3,5,11]';
x = GaussElimination_with_pivoting(A,b);

%% 
clear all;
A = [ 1,1,1;1,2,2;3,4,4];
b= [3,5,12]';
x = GaussElimination_with_pivoting(A,b);