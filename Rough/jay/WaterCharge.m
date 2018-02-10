
function bill= WaterCharge( meter, AWC, kgal, mo )

    % checking scalar value
    if (numel(meter)>1 || numel(meter)<=0) 
        error('value of meter must Be scalar')
    end 
    if (numel(AWC)>1 || numel(AWC)<=0)  
        error('AWC must be scalar')
    end
    
    % AWC should be greater than zero
    if (AWC<0)
        error('AWC must be scalar and positive')
    end

    % Dimension of kgal and month should match
    if (numel(kgal)~=numel(mo))
        error('Arrays of kgal and month must be of same length')
    end

    % Assigning meter charge
    if (meter == .75)
        a= 16.00;
    elseif (meter == 1)
        a=26.71;
    elseif (meter == 1.5)
        a=53.26;
    else
        error('Meter size must be equal one of thes: .75, 1, 1.5');
    end 

    % Initializing bill with meter charge
    bill = a*ones(length(mo),1);
    eps = 10^-15;

    
    for i=1:length(mo)

        month = mo(i);
        Kgallon = kgal(i);
        cost = 0;

        % throw error if conditions are not matched
        if(abs(floor(month) - month)> eps )
                error('month is not a integer');
        end 
        if(month<1 || month>12)
                error('month is not between 1 and 12');
        end
        if(Kgallon < 0)
                error('kgal must be greater than or equal to zero');
        end

        % calculationg cost 
        if(month>=3 && month <=8)
            if Kgallon <= AWC
                cost = cost + 4.65.*Kgallon;
            end
            if ( AWC< Kgallon)
                cost = cost + 4.65*AWC;
                cost = cost + 7.2*(Kgallon-AWC);
            end
            if( Kgallon>AWC+40)
                cost = cost - 7.2*(Kgallon - AWC -40);
                cost = cost + 6.94*(Kgallon-AWC-40);
            end
        else
            if Kgallon <= AWC
                cost = cost + 4.65.*Kgallon;
            end
            if ( AWC< Kgallon)
                cost = cost + 4.65*AWC;
                cost = cost + 6.45*(Kgallon-AWC);
            end
            if( Kgallon>AWC+40)
                cost = cost - 7.2*(Kgallon - AWC -40);
                cost = cost + 6.14*(Kgallon-AWC-40);
            end
        end
        bill(i) = bill(i) + cost;
    end
    bill = bill';
    
end


