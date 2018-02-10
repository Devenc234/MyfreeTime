function [ x ] = BetaRV( alpha, beta )
%generate beta distributed rv using acceptance rejection method
rng('shuffle');
%given beta density function
f=@(x) 2*x;
U1=rand;
U2=rand;
c=f((alpha-1)/(alpha+beta-2));

while U2>f(U1)/c
    U1=rand;
    U2=rand;
end
x=U1;
end

