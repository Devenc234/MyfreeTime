function x = GaussElimination_with_pivoting(A,b)

%GaussElimination(A,b) solves the n-by-n linear system of equations using partial
%pivoting
%A is the coeficient matrix
%b the right-hand column vector

n = size(A,1);  %getting n
A = [A,b];      %produces the augmented matrix


%elimination process starts
for i = 1:n-1
    p = i;
    %comparison to select the pivot
    for j = i+1:n
        if abs(A(j,i)) > abs(A(i,i))
            U = A(i,1:n+1);
            A(i,1:n+1) = A(j,1:n+1);
            A(j,1:n+1) = U;        
        end
    end
    %cheking for nullity of the pivots
    while (A(p,i)== 0 && p <= n)
        p = p+1;
    end
    if p == n+1
        disp('No unique solution');
        break
    else
        if p ~= i
            T = A(i,1:n+1);
            A(i,1:n+1) = A(p,1:n+1);
            A(p,1:n+1) = T;
        end
    end
    
    for j = i+1:n
        m = A(j,i)/A(i,i);
        for k = i+1:n+1 
            A(j,k) = A(j,k) - m*A(i,k);
        end
    end
end

%checking for nonzero of last entry
if A(n,n) == 0
    disp('No unique solution');
    return
end

%backward substitution
x(n) = A(n,n+1)/A(n,n);
for i = n - 1:-1:1
    sumax = 0;
    for j = i+1:n
        sumax = sumax + A(i,j)*x(j);
    end
    x(i) = (A(i,n+1) - sumax)/A(i,i);
end


