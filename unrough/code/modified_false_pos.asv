%%
clear all
clc

syms x fun;
fun(x) = 600*x^4 -550*x^3+200*x^2-20*x-1;

a=0.1;
b=1.0;
c_new= b - ( double(fun(b))*(b-a)/( double(fun(b)) - double(fun(a))));
display(' Iteration     a    b     c     ea');
fprintf('   0         %4f        %4f       %4f      -- \n',a,b,c_new);    
max_iteration=20;
max_rel_error=0.05;
iteration= 1;
rel_error=1;
mat = zeros(2,1);

    f_a = double(fun(a));
    f_b = double(fun(b));

iter_upper=0;
iter_lower=0;
while(iteration<20 && rel_error>0.005 ) 
    

    
    c_old=c_new;
    
    f_c = double(fun(c_old));
    
    if(f_c==0) 
        break;
       
    elseif( f_a*f_c<0 )
            b=c_old;
            iter_upper=0;
            iter_lower= iter_lower +1;
            if(iter_lower>=2)
                f_a = f_a/2;
            end
        
    elseif( f_b*f_c<0 )    
            a=c_old;
            iter_lower=0;
            iter_upper= iter_upper +1;
            if(iter_upper>=2)
                f_b = f_b/2;
            end
    end
    
    c_new= b - ( f_b*(b-a)/( f_b - f_a));
    
    if(c_new~=0)
    rel_error= abs(c_new - c_old)/c_new;
    end
    mat(iteration) = rel_error;
    fprintf('   %d         %4f        %4f       %4f      %4f \n',iteration,a,b,c_new,rel_error);      
    iteration=iteration+1;
end

fprintf('   %d         %4f        %4f       %4f      %4f \n',iteration,a,b,c_new,rel_error);      
fprintf('Answer = %f',c_old);


%% Function plot
figure;
value = -1:.1:1;
result = double(fun(value));
plot(value,result);
hold on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

a=-1:0.5:1;
b= 0*a;
plot(a,b,'r');

hold on
a=-1:0.5:6;
b= 0*a;
plot(b,a,'r');
grid on

title('f(x) vs x');
xlabel('x');
ylabel('f(x)');
%% Relative Approximate Error Plot
% figure;
hold on
value = 1:1:iteration-1;
% plot(value,mat)
% hold on
% plot(value,mat,'b','o')
% grid on


plot(value,mat,'--rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',10)
            
title('Relative approx. error v/s Iteration number');
xlabel('Iteration number');
ylabel('Relative approx. error');
 
% strValues = strtrim(cellstr(num2str([X(:) Y(:)],'(%d,%d)')));
% text(X,Y,strValues,'VerticalAlignment','bottom');

strValues = strtrim(cellstr(num2str([value(:) mat(:)],'(%d,%f)')));
text(value,mat,strValues,'VerticalAlignment','bottom');
