function [ x ] = discrete()
%Using acceptance rejection method to generate random variable from a given
%distribution
% P(X=1)=0.15
% P(X=2)=0.55
% P(X=3)=0.2
% P(X=4)=0.1

c=0.55/0.25;

while true
    u=rand;
    y=unidrnd(4); % generate y from given distribution
    
    switch y
        case 1
            f=0.15;
        case 2
            f=0.55;
        case 3;
            f=0.2;
        case 4
            f=0.1;
    end
    
    if u<=f/(0.25*c)
        break
    end
end
x=y;
end

