function cost = CostperKgal( Kgallon , month , AWC)
    cost = 0;
    if(month>=3 && month <=8)
               
        if Kgallon <= AWC
            cost = cost + 4.65.*Kgallon;
        end
        
        if ( AWC< Kgallon && Kgallon<AWC+40)
            cost = cost + 7.2*(Kgallon-AWC);
        end
        
        if( Kgallon>AWC+40)
            cost = cost + 6.94*(Kgallon-AWC-40);
        end
        
    else
        
        if Kgallon <= AWC
            cost = cost + 4.65.*Kgallon;
        end
        
        if ( AWC< Kgallon && kgl<AWC+40)
            cost = cost + 6.45*(Kgallon-AWC);
        end
        
        if( Kgallon>AWC+40)
            cost = cost + 6.14*(Kgallon-AWC-40);
        end
        
    end
    
end