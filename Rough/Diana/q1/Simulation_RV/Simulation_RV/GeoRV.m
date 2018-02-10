function [ x ] = GeoRV( p)
%Generate discrete geometric distributed random variables

if p==1;
    x=1;
else
    x=floor(log(1-rand)-log(1-p))+1;
end
end

