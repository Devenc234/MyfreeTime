function [ x ] =Gamma( a,b )
%generate random variable from gamma distribution using acceptance
%rejection method
rng('shuffle');

y=rand(floor(a),1);
gn=-sum(log(y));

delta=a-floor(a);
while true
    u=rand;
    v=rand;
    w=rand;
    if u<=exp(1)/(exp(1)+delta)
        epsilon=v.^(1/delta);
        n=w*(epsilon^delta-1);
    else
        epsilon=1-log(v);
        n=w*exp(-delta);
    end
   
    if n<=epsilon^(delta-1)*exp(-epsilon)
        break;
    end
end
x=b*(epsilon+gn);
end

