clear all
clc

% index = 1;
% for no = 1:766
% i = load(['.\brainTumorDataPublic_1-766\' num2str(no) '.mat']);
% if strcmp (i.cjdata.PID,'104281')
% imagesc(i.cjdata.image);
% title (i.cjdata.PID);
% pause(1);
% imgArr(:,:,index) = i.cjdata.image;
% index = index + 1;
% end
% end

load 36.mat;
patient = cjdata;

% showing image
im = patient.image;
imagesc(im);
title(patient.PID);

mask = patient.tumorMask;
mm = (uint16) mask;
new_im =(uint16)mask.*im;
imagesc()


