%  Gauss elimination (GE; with pivoting)
clear all
clc


% n = fscanf(fidr,'%d',1);
% sizeA=[n+1 n];
% A = fscanf(fidr,'%f',sizeA);
% A=A';

A = [ 2 1 -1 8;
      -3 -1 2 -11;
      -1 1 2 -3];

%%
format short 
m = length(A(:,1)); % Number of rows
n = length(A(1,:)); % Number of columns
permutation = eye(m);	        % initialize the pivoting vector

% The pivoting part.
for k = 1:m-1
 
        % The maximum element of column p
        a_max_p = max(abs(A(k:m,k))); 

        % We must avoid dividing by zero.
        if(a_max_p == 0)
            q = k;
        else
            % Row on which a_max_p is.
            q = find(A(:,k) == a_max_p);     
            % If a_max_p is a negative number, then q will be a 0-by-1 matrix.              
            if (isempty(q))
                q = find(A(:,k) == -a_max_p);
            end
        end
 
         % Switch rows A(q,:) and A(k,:), i.e the row with the maximum value
         % and the pivot row.
         if (a_max_p > A(k,k))
         temp = A(q,:);
         A(q,:) = A(k,:);
         A(k,:) = temp;
        temp2=permutation(q,:); 
        permutation(q,:)=permutation(k,:);
        permutation(k,:)=temp2;
         end
 
        % Gauss elimination.
        % Forward elimination
        if A(k,k) ~= 0
                 for i = (k+1):m
                     factor = A(i,k)/A(k,k); % Factor that multiplies row k
                     for j = k:n
                         A(i,j) = A(i,j) - factor*A(k,j);
                     end
                 end
         end
end

n=m;
m=n+1;

% Backword substitution
b=A(:,m);
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

