function [ A , B , C ] = AWC(data)
%     filename = 'data2.xls';
%     data = xlsread(filename);
    
    [ m,n ] = size(data);
    if( m ~= 36 || n~=3)
        error('data size should be 36x3 ');
    end
    
    result = zeros(3,1);
    count = zeros(3,1);
    eps = 10^-15;
    
    for i=1:m
        
        customer = data(i,1);
        month = data(i,2);
        water_usage = data(i,3);

        if(customer>3 || customer<1)
            fprintf(' wrong data at row: %d ',i);
            error(' Customer should be either 1,2 or 3');
        end
        
        if(month>12 || month<1)
            fprintf(' wrong data at row: %d ',i);
            error(' month should be between 1 and 12');
        end
        
        if( (abs(floor(month)) - month)> eps )
            fprintf(' wrong data at row: %d ',i);
            error('month is not a integer');
        end
        
        if(water_usage<0)
            fprintf(' wrong data at row: %d ',i);
            error('water amount shold only positive numbers ');
        end
        
        if( ~(month>=3 && month<=8)) 
            result(customer) = result(customer) + water_usage;
            count(customer) = count(customer) + 1;
        end       
        
    end
    
    
    if(count(1)~=0)
        A = result(1)/count(1);
    else
        A=0;
        fprintf(' No water usage data found between sep to feb for A');
    end
    
    if(count(2)~=0)
        B = result(2)/count(2);
    else
        B = 0;
        fprintf(' No water usage data found between sep to feb for B');
        end
    
    if(count(3)~=0)
        C = result(3)/count(3);
    else
        C =0;
        fprintf(' No water usage data found between sep to feb for A');
    end
    
    
       
end