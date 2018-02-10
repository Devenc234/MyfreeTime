

% Write a computer program for solving a system of linear equations Ax = b.
% The program should have the following features:
% Input: 
% The program should read the following inputs from a text file – 
% (i) the number of equations (n),
% (ii) elements of the augmented matrix. 
% [Please see an example of input data file  below]

% Options: The user should have the option of selecting one of the following methods–
% a. Gauss elimination (GE; without pivoting)
% b. GE (with pivoting)
% c. GE (with scaling and pivoting)
% d. LU decomposition by using GE (without pivoting)
% e. LU decomposition by using GE (with pivoting)
% f. LU decomposition by using Crout method (without pivoting)
% g. Cholesky decomposition (for symmetric positive definite matrix)

%% a. Gauss elimination (GE; without pivoting)
clear all
% clc

% open the files for reading and writing

[filename,path,FilterIndex]=uigetfile({'*.txt'},'Choose a .txt format file for input');
fullpath=strcat(path,filename);
fidr = fopen(fullpath,'r');

% check for file
 if (fidr ==-1)
    fprintf('file can not be opened!!!  \nError in opening file!!!'); 
 end
n = fscanf(fidr,'%d',1);
sizeA=[n+1 n];
A = fscanf(fidr,'%f',sizeA);
A=A';
b=A(:,n+1);
A=A(:,1:n);
temp=A;

%
% Forward elimination
for k=1:1:n-1
   
    for i=k+1:1:n
        factor = A(i,k)/A(k,k);
        
        % if want ,we can start j=1 to n 
        % so that initial elments are also zeor in A
        %for j=k+1:1:n
        for j=1:1:n
            A(i,j)= A(i,j) - factor*A(k,j);
        end
        
        b(i) = b(i) - factor*b(k);
    end
end


% Backword substitution
x = zeros(n,1);

x(n)= b(n)/A(n,n);

for i=n-1:-1:1
    
    sum = b(i);
    
    for j=i+1:1:n        
        sum = sum - A(i,j)*x(j);
    end
    
    x(i) = sum/A(i,i);
end


%% writing output to file

fidw = fopen( 'output_GE.txt', 'wt' );
fprintf(fidw,'Gauss Elimination without pivoting and scaling\n');
fprintf(fidw,'solution vector x=\n');
for i = 1:n
    fprintf(fidw,'%f\n',x(i));
end

fprintf(fidw,'Upper triangular matrix U=\n');
for i = 1:n
    for j = 1:n
        fprintf(fidw,'%f ',A(i,j));
    end
    fprintf(fidw,'\n');
end

