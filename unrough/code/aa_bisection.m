%% Bisection Method

% display('Bisection method');
% display('1. Function should be continuous function');
% display('2. f(a)*f(b) <= 0');
clear all;
clc;
display('Input the function');
prompt=' f(x) = ';
syms x fun;
fun(x) = input(prompt);

display(' Give values of a & b ');
a=input('a=');
b=input('b=');
f_a = double(fun(a));
f_b = double(fun(b));

if( f_a*f_b>0)
    display(' Sorry, Root can not found in this interval');
    break;
else
    
    if(f_a==0)
        fprintf(' Root = %f',a);
    elseif(f_b==0)
        fprintf(' Root = %f',b);
    else
        display('\n Stopping criteria ');
        max_iteration=input('max. iteration =');
        max_rel_error=input('max. relative error (in percentage)=');

        c_old=(a+b)/2;
        display(' Iteration     a             b              c          ea');
        fprintf('   1         %.4f        %.4f       %.4f      -- \n',a,b,c_old);    

        iteration= 1;
        rel_error=1;
        mat = zeros(2,1);

        while(1) 

            c_old=(a+b)/2;
            f_c = double(fun(c_old));

            if( f_c==0) 
                break;
            elseif( f_a*f_c<0 )
                b=c_old;
            elseif( f_b*f_c<0 )    
                a=c_old;
            end

            c_new = (a+b)/2;
            if(c_new==0)
                rel_error=NaN;                
            else
            rel_error= abs(c_new - c_old)/c_new;
            end            
            
            fprintf('   %d         %.4f        %.4f       %.4f      %.4f \n',iteration,a,b,c_new,rel_error);                  
            mat(iteration) = rel_error;            
            if( iteration>=max_iteration || rel_error< max_rel_error)
                break;
            end
            iteration=iteration+1;
        end          
        fprintf('\n \n f(x)=');
        disp(fun(x));
        fprintf('Root of function= %f \n',c_new);
    end

end

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
value = 1:1:iteration;
% plot(value,mat)
% hold on
% plot(value,mat,'b','o')
% grid on


plot(value,mat,'--rs','LineWidth',1.5,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',5)
            
title('Relative approx. error v/s Iteration number');
xlabel('Iteration number');
ylabel('Relative approx. error');

% To print both x,y on figure
% strValues = strtrim(cellstr(num2str([value(:) mat(:)],'(%d,%.3f)')));
% text(value,mat,strValues,'VerticalAlignment','bottom');

% To print only y values on figure
strValues = strtrim(cellstr(num2str( mat(:),'(%.3f)')));
text(value,mat,strValues,'VerticalAlignment','bottom');
