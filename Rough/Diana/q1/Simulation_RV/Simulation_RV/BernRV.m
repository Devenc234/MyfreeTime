function [ x ] = BernRV( n,p )
%Generating a bernoulli random variable
rng('shuffle');
U = rand(n,1);
x = (U < p);
end

