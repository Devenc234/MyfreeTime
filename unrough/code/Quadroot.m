
function [r1,r2,i1,i2] = Quadroot(r,s)

disc = r^2 + 4*s;

if(disc >=0)
    r1= ( r + sqrt(disc))/2;
    r2= ( r - sqrt(disc))/2;
    i1 =0;
    i2 =0;
else
    r1= r/2;
    r2= r/2;
    i1 = sqrt( abs(disc))/2;
    i2 = -i1;
end

end