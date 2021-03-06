

ier = 0; ea=1; ea2=1;

while(1)
   
    if(n<3 || iter >= maxit)
        break;
    end
    iter=0;
    
    while(1)
       iter = iter +1;
       
               % calculation of bi and ci
               b(n) = a(n);
               b(n-1) = a(n-1) + r*b(n);       
               c(n) = b(n);
               c(n-1) = b(n-1) + r*c(n);
       
               for i=n-2:-1:0
                   b(i) = a(i) + r*b(i+1) + s*b(i+2);
                   c(i) = c(i) + r*c(i+1) + s*c(i+2);
               end
               
               % for calculating delta r and delta s
               det = c(2)*c(2) - c(3)*c(1);
               if(det~=0)
                   dr = ( -b(1)*c(2) + b(0)*c(3))/det;
                   ds = ( -b(0)*c(2) + b(1)*c(1))/det;
                   r = r + dr;
                   s = s + ds;
                   if(r~=0) 
                       ea1 = abs(dr/r)*100;
                   end
                   if(s~=0) 
                       ea2 = abs(ds/s)*100;
                   end
               else
                   r = r+1;
                   s = s+1;
                   iter=0; 
               end
               
               fprintf('\n iter=%d , ea1=%f ,ea2=%f',iter,ea1,ea2);
    
             if( ea1<= es && ea2 <=es || iter >= maxit)
                 break;
             end   
    end
    
    fprintf('\n After exit \n iter=%d , ea1=%f ,ea2=%f',iter,ea1,ea2);

    
    [r1,r2,i1,i2]=Quadroot(r,s);
    
    re(n) = r1;
    im(n) = i1;
    re(n-1) = r2;
    im(n-1) = i2;
    
    n=n-2;
    
    for i=0:1:n
        a(i)=b(i+2);
    end
    
    if(iter < maxit)
        
        if(n==2)
            r = -a(1)/a(2);
            s = -a(0)/a(2);
            
            [r1,r2,i1,i2]=Quadroot(r,s);
            re(n) = r1;
            im(n) = i1;
            re(n-1) = r2;
            im(n-1) = i2;
        else
            re(n) = -a(0)/a(1);
            im(n) = 0;
        end
    else
        ier =1;
    end
    
            
end

