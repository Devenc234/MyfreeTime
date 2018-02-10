function [x] = STDNormal()
% generate standard normal distribution using Acceptance-rejection method
rng('shuffle');

y1=-log(rand);
y2=-log(rand);

while y2<((y1-1).^2)/2
    y1=-log(rand);
    y2=-log(rand);
end

abs_z=y1;

u=rand;
if u<=0.5
    z=abs_z;
else
    z=-abs_z;
end
x=z;
end

