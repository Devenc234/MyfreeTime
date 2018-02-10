function [ x ] = BinomialRV(n,p )
%Generate discrete bionomial random variable
%   n is number of trials; p is probability that the trails turns out to be
%   1
rng('shuffle');
y=BernRV(n,p);
x=sum(y);
end

