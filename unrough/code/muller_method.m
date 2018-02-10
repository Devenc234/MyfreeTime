%%
clear all
clc

syms x fun;
fun(x) = 600*x^4 -550*x^3+200*x^2-20*x-1;

max_iteration=20;
max_rel_error=0.05;
iteration= 1;
rel_error=1;
mat = zeros(2,1);

x0 = 0.0;
x1 = 0.1;
x2 = 0.3;
display(' Iteration     x0          x1          x2           xr           ea');
while(1)  
    
    h0 = x1-x0;
    h1 = x2-x1;
    
    d0 = double( fun(x1)-fun(x0)) /h0;
    d1 = double( fun(x2)-fun(x1)) /h1;
    
    a = (d1-d0)/(h1+h0);
    b = a*h1 + d0;
    c = double(fun(x2));
    
    rad = sqrt( b*b - 4*a*c);
    
    if (( b+rad) >=( b - rad))
        den = b + rad;
    else
        den = b - rad;
    end
    
    if(den~=0)
    dxr = -2*c/den;   
    end
    xr = x2 + dxr;
    
    if( xr~=0)
        rel_error = abs((xr - x2)/x2);
    end    
    mat(iteration) = rel_error;
    fprintf('       %d     %4f    %4f   %4f     %4f     %4f \n',iteration,x0,x1,x2,xr,rel_error);
    
    if( abs(dxr)< max_rel_error*xr || iteration > max_iteration)
        break;
    end
    x0 = x1;
    x1 = x2;
    x2 = xr;
    
    iteration = iteration +1;   
end 
   
    
fprintf(' \n Answer = %f \n',xr);

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
value = 1:1:iteration;
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