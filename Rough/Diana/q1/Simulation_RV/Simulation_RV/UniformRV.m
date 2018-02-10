function [X] = UniformRV(a,b)
%   Genreate uniform random variable using built-in rand generator 
%   using inverse method
%   b has to be greater than a 
X=a+(b-a)*rand;
end

