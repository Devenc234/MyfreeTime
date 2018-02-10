%%
syms x fun;
fun(x) = 600*x^4 -550*x^3+200*x^2-20*x-1;

a=0.1;
b=1.0;
c_old=(a+b)/2;
display(' Iteration     a    b     c     ea');
fprintf('   0         %4f        %4f       %4f      -- \n',a,b,c_old);    
max_iteration=20;
max_rel_error=0.05;
iteration= 1;
rel_error=1;
mat = zeros(2,1);


while(iteration<20 && rel_error>0.005 ) 
    
    c_old=(a+b)/2;
    
    if( fun(c_old)==0) 
        break;
    elseif( (double( fun(a)*fun(c_old)))<0 )
        b=c_old;
    elseif( (double( fun(b)*fun(c_old)))<0 )    
        a=c_old;
    end
    
    c_new = (a+b)/2;
    rel_error= abs(c_new - c_old)/c_new;
    mat(iteration) = rel_error;
    fprintf('   %d         %4f        %4f       %4f      %4f \n',iteration,a,b,c_new,rel_error);      
    iteration=iteration+1;
end

fprintf('   %d         %4f        %4f       %4f      %4f \n',iteration,a,b,c_new,rel_error);      
fprintf('Answer = %f',c_old);


%%
figure;
value = -1:.1:1;
result = double(fun(value));
plot(value,result);
hold on
plot(b,a);

grid on
grid minor

ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';


%%
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
