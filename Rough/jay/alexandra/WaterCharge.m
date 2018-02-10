function bill = WaterCharge(meter,AWC,kgal,mo)
% to find meter charge and also check input
if AWC <0
    error('Positive scalars (including 0) only for AWC');
end
if numel(meter)>1 || numel(AWC)>1
    error('input for meter and AWC must not be an array') 
elseif meter==0.75
    charge=16.00; %charge is in dollars
elseif meter==1
    charge=26.71; 
elseif meter==1.5
    charge=53.26;
else
error('Error: Meter size may only be one of the values: .75, 1 or 1.5');
return;
end
% to check kgal and AWC
if size(mo)~= size(kgal) 
    error ('input data for AWC and kgal must have the same array deminsion') 
elseif (AWC<0)
    error('Error: kgal and AWC must be a positive scalar');
    return;
end
bill = zeros(size(mo));
if length(mo>1)
    for i = 1:length(mo)
        if kgal(i)<0
            error('kgal less than 0');
        end
       if(mo(i)==3||mo(i)==4||mo(i)==5||mo(i)==6||mo(i)==7||mo(i)==8) 
            if kgal(i) <= AWC  
                bill(i) = charge + kgal(i) * 4.65;
            elseif kgal(i) > AWC && kgal(i) <= (AWC+40)
                bill(i) = charge + AWC * 4.65 + (kgal(i) - AWC) * 7.2;
            else
                bill(i) = charge + AWC * 4.65 + 40 * 7.2 + (kgal(i)-AWC-40) * 6.94;
            end

       elseif(mo(i)==9||mo(i)==10||mo(i)==11||mo(i)==12||mo(i)==1||mo(i)==2 )
            if kgal(i)<= AWC  
                bill(i) = charge + kgal(i) * 4.65;
            elseif kgal(i) > AWC && kgal(i) <= (AWC+40)
                bill(i) = charge + AWC * 4.65 + (kgal(i) - AWC) * 6.45;
            else
                bill(i) = charge + AWC * 4.65 + 40 * 6.45 + (kgal(i)-AWC-40) * 6.14;
            end
       else
           error('The month must be between 1-12');
        end  
    end
else
    if kgal(i)<0
            error('kgal less than 0');
     end
    if(mo==3||mo==4||mo==5||mo==6||mo==7||mo==8) 
        if kgal <= AWC  
            bill = charge + kgal * 4.65;
        elseif kgal > AWC && kgal <= (AWC+40)
            bill = charge + AWC * 4.65 + (kgal - AWC) * 7.2;
        else
            bill = charge + AWC * 4.65 + 40 * 7.2 + (kgal-AWC-40) * 6.94;
        end

    elseif(mo==9||mo==10||mo==11||mo==12||mo==1||mo==2 )
        if kgal<= AWC  
            bill = charge + kgal * 4.65;
        elseif kgal > AWC && kgal <= (AWC+40)
            bill = charge + AWC * 4.65 + (kgal - AWC) * 6.45;
        else
            bill = charge + AWC * 4.65 + 40 * 6.45 + (kgal-AWC-40) * 6.14;
        end
     else
           error('The month must be between 1-12');
    end
end

end     