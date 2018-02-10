function  [My_run,Sally_run,winner,win_score]=game(book_pages)

if(numel(book_pages)~=1)
    error('Number of pages should be a scalar');
end

if(book_pages<9 || book_pages>999)
    error('Number of pages should be a two or three digit number');
end

eps = 10^-15;
if(abs(floor(book_pages) - book_pages)> eps )
    error('Number of pages should be a integer');
end

if(mod(book_pages,2)==0)
    error('Number of pages should be odd');
end

    count = 0;
    my_score = 0;
    my_flag = 1;
    fprintf(' My run \n');
    fprintf('count number  numberSum   myscore \n');
    while(count<15)
        if(my_flag==1)
            number = randi(book_pages);
            count=count+1;
            My_run(count) = number;

            if(mod(number,2)==0)
                number = number+1;
            end

            sum =0;
            while (number>0)
               remainder = mod(number,10);
               number =fix(number/10);
               sum = sum + remainder;   
            end
            my_score = my_score + sum;

            fprintf(' %4d %4d %4d %4d \n',count,My_run(count),sum,my_score);
            if(mod(My_run(count),10)==9 || mod(My_run(count),10)==8  )
                my_flag=0;
            end
        else
            count = count+1;
        end
        
    end
    
    
    
    
    count = 0;
    sally_score = 0;
    sally_flag =1;
    fprintf('\n Sally run \n');
    fprintf('count number  numberSum  sallyscore\n');
    while(count<15)
        if(sally_flag==1)
            number = randi(book_pages);
            count=count+1;
            Sally_run(count) = number;

            if(mod(number,2)==0)
                number = number+1;
            end

            sum =0;
            while number>0
               remainder = mod(number,10);
               number =fix(number/10);
               sum = sum + remainder;   
            end
            sally_score = sally_score + sum;

            fprintf(' %4d %4d %4d %4d \n',count,Sally_run(count),sum,sally_score);

            if(mod(Sally_run(count),10)==9 || mod(Sally_run(count),10)==8  )
                sally_flag=0;
            end
        else
            count = count+1;
        end
        
    end
    
    
    if(my_score>sally_score)
        winner = 1;
        win_score = my_score;
    elseif(my_score<sally_score)
        winner =2;
        win_score = sally_score;
    else
        winner = 0;
        win_score = my_score;
    end

end