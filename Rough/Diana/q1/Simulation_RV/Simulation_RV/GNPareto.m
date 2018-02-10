function [ X ] = GNPareto( delta, mu, sig )
%generate random variable from generalized pareto distribution using
%inverse method

X=sig./delta.*((1-rand).^(-delta)-1)+mu;

end

