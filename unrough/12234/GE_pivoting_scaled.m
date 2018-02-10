%% c. Gauss elimination (GE; with scaled pivoting)
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
A = fscanf(fidr,'%f',sizeA);
A=A';

format short;
b=A(:,n+1);
A=A(:,1:n);
temp=A;

%% Gaussian Elimination with scaled partial pivoting. 

pivot = (1:n)';	        % initialize the pivoting vector
scale = max(abs(A'));     % compute the scale of each row
  
  for k = 1:(n-1)
    r = abs(A(pivot(k),k)/scale(pivot(k)));
    kp = k;
    for i = (k+1):n
      t = abs(A(pivot(i),k)/scale(pivot(i))); 
      if t > r,  r = t;  kp = i;  end
    end
    l = pivot(kp);  pivot(kp) = pivot(k);  pivot(k) = l;   % interchange p(kp) and p(k) 
    for i = (k+1):n
      A(pivot(i),k) = A(pivot(i),k)/A(pivot(k),k);
      for j = (k+1):n
        A(pivot(i),j) = A(pivot(i),j)-A(pivot(i),k)*A(pivot(k),j);
      end
    end
  end
  
pivot;                      % output the pivoting vector
A;                      % output the overwritten matrix
permutation=zeros(n);
for i=1:n
    permutation(i,pivot(i))=1;
end

% Forward subsitiution 
  y = zeros(n,1);        % initialize y to be a column vector
  y(1) = b(pivot(1));
  for i = 2:n
    y(i) = b(pivot(i));
    for j = 1:(i-1)
      y(i) = y(i)-A(pivot(i),j)*y(j);
    end
  end
  y;                      % output y

% Back subsitiution 

  x = zeros(n,1);        % initialize x to be a column vector
  x(n) = y(n)/A(pivot(n),n);
  for i = (n-1):-1:1
    x(i) = y(i);
    for j = (i+1):n
      x(i) = x(i)-A(pivot(i),j)*x(j);
    end
    x(i) = x(i)/A(pivot(i),i);
  end
  x;                      % output x

%% writing output to file

fidw = fopen( 'output_GE_pivot.txt', 'wt' );
fprintf(fidw,'Gauss Elimination with pivoting and without scaling\n');
fprintf(fidw,'solution vector x=\n');
for i = 1:n
    fprintf(fidw,'%f\n',x(i));
end

fprintf(fidw,'\nUpper triangular matrix U=\n');
for i = 1:n
    for j = 1:n
        fprintf(fidw,'%f ',A(i,j));
    end
    fprintf(fidw,'\n');
end

fprintf(fidw,'\nPermutation matrix P=\n');
for i = 1:n
    for j = 1:n
        fprintf(fidw,'%d ',permutation(i,j));
    end
    fprintf(fidw,'\n');
end  