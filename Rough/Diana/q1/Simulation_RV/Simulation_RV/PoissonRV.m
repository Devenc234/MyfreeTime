function [ x ] =PoissonRV( lambda )
%Generate discrete poisson distributed random variable with parameter
%lambda
rng('shuffle');
k=1; prod = 1;
    prod = prod*rand;
    while prod >= exp(-lambda)
        prod = prod*rand;
        k = k+1;
    end
   x = k;
end

