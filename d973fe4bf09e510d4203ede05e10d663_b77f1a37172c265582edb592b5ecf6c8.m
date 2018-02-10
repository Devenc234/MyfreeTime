% BME 3540 project 1
% Instructor: Matthew Sherwood
clear all
clc

%% output #1
num_subject = 10;
excel_file = 'motorPeakBaseVals';



for i = 1:num_subject
    %read all hbd data
    hb_file_i = strcat(excel_file, num2str(i), '_hb.xls');
    %read all hbo data
    hbo_file_i = strcat(excel_file, num2str(i), '_hbo.xls');
        
    for j = 1:6
        %j=1: tapping right hand - TR
        %j=2: tapping left hand - TL
        %j=3: tapping both hands - TB
        %j=4: grasping right hand - GR
        %j=5: grasping left hand - GL
        %j=6: grasping both hands - GB
        hbd_tmp = xlsread(hb_file_i,j); 
        hbd_lpk{j} = hbd_tmp(2:end,3:20);    %extracted peak HBD value for left hemisphere (channel 1-18)
        hbd_lbl{j} = hbd_tmp(2:end,39:56);   %extracted baseline HBD value for left hemisphere (channel 1-18)
        hbd_rpk{j} = hbd_tmp(2:end,21:38);   %extracted peak HBD value for right hemisphere(channel 19-36) 
        hbd_rbl{j} = hbd_tmp(2:end,57:74);   %extracted baseline HBD value for right hemisphere(channel 19-36)
        hbo_tmp = xlsread(hbo_file_i,j);
        hbo_lpk{j} = hbo_tmp(2:end,3:20);    %extracted peak HBO value for left hemisphere (channel 1-18)
        hbo_lbl{j} = hbo_tmp(2:end,39:56);   %extracted baseline HBO value for left hemisphere (channel 1-18)
        hbo_rpk{j} = hbo_tmp(2:end,21:38);   %extracted peak HBO value for right hemisphere(channel 19-36) 
        hbo_rbl{j} = hbo_tmp(2:end,57:74);   %extracted baseline HBO value for right hemisphere(channel 19-36)
        % Left hemisphere - HBD diff
        diff{j} = hbd_lpk{j}-hbd_lbl{j};     % original data difference
        index_nan{j} = isnan(diff{j});       % check if the data contain NaN data
        diff{j}(index_nan{j}) = 0;    % substitude NaN data with 0
        diff_LhbD{j} = mean(diff{j}(:)); % average the whole data
        Stderr_LhbD{j} = std(diff{j}(:))/sqrt(numel(diff{j}));
        
        
        % Right hemisphere - HBD diff
        diff{j} = hbd_rpk{j}-hbd_rbl{j};     
        index_nan{j} = isnan(diff{j});          
        diff{j}(index_nan{j}) = 0; 
        diff_RhbD{j} = mean(diff{j}(:));
        Stderr_RhbD{j} = std(diff{j}(:))/sqrt(numel(diff{j}));

        % Left hemisphere - HBO diff
        diff{j} = hbo_lpk{j}-hbo_lbl{j};     
        index_nan{j} = isnan(diff{j});          
        diff{j}(index_nan{j}) = 0; 
        diff_LhbO{j} = mean(diff{j}(:));
        Stderr_LhbO{j} = std(diff{j}(:))/sqrt(numel(diff{j}));

        % Right hemisphere - HBO diff
        diff{j} = hbo_rpk{j}-hbo_rbl{j};     
        index_nan{j} = isnan(diff{j});          
        diff{j}(index_nan{j}) = 0; 
        diff_RhbO{j} = mean(diff{j}(:));
        Stderr_RhbO{j} = std(diff{j}(:))/sqrt(numel(diff{j}));
    
    end
     common{i}=strcat('Subject', num2str(i),'-ALLTASKS-Oxy-Deoxy-DIFF-8cycleAVG');
        Task=['TR';'TL';'TB';'GR';'GL';'GB'];
        Day=['AVG';'AVG';'AVG';'AVG';'AVG';'AVG'];
        fprintf('\t\t\t\t\t\t\t\t\t\t\t\t\t%s\n',common{i})
        fprintf('\t\t\t\t\t\t\t\tChange (left)\t\t\t\t\t\t\t\t\t\t\t\t\tChange (left)\n')
        fprintf('\t\t\t\t\t\tHBO\t\t\t\t\t\t\t\tHBD\t\t\t\t\t\t\t\tHBO\t\t\t\t\t\t\t\tHBD\n')
        fprintf('Task\tDay\t\tDIFF\t\t\tSTDERR\t\t\tDIFF\t\t\tSTDERR\t\t\tDIFF\t\t\tSTDERR\t\t\tDIFF\t\t\tSTDERR\n')
        for n=1:6

            fprintf('%4s\t%3s\t%e\t%e\t%e\t%e\t%e\t%e\t%e\t%e\n',Task(n,:),Day(n,:),diff_LhbO{n},Stderr_LhbO{n},diff_LhbD{n},Stderr_LhbD{n},diff_RhbO{n},Stderr_RhbO{n},diff_RhbD{n},Stderr_RhbD{n})
        end
    
end
        


%% output #2
        %i: subject number ranging from 1 to 10
        %j,k=1: tapping right hand - TR
        %j,k=2: tapping left hand - TL
        %j,k=3: tapping both hands - TB
        %j,k=4: grasping right hand - GR
        %j,k=5: grasping left hand - GL
        %j,k=6: grasping both hands - GB
%clear all, clc
num_subject = 10;
excel_file = 'motorPeakBaseVals';
 
 for i = 1:num_subject
    %read all hbd data
    hb_file_i = strcat(excel_file, num2str(i), '_hb.xls');
    %read all hbo data
    hbo_file_i = strcat(excel_file, num2str(i), '_hbo.xls');
    
     for j = 1:6
        
        hbd_tmp = xlsread(hb_file_i,j); 
        hbd_lpk{i,j} = hbd_tmp(2:end,3:20);    %extracted peak HBD value for left hemisphere (channel 1-18)
        hbd_lbl{i,j} = hbd_tmp(2:end,39:56);   %extracted baseline HBD value for left hemisphere (channel 1-18)
        hbd_rpk{i,j} = hbd_tmp(2:end,21:38);   %extracted peak HBD value for right hemisphere(channel 19-36) 
        hbd_rbl{i,j} = hbd_tmp(2:end,57:74);   %extracted baseline HBD value for right hemisphere(channel 19-36)
        hbo_tmp = xlsread(hbo_file_i,j);
        hbo_lpk{i,j} = hbo_tmp(2:end,3:20);    %extracted peak HBO value for left hemisphere (channel 1-18)
        hbo_lbl{i,j} = hbo_tmp(2:end,39:56);   %extracted baseline HBO value for left hemisphere (channel 1-18)
        hbo_rpk{i,j} = hbo_tmp(2:end,21:38);   %extracted peak HBO value for right hemisphere(channel 19-36) 
        hbo_rbl{i,j} = hbo_tmp(2:end,57:74);   %extracted baseline HBO value for right hemisphere(channel 19-36)
        % Left hemisphere - HBD diff
        diff{i,j} = hbd_lpk{i,j}-hbd_lbl{i,j};     % original data difference
        index_nan{i,j} = isnan(diff{i,j});       % check if the data contain NaN data
        diff{i,j}(index_nan{i,j}) = 0;        % substitude NaN data with 0
        diff1_lhbd{i,j} = diff{i,j}(1:8,:);   % difference data for day 1
        diff2_lhbd{i,j} = diff{i,j}(9:16,:);  % difference data for day 2
        diff3_lhbd{i,j} = diff{i,j}(17:24,:); % difference data for day 3
        % Right hemisphere - HBD diff
        diff{i,j} = hbd_rpk{i,j}-hbd_rbl{i,j};      
        index_nan{i,j} = isnan(diff{i,j});      
        diff{i,j}(index_nan{i,j}) = 0;    
        diff1_rhbd{i,j} = diff{i,j}(1:8,:);   % day 1
        diff2_rhbd{i,j} = diff{i,j}(9:16,:);  % day 2
        diff3_rhbd{i,j} = diff{i,j}(17:24,:); % day 3
        % Left hemisphere - HBO diff
        diff{i,j} = hbo_lpk{i,j}-hbo_lbl{i,j};     
        index_nan{i,j} = isnan(diff{i,j});       
        diff{i,j}(index_nan{i,j}) = 0;    
        diff1_lhbo{i,j} = diff{i,j}(1:8,:);   % day 1
        diff2_lhbo{i,j} = diff{i,j}(9:16,:);  % day 2
        diff3_lhbo{i,j} = diff{i,j}(17:24,:); % day 3
        % Right hemisphere - HBO diff
        diff{i,j} = hbo_rpk{i,j}-hbo_rbl{i,j};      
        index_nan{i,j} = isnan(diff{i,j});      
        diff{i,j}(index_nan{i,j}) = 0;    
        diff1_rhbo{i,j} = diff{i,j}(1:8,:);   % day 1
        diff2_rhbo{i,j} = diff{i,j}(9:16,:);  % day 2
        diff3_rhbo{i,j} = diff{i,j}(17:24,:); % day 3
     end
 end
 
 % Calculate the mean and standard error for HBD left hemisphere 
 for k=1:6
    
     diff1m = cell2mat(diff1_lhbd(:,k));
     diff2m = cell2mat(diff2_lhbd(:,k));
     diff3m = cell2mat(diff3_lhbd(:,k));
     
     diff_LhbD1{k} = mean(diff1m(:)); % averaged difference for day 1
     diff_LhbD2{k} = mean(diff2m(:)); % averaged difference for day 2
     diff_LhbD3{k} = mean(diff3m(:)); % averaged difference for day 3 
   
     Stderr_LhbD1{k} = std(diff1m(:))/sqrt(numel(diff1m)); %day1
     Stderr_LhbD2{k} = std(diff2m(:))/sqrt(numel(diff2m)); %day2
     Stderr_LhbD3{k} = std(diff3m(:))/sqrt(numel(diff3m)); %day3
 end
 
 % Calculate the mean and standard error for HBD right hemisphere 
 for k=1:6
    
     diff1m = cell2mat(diff1_rhbd(:,k));
     diff2m = cell2mat(diff2_rhbd(:,k));
     diff3m = cell2mat(diff3_rhbd(:,k));
     
     diff_RhbD1{k} = mean(diff1m(:)); % averaged difference for day 1
     diff_RhbD2{k} = mean(diff2m(:)); % averaged difference for day 2
     diff_RhbD3{k} = mean(diff3m(:)); % averaged difference for day 3 
   
     Stderr_RhbD1{k} = std(diff1m(:))/sqrt(numel(diff1m)); %day1
     Stderr_RhbD2{k} = std(diff2m(:))/sqrt(numel(diff2m)); %day2
     Stderr_RhbD3{k} = std(diff3m(:))/sqrt(numel(diff3m)); %day3
 end
 
 % Calculate the mean and standard error for HBO left hemisphere 
 for k=1:6
    
     diff1m = cell2mat(diff1_lhbo(:,k));
     diff2m = cell2mat(diff2_lhbo(:,k));
     diff3m = cell2mat(diff3_lhbo(:,k));
     
     diff_LhbO1{k} = mean(diff1m(:)); % averaged difference for day 1
     diff_LhbO2{k} = mean(diff2m(:)); % averaged difference for day 2
     diff_LhbO3{k} = mean(diff3m(:)); % averaged difference for day 3 
   
     Stderr_LhbO1{k} = std(diff1m(:))/sqrt(numel(diff1m)); %day1
     Stderr_LhbO2{k} = std(diff2m(:))/sqrt(numel(diff2m)); %day2
     Stderr_LhbO3{k} = std(diff3m(:))/sqrt(numel(diff3m)); %day3
 end
 
% Calculate the mean and standard error for HBO right hemisphere     
 for k=1:6
    
     diff1m = cell2mat(diff1_rhbo(:,k));
     diff2m = cell2mat(diff2_rhbo(:,k));
     diff3m = cell2mat(diff3_rhbo(:,k));
     
     diff_RhbO1{k} = mean(diff1m(:)); % averaged difference for day 1
     diff_RhbO2{k} = mean(diff2m(:)); % averaged difference for day 2
     diff_RhbO3{k} = mean(diff3m(:)); % averaged difference for day 3 
   
     Stderr_RhbO1{k} = std(diff1m(:))/sqrt(numel(diff1m)); %day1
     Stderr_RhbO2{k} = std(diff2m(:))/sqrt(numel(diff2m)); %day2
     Stderr_RhbO3{k} = std(diff3m(:))/sqrt(numel(diff3m)); %day3 
 end
 % Agregate the data in the order provided in the project
 Diff_LHBO = [diff_LhbO1(1);diff_LhbO2(1);diff_LhbO3(1);diff_LhbO1(2);diff_LhbO2(2);diff_LhbO3(2);diff_LhbO1(3);diff_LhbO2(3);diff_LhbO3(3);diff_LhbO1(4);diff_LhbO2(4);diff_LhbO3(4);diff_LhbO1(5);diff_LhbO2(5);diff_LhbO3(5);diff_LhbO1(6);diff_LhbO2(6);diff_LhbO3(6)];
 Diff_RHBO = [diff_RhbO1(1);diff_RhbO2(1);diff_RhbO3(1);diff_RhbO1(2);diff_RhbO2(2);diff_RhbO3(2);diff_RhbO1(3);diff_RhbO2(3);diff_RhbO3(3);diff_RhbO1(4);diff_RhbO2(4);diff_RhbO3(4);diff_RhbO1(5);diff_RhbO2(5);diff_RhbO3(5);diff_RhbO1(6);diff_RhbO2(6);diff_RhbO3(6)];
 Diff_LHBD = [diff_LhbD1(1);diff_LhbD2(1);diff_LhbD3(1);diff_LhbD1(2);diff_LhbD2(2);diff_LhbD3(2);diff_LhbD1(3);diff_LhbD2(3);diff_LhbD3(3);diff_LhbD1(4);diff_LhbD2(4);diff_LhbD3(4);diff_LhbD1(5);diff_LhbD2(5);diff_LhbD3(5);diff_LhbD1(6);diff_LhbD2(6);diff_LhbD3(6)];
 Diff_RHBD = [diff_RhbD1(1);diff_RhbD2(1);diff_RhbD3(1);diff_RhbD1(2);diff_RhbD2(2);diff_RhbD3(2);diff_RhbD1(3);diff_RhbD2(3);diff_RhbD3(3);diff_RhbD1(4);diff_RhbD2(4);diff_RhbD3(4);diff_RhbD1(5);diff_RhbD2(5);diff_RhbD3(5);diff_RhbD1(6);diff_RhbD2(6);diff_RhbD3(6)];
 
 Stderr_LHBO = [Stderr_LhbO1(1);Stderr_LhbO2(1);Stderr_LhbO3(1);Stderr_LhbO1(2);Stderr_LhbO2(2);Stderr_LhbO3(2);Stderr_LhbO1(3);Stderr_LhbO2(3);Stderr_LhbO3(3);Stderr_LhbO1(4);Stderr_LhbO2(4);Stderr_LhbO3(4);Stderr_LhbO1(5);Stderr_LhbO2(5);Stderr_LhbO3(5);Stderr_LhbO1(6);Stderr_LhbO2(6);Stderr_LhbO3(6)];
 Stderr_RHBO = [Stderr_RhbO1(1);Stderr_RhbO2(1);Stderr_RhbO3(1);Stderr_RhbO1(2);Stderr_RhbO2(2);Stderr_RhbO3(2);Stderr_RhbO1(3);Stderr_RhbO2(3);Stderr_RhbO3(3);Stderr_RhbO1(4);Stderr_RhbO2(4);Stderr_RhbO3(4);Stderr_RhbO1(5);Stderr_RhbO2(5);Stderr_RhbO3(5);Stderr_RhbO1(6);Stderr_RhbO2(6);Stderr_RhbO3(6)];
 Stderr_LHBD = [Stderr_LhbD1(1);Stderr_LhbD2(1);Stderr_LhbD3(1);Stderr_LhbD1(2);Stderr_LhbD2(2);Stderr_LhbD3(2);Stderr_LhbD1(3);Stderr_LhbD2(3);Stderr_LhbD3(3);Stderr_LhbD1(4);Stderr_LhbD2(4);Stderr_LhbD3(4);Stderr_LhbD1(5);Stderr_LhbD2(5);Stderr_LhbD3(5);Stderr_LhbD1(6);Stderr_LhbD2(6);Stderr_LhbD3(6)];
 Stderr_RHBD = [Stderr_RhbD1(1);Stderr_RhbD2(1);Stderr_RhbD3(1);Stderr_RhbD1(2);Stderr_RhbD2(2);Stderr_RhbD3(2);Stderr_RhbD1(3);Stderr_RhbD2(3);Stderr_RhbD3(3);Stderr_RhbD1(4);Stderr_RhbD2(4);Stderr_RhbD3(4);Stderr_RhbD1(5);Stderr_RhbD2(5);Stderr_RhbD3(5);Stderr_RhbD1(6);Stderr_RhbD2(6);Stderr_RhbD3(6)];
 
        Task=['TR';'TR';'TR';'TL';'TL';'TL';'TB';'TB';'TB';'GR';'GR';'GR';'GL';'GL';'GL';'GB';'GB';'GB'];
        Day=['1';'2';'3';'1';'2';'3';'1';'2';'3';'1';'2';'3';'1';'2';'3';'1';'2';'3'];
        fprintf('\t\t\t\t\t\t\t\t\t\t\t\t\tMean-AllTASKS-Oxy-Deoxy-DIFF-8cycleAVG\n')
        fprintf('\t\t\t\t\t\t\t\tChange (left)\t\t\t\t\t\t\t\t\t\t\t\t\tChange (left)\n')
        fprintf('\t\t\t\t\t\tHBO\t\t\t\t\t\t\t\tHBD\t\t\t\t\t\t\t\tHBO\t\t\t\t\t\t\t\tHBD\n')
        fprintf('Task\tDay\t\tDIFF\t\t\tSTDERR\t\t\tDIFF\t\t\tSTDERR\t\t\tDIFF\t\t\tSTDERR\t\t\tDIFF\t\t\tSTDERR\n')
        [ro,co]=size(Task);
        for n=1:ro

            fprintf('%4s\t%2s\t%e\t%e\t%e\t%e\t%e\t%e\t%e\t%e\n',Task(n,:),Day(n,:),Diff_LHBO{n},Stderr_LHBO{n},Diff_LHBD{n},Stderr_LHBD{n},Diff_RHBO{n},Stderr_RHBO{n},Diff_RHBD{n},Stderr_RHBD{n})
        end
    
 
