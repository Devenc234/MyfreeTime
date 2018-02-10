
%% d. LU decomposition by using GE (without pivoting)
clear all
clc

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
Augmented = fscanf(fidr,'%f',sizeA);
Augmented=Augmented';

L=eye(n);   %L matrix
b=Augmented(:,end);   %constant vector 
A=Augmented(:,1:end-1);  %coefficient matrix 

%%

% Forward elimination and L and U matrix
for i = 1:n-1   
    for j = i+1:n
        factor=A(j,i)/A(i,i);
        A(j,:) = A(j,:) - A(i,:)*factor ;
        L(j,i)=factor;
    end
end

y=zeros(n,1);      
y(1)=b(1)/L(1,1);  

% Ly=b    so computing y
for i = 2:n   
    sum=b(i);
    for j = 1:i-1
        sum=sum-L(i,j)*y(j);
    end
    y(i)=sum/L(i,i);
end

% Computing Ux=y   so computing x
x=zeros(n,1);     
x(n)=y(n)/A(n,n); 
for i = n-1:-1:1   
    sum=y(i);
    for j = n:-1:i+1
        sum=sum-A(i,j)*x(j);
    end
    x(i)=sum/A(i,i);
end

%% writing output to file
fidw = fopen( 'output_LU.txt', 'wt' );
fprintf(fidw,'LU decompostion with GE \n\n');
fprintf(fidw,'solution vector x=\n');
for i = 1:n
    fprintf(fidw,'%f\n',x(i));
end

fprintf(fidw,'\nL=\n');
for i = 1:n
    for j = 1:n
        fprintf(fidw,'%f ',L(i,j));
    end
    fprintf(fidw,'\n');
end

fprintf(fidw,'\nU=\n');
for i = 1:n
    for j = 1:n
        fprintf(fidw,'%f ',A(i,j));
    end
    fprintf(fidw,'\n');
end

