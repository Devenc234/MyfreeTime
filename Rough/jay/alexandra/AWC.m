function [ A,B,C ] = AWC(data)
    eps = 10^-15;
    A = 0; B = 0; C = 0;
    
    [m,n]=size(data); 
    if m<36 || m>36
        error ('input data must have exatcly thirty-six rows') 
    elseif n>3 || n<3 
            error ('input must equal three columns')
    end 
    for i=1:m
        
        if(data(i,3)<0)
            error('Negative kgal');
        end
        %data(i,1)
        if  data(i,1)==1 
            if data(i,2)>=9 || data(i,2)<=2
                A=A+data(i,3);
            end 
        elseif data(i,1)==2
            if data (i,2)>=9 || data(i,2)<=2 
                B=B+data(i,3);
            end 
        elseif data(i,1)==3 
            if data(i,2)>=9 || data(i,2)<=2
                C=C+data(i,3);
            end
        else
            error('invalid data for the customer');
        end
        
        
        if(abs(floor(data(i,2)) - data(i,2))> eps || data(i,2)<1 || data(i,2)>12)
            error('Month is not a integer b/w 1-12');
        end
    end
    A = A/6.0;
    B = B/6.0;
    C = C/6.0;
end 
  

