%% Bisection Method

% display('Bisection method');
% display('1. Function should be continuous function');
% display('2. f(a)*f(b) <= 0');

syms x fun;
% display('Input the function \n');
% prompt=' f(x) = ';


fun(x) = 600*x^4 -550*x^3+200*x^2-20*x-1;

%elapsed_time= etime(clock(),start_time);
%fprintf('It took %d seconds',elapsed_time);

% display('Give values of a & b ');
% a=input('a=');
% b=input('b=');

a=0.1;
b=1.0;

% display('Stopping criteria ');
% max_iteration=input('max. iteration =');
% max_rel_error=input('max. relative error (in fraction)=');
max_iteration=20;
max_rel_error=0.05;
iteration= 0;
rel_error =1;

display(' Iteration    a    b     c     ea');
while(iteration<20 && rel_error>0.05 ) 
    c_old=(a+b)/2;
        
    if( fun(c_old)==0)
      break;
      
    elseif( (double( fun(a)*fun(c_old)))<0 )
        b=c_old;
    elseif( (double( fun(b)*fun(c_old)))<0 )    
        a=c_old;
    end
    
    if(iteration==0)
    fprintf('   %d    %5f     %5f    %5f     \n',iteration,a,b,c_old);
    else    
        rel_error= abs(c_new - c_old)/c_old;    
        fprintf('   %d    %5f     %5f    %5f    %5f \n',iteration,a,b,c_old,rel_error);
    end
    
    c_new = (a+b)/2;
    iteration=iteration+1;
end

 fprintf(' %d    %f     %f    %f    %f \n',iteration,a,b,c_old,rel_error);
 fprintf('Answer = %f',c_old);










