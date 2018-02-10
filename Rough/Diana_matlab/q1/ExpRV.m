function [ X ] = ExpRV( lambda)
%Generating exponential random variable with given lambda
X=log(1-rand)./(-lambda);
end

