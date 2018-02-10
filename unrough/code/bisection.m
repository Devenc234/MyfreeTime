%% Bisection Method

display('Bisection method');
display('1. Function should be continuous function');
display('2. f(a)*f(b) <= 0');

syms x fun;
display('Input the function \n');
prompt=' f(x) = ';

%start_time=clock();
fun(x) = input(prompt);
double(fun(3))
%elapsed_time= etime(clock(),start_time);
%fprintf('It took %d seconds',elapsed_time);

display('Give values of a & b ');
a=input('a=');
b=input('b=');

display('Stopping criteria ');
max_iteration=input('max. iteration =');
max_rel_error=input('max. relative error (in fraction)=');

iteration= 0;
rel_error =1;

while(iteration<20 && rel_error>0.05 ) 
    c_old=(a+b)/2;
    
    if( fun(c_old)==0)
      break;
      
    elseif( (double( fun(a)*fun(c_old)))<0 )
        b=c_old;
    elseif( (double( fun(b)*fun(c_old)))<0 )    
        a=c_old;
    end
    
    c_new = (a+b)/2;
    if(iteration~=0)
    rel_error= (c_new - c_old)/c_old;    
    end
    
    iteration=iteration+1;
    
    display(' Iteration    a    b     c     ea ');
    printf(' %d    %f     %f    %f    %f',iteration,a,b,c_old,rel_error);
end

% printf('Answer = %f',c_old);










