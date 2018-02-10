
%%  g. Cholesky method
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
data=textscan(fidr,'%f');
n=data(1);
A=reshape(data(2:end),n+1,n);
a=A';
         % LU Decomposition
for k=1:n
    for i=1:k-1
        sum=0;
        for j=1:i-1
            sum=sum+a(i,j)*a(k,j);
        end
        a(k,i)=(a(k,i)-sum)/a(i,i);
    end
    sum=0;
    for j=1:k-1
        sum=sum+a(k,j)*a(k,j);
    end
    a(k,k)=sqrt(a(k,k)-sum);   
end
b=a(:,end);
for i=1:n             %lower matrix from augmented matrix 
    for j=1:n
        if(i>=j)
           l(i,j)=a(i,j);
        end
    end
end
u=l';     %upper matrix
for i=1:n             % forward substitution for lower matrix
    sum=b(i);
    for j=1:i-1
        sum=sum-l(i,j)*b(j);
    end
    b(i)=sum/l(i,i);
end
x(n)=b(n)/u(n,n);     %solution vector
for i=n-1:-1:1
    sum=0;
    for j=i+1:n                   % forward substitution for lower matrix
        sum=sum+u(i,j)*x(j);
    end
    x(i)=(b(i)-sum)/u(i,i);
end

%% writing output to file
fidw = fopen( 'output_Cholesky.txt', 'wt' );
fprintf(fidw,'LU decompostion with Cholesky method \n\n');
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

