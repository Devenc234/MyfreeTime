%%
clear all
clc

syms x fun;
fun(x) = 600*x^4 -550*x^3+200*x^2-20*x-1;
df = diff(fun,x);

a=0.5;
display(' Iteration     a       ea');
fprintf('   0         %4f          -- \n',a);    
max_iteration=20;
max_rel_error=0.05;
iteration= 1;
rel_error=1;
mat = zeros(2,1);
c_new =a ;

while(iteration<20 && rel_error>0.005 ) 

    c_old=c_new;
    
    f_c = double(fun(c_old));
    if(f_c==0) 
        break;
    else
    c_new = c_old - double(fun(c_old))/double(df(c_old)) ;    
    end
    
    if(c_new~=0)
    rel_error= abs(c_new - c_old)/c_new;
    end
    mat(iteration) = rel_error;
    fprintf('   %d         %4f      %4f\n',iteration,c_new,rel_error);      
    iteration=iteration+1;
end

fprintf('   %d         %4f      %4f \n',iteration,c_new,rel_error);      
fprintf(' \n Answer = %f',c_old);


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
figure;
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
