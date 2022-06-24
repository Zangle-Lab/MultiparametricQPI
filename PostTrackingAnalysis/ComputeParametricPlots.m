%%% This code 'ComputeParmetricPlots.m' is copyright 2021
% Authors: Tarek E. Mustafa, Edward R. Polanco, Thomas A. Zangle
% This code is distributed under a creative commons attributable
% sharealike license. This license allows you to remix, adapt, and build 
% upon this work, as long as the authors are credited and the modified code
% is redistributed under the same license.
clear; close all;
%%
load('.\data\SlidingWindowOutput.mat')
%% parameterized by concentration

colorC = [255, 215,  0 ;    ... % yellow - 4HT
          127,  0,  255;    ... % purple - lap
           0 , 255,  0 ;    ... % green - fulv
          255,  0 ,  0 ;    ... % red - dox
           0,    0, 255;    ... % blue - 5FU
           0 , 255, 255;    ... % cyan - palbo
          255,  0,  255;    ... % magenta - vinblastine
          255, 127,  0 ;    ... % orange - carboplatin
          162, 29,  49;    ...
         ]./255;

meanControlGrowthRate_MDA = (squeeze(b_mean_control_MDA_PanelA_1) + b_mean_control_MDA_PanelA_3 + b_mean_control_MDA_PanelA_2)./3;
meanControlSTD_MDA = (squeeze(b_std_control_MDA_PanelA_1) + b_std_control_MDA_PanelA_3 + b_std_control_MDA_PanelA_2)./3;

meanControlGrowthRate_MCF7 = (squeeze(b_mean_control_MCF7_PanelA_1) + b_mean_control_MCF7_PanelA_2 + b_mean_control_MCF7_PanelA_3)./3;
meanControlSTD_MCF7 = (squeeze(b_std_control_MCF7_PanelA_1) + b_std_control_MCF7_PanelA_2 + b_std_control_MCF7_PanelA_3)./3;

meanControlGrowthRate_BT474 = (squeeze(b_mean_control_BT474_PanelA_3(:,:,:)) + b_mean_control_BT474_PanelA_1(:,:) + b_mean_control_BT474_PanelA_2(:,:))./3;
meanControlSTD_BT474 = (squeeze(b_std_control_BT474_PanelA_3(:,:,:)) + b_std_control_BT474_PanelA_1(:,:) + b_std_control_BT474_PanelA_2(:,:))./3;

ht_MDA_meanSGR     = squeeze(mean([b_mean_MDA_PanelA_1(1,:,:); b_mean_MDA_PanelA_2(1,:,:); b_mean_MDA_PanelA_3(1,:,:)]))';
ht_MDA_meanSGR_sem = squeeze(std([b_mean_MDA_PanelA_1(1,:,:); b_mean_MDA_PanelA_2(1,:,:); b_mean_MDA_PanelA_3(1,:,:)]))'./sqrt(3);
ht_MDA_meanSTD     = squeeze(mean([b_std_MDA_PanelA_1(1,:,:); b_std_MDA_PanelA_2(1,:,:); b_std_MDA_PanelA_3(1,:,:)]))';
ht_MDA_meanSTD_sem = squeeze(std([b_std_MDA_PanelA_1(1,:,:); b_std_MDA_PanelA_2(1,:,:); b_std_MDA_PanelA_3(1,:,:)]))'./sqrt(3);

lap_MDA_meanSGR     = squeeze(mean([b_mean_MDA_PanelA_1(2,:,:); b_mean_MDA_PanelA_2(2,:,:); b_mean_MDA_PanelA_3(2,:,:)]))';
lap_MDA_meanSGR_sem = squeeze(std([b_mean_MDA_PanelA_1(2,:,:); b_mean_MDA_PanelA_2(2,:,:); b_mean_MDA_PanelA_3(2,:,:)]))'./sqrt(3);
lap_MDA_meanSTD     = squeeze(mean([b_std_MDA_PanelA_1(2,:,:); b_std_MDA_PanelA_2(2,:,:); b_std_MDA_PanelA_3(2,:,:)]))';
lap_MDA_meanSTD_sem = squeeze(std([b_std_MDA_PanelA_1(2,:,:); b_std_MDA_PanelA_2(2,:,:); b_std_MDA_PanelA_3(2,:,:)]))'./sqrt(3);

fulv_MDA_meanSGR     = squeeze(mean([b_mean_MDA_PanelA_1(3,:,:); b_mean_MDA_PanelA_2(3,:,:); b_mean_MDA_PanelA_3(3,:,:)]))';
fulv_MDA_meanSGR_sem = squeeze(std([b_mean_MDA_PanelA_1(3,:,:); b_mean_MDA_PanelA_2(3,:,:); b_mean_MDA_PanelA_3(3,:,:)]))'./sqrt(3);
fulv_MDA_meanSTD     = squeeze(mean([b_std_MDA_PanelA_1(3,:,:); b_std_MDA_PanelA_2(3,:,:); b_std_MDA_PanelA_3(3,:,:)]))';
fulv_MDA_meanSTD_sem = squeeze(std([b_std_MDA_PanelA_1(3,:,:); b_std_MDA_PanelA_2(3,:,:); b_std_MDA_PanelA_3(3,:,:)]))'./sqrt(3);

dox_MDA_meanSGR     = squeeze(mean([b_mean_MDA_PanelA_1(4,:,:); b_mean_MDA_PanelA_2(3,:,:); b_mean_MDA_PanelA_3(4,:,:)]))';
dox_MDA_meanSGR_sem = squeeze(std([b_mean_MDA_PanelA_1(4,:,:); b_mean_MDA_PanelA_2(3,:,:); b_mean_MDA_PanelA_3(4,:,:)]))'./sqrt(3);
dox_MDA_meanSTD     = squeeze(mean([b_std_MDA_PanelA_1(4,:,:); b_std_MDA_PanelA_2(3,:,:); b_std_MDA_PanelA_3(4,:,:)]))';
dox_MDA_meanSTD_sem = squeeze(std([b_std_MDA_PanelA_1(4,:,:); b_std_MDA_PanelA_2(3,:,:); b_std_MDA_PanelA_3(4,:,:)]))'./sqrt(3);

FU_MDA_meanSGR     = squeeze(mean([b_mean_MDA_PanelA_1(5,:,:); b_mean_MDA_PanelA_2(5,:,:); b_mean_MDA_PanelA_3(5,:,:)]))';
FU_MDA_meanSGR_sem = squeeze(std([b_mean_MDA_PanelA_1(5,:,:); b_mean_MDA_PanelA_2(5,:,:); b_mean_MDA_PanelA_3(5,:,:)]))'./sqrt(3);
FU_MDA_meanSTD     = squeeze(mean([b_std_MDA_PanelA_1(5,:,:); b_std_MDA_PanelA_2(5,:,:); b_std_MDA_PanelA_3(5,:,:)]))';
FU_MDA_meanSTD_sem = squeeze(std([b_std_MDA_PanelA_1(5,:,:); b_std_MDA_PanelA_2(5,:,:); b_std_MDA_PanelA_3(5,:,:)]))'./sqrt(3);

palbo_MDA_meanSGR     = squeeze(mean([b_mean_MDA_PanelB_1(1,[3,5:9],:); b_mean_MDA_PanelB_2(1,[3,5,6,8,11,12],:); b_mean_MDA_PanelB_3(1,[3,5:9],:)]))';
palbo_MDA_meanSGR_sem = squeeze(std([b_mean_MDA_PanelB_1(1,[3,5:9],:); b_mean_MDA_PanelB_2(1,[3,5,6,8,11,12],:); b_mean_MDA_PanelB_3(1,[3,5:9],:)]))'./sqrt(3);
palbo_MDA_meanSTD     = squeeze(mean([b_std_MDA_PanelB_1(1,[3,5:9],:); b_std_MDA_PanelB_2(1,[3,5,6,8,11,12],:); b_std_MDA_PanelB_3(1,[3,5:9],:)]))';
palbo_MDA_meanSTD_sem = squeeze(std([b_std_MDA_PanelB_1(1,[3,5:9],:); b_std_MDA_PanelB_2(1,[3,5,6,8,11,12],:); b_std_MDA_PanelB_3(1,[3,5:9],:)]))'./sqrt(3);

vin_MDA_meanSGR     = squeeze(mean([b_mean_MDA_PanelB_1(2,[3,5:9],:); b_mean_MDA_PanelB_2(2,[3,5,6,8,11,12],:); b_mean_MDA_PanelB_3(2,[3,5:9],:)]))';
vin_MDA_meanSGR_sem = squeeze(std([b_mean_MDA_PanelB_1(2,[3,5:9],:); b_mean_MDA_PanelB_2(2,[3,5,6,8,11,12],:); b_mean_MDA_PanelB_3(2,[3,5:9],:)]))'./sqrt(3);
vin_MDA_meanSTD     = squeeze(mean([b_std_MDA_PanelB_1(2,[3,5:9],:); b_std_MDA_PanelB_2(2,[3,5,6,8,11,12],:); b_std_MDA_PanelB_3(2,[3,5:9],:)]))';
vin_MDA_meanSTD_sem = squeeze(std([b_std_MDA_PanelB_1(2,[3,5:9],:); b_std_MDA_PanelB_2(2,[3,5,6,8,11,12],:); b_std_MDA_PanelB_3(2,[3,5:9],:)]))'./sqrt(3);

carb_MDA_meanSGR     = squeeze(mean([b_mean_MDA_PanelB_1(3,[3,5:9],:); b_mean_MDA_PanelB_2(3,[3,5,6,8,11,12],:); b_mean_MDA_PanelB_3(3,[3,5:9],:)]))';
carb_MDA_meanSGR_sem = squeeze(std ([b_mean_MDA_PanelB_1(3,[3,5:9],:); b_mean_MDA_PanelB_2(3,[3,5,6,8,11,12],:); b_mean_MDA_PanelB_3(3,[3,5:9],:)]))'./sqrt(3);
carb_MDA_meanSTD     = squeeze(mean([b_std_MDA_PanelB_1(3,[3,5:9],:);  b_std_MDA_PanelB_2(3,[3,5,6,8,11,12],:);  b_std_MDA_PanelB_3(3,[3,5:9],:)]))';
carb_MDA_meanSTD_sem = squeeze(std ([b_std_MDA_PanelB_1(3,[3,5:9],:);  b_std_MDA_PanelB_2(3,[3,5,6,8,11,12],:);  b_std_MDA_PanelB_3(3,[3,5:9],:)]))'./sqrt(3);

doc_MDA_meanSGR     = squeeze(mean([b_mean_MDA_PanelB_1(4,[3,5:9],:); b_mean_MDA_PanelB_2(4,[3,5,6,8,11,12],:); b_mean_MDA_PanelB_3(4,[3,5:9],:)]))';
doc_MDA_meanSGR_sem = squeeze(std ([b_mean_MDA_PanelB_1(4,[3,5:9],:); b_mean_MDA_PanelB_2(4,[3,5,6,8,11,12],:); b_mean_MDA_PanelB_3(4,[3,5:9],:)]))'./sqrt(3);
doc_MDA_meanSTD     = squeeze(mean([b_std_MDA_PanelB_1(4,[3,5:9],:);  b_std_MDA_PanelB_2(4,[3,5,6,8,11,12],:);  b_std_MDA_PanelB_3(4,[3,5:9],:)]))';
doc_MDA_meanSTD_sem = squeeze(std ([b_std_MDA_PanelB_1(4,[3,5:9],:);  b_std_MDA_PanelB_2(4,[3,5,6,8,11,12],:);  b_std_MDA_PanelB_3(4,[3,5:9],:)]))'./sqrt(3);


ht_MCF7_meanSGR     = squeeze(mean([b_mean_MCF7_PanelA_1(1,:,:); b_mean_MCF7_PanelA_2(1,:,:); b_mean_MCF7_PanelA_3(1,:,:)]))';
ht_MCF7_meanSGR_sem = squeeze(std([b_mean_MCF7_PanelA_1(1,:,:); b_mean_MCF7_PanelA_2(1,:,:); b_mean_MCF7_PanelA_3(1,:,:)]))'./sqrt(3);
ht_MCF7_meanSTD     = squeeze(mean([b_std_MCF7_PanelA_1(1,:,:); b_std_MCF7_PanelA_2(1,:,:); b_std_MCF7_PanelA_3(1,:,:)]))';
ht_MCF7_meanSTD_sem = squeeze(std([b_std_MCF7_PanelA_1(1,:,:); b_std_MCF7_PanelA_2(1,:,:); b_std_MCF7_PanelA_3(1,:,:)]))'./sqrt(3);

lap_MCF7_meanSGR     = squeeze(mean([b_mean_MCF7_PanelA_1(2,:,:); b_mean_MCF7_PanelA_2(2,:,:); b_mean_MCF7_PanelA_3(2,:,:)]))';
lap_MCF7_meanSGR_sem = squeeze(std([b_mean_MCF7_PanelA_1(2,:,:); b_mean_MCF7_PanelA_2(2,:,:); b_mean_MCF7_PanelA_3(2,:,:)]))'./sqrt(3);
lap_MCF7_meanSTD     = squeeze(mean([b_std_MCF7_PanelA_1(2,:,:); b_std_MCF7_PanelA_2(2,:,:); b_std_MCF7_PanelA_3(2,:,:)]))';
lap_MCF7_meanSTD_sem = squeeze(std([b_std_MCF7_PanelA_1(2,:,:); b_std_MCF7_PanelA_2(2,:,:); b_std_MCF7_PanelA_3(2,:,:)]))'./sqrt(3);

fulv_MCF7_meanSGR     = squeeze(mean([b_mean_MCF7_PanelA_1(3,:,:); b_mean_MCF7_PanelA_2(3,:,:); b_mean_MCF7_PanelA_3(3,:,:)]))';
fulv_MCF7_meanSGR_sem = squeeze(std([b_mean_MCF7_PanelA_1(3,:,:); b_mean_MCF7_PanelA_2(3,:,:); b_mean_MCF7_PanelA_3(3,:,:)]))'./sqrt(3);
fulv_MCF7_meanSTD     = squeeze(mean([b_std_MCF7_PanelA_1(3,:,:); b_std_MCF7_PanelA_2(3,:,:); b_std_MCF7_PanelA_3(3,:,:)]))';
fulv_MCF7_meanSTD_sem = squeeze(std([b_std_MCF7_PanelA_1(3,:,:); b_std_MCF7_PanelA_2(3,:,:); b_std_MCF7_PanelA_3(3,:,:)]))'./sqrt(3);

dox_MCF7_meanSGR     = squeeze(mean([b_mean_MCF7_PanelA_1(4,:,:); b_mean_MCF7_PanelA_2(3,:,:); b_mean_MCF7_PanelA_3(4,:,:)]))';
dox_MCF7_meanSGR_sem = squeeze(std([b_mean_MCF7_PanelA_1(4,:,:); b_mean_MCF7_PanelA_2(3,:,:); b_mean_MCF7_PanelA_3(4,:,:)]))'./sqrt(3);
dox_MCF7_meanSTD     = squeeze(mean([b_std_MCF7_PanelA_1(4,:,:); b_std_MCF7_PanelA_2(3,:,:); b_std_MCF7_PanelA_3(4,:,:)]))';
dox_MCF7_meanSTD_sem = squeeze(std([b_std_MCF7_PanelA_1(4,:,:); b_std_MCF7_PanelA_2(3,:,:); b_std_MCF7_PanelA_3(4,:,:)]))'./sqrt(3);

FU_MCF7_meanSGR     = squeeze(mean([b_mean_MCF7_PanelA_1(5,:,:); b_mean_MCF7_PanelA_2(5,:,:); b_mean_MCF7_PanelA_3(5,:,:)]))';
FU_MCF7_meanSGR_sem = squeeze(std([b_mean_MCF7_PanelA_1(5,:,:); b_mean_MCF7_PanelA_2(5,:,:); b_mean_MCF7_PanelA_3(5,:,:)]))'./sqrt(3);
FU_MCF7_meanSTD     = squeeze(mean([b_std_MCF7_PanelA_1(5,:,:); b_std_MCF7_PanelA_2(5,:,:); b_std_MCF7_PanelA_3(5,:,:)]))';
FU_MCF7_meanSTD_sem = squeeze(std([b_std_MCF7_PanelA_1(5,:,:); b_std_MCF7_PanelA_2(5,:,:); b_std_MCF7_PanelA_3(5,:,:)]))'./sqrt(3);

palbo_MCF7_meanSGR     = squeeze(mean([b_mean_MCF7_PanelB_1(1,[3,5:9],:); b_mean_MCF7_PanelB_2(1,[3,5,6,8,11,12],:); b_mean_MCF7_PanelB_3(1,[3,5,6,8,11,12],:)]))';
palbo_MCF7_meanSGR_sem = squeeze(std([b_mean_MCF7_PanelB_1(1,[3,5:9],:); b_mean_MCF7_PanelB_2(1,[3,5,6,8,11,12],:); b_mean_MCF7_PanelB_3(1,[3,5,6,8,11,12],:)]))'./sqrt(3);
palbo_MCF7_meanSTD     = squeeze(mean([b_std_MCF7_PanelB_1(1,[3,5:9],:); b_std_MCF7_PanelB_2(1,[3,5,6,8,11,12],:); b_std_MCF7_PanelB_3(1,[3,5,6,8,11,12],:)]))';
palbo_MCF7_meanSTD_sem = squeeze(std([b_std_MCF7_PanelB_1(1,[3,5:9],:); b_std_MCF7_PanelB_2(1,[3,5,6,8,11,12],:); b_std_MCF7_PanelB_3(1,[3,5,6,8,11,12],:)]))'./sqrt(3);

vin_MCF7_meanSGR     = squeeze(mean([b_mean_MCF7_PanelB_1(2,[3,5:9],:); b_mean_MCF7_PanelB_2(2,[3,5,6,8,11,12],:); b_mean_MCF7_PanelB_3(2,[3,5,6,8,11,12],:)]))';
vin_MCF7_meanSGR_sem = squeeze(std([b_mean_MCF7_PanelB_1(2,[3,5:9],:); b_mean_MCF7_PanelB_2(2,[3,5,6,8,11,12],:); b_mean_MCF7_PanelB_3(2,[3,5,6,8,11,12],:)]))'./sqrt(3);
vin_MCF7_meanSTD     = squeeze(mean([b_std_MCF7_PanelB_1(2,[3,5:9],:); b_std_MCF7_PanelB_2(2,[3,5,6,8,11,12],:); b_std_MCF7_PanelB_3(2,[3,5,6,8,11,12],:)]))';
vin_MCF7_meanSTD_sem = squeeze(std([b_std_MCF7_PanelB_1(2,[3,5:9],:); b_std_MCF7_PanelB_2(2,[3,5,6,8,11,12],:); b_std_MCF7_PanelB_3(2,[3,5,6,8,11,12],:)]))'./sqrt(3);

carb_MCF7_meanSGR     = squeeze(mean([b_mean_MCF7_PanelB_1(3,[3,5:9],:); b_mean_MCF7_PanelB_2(3,[3,5,6,8,11,12],:); b_mean_MCF7_PanelB_3(3,[3,5:9],:)]))';
carb_MCF7_meanSGR_sem = squeeze(std ([b_mean_MCF7_PanelB_1(3,[3,5:9],:); b_mean_MCF7_PanelB_2(3,[3,5,6,8,11,12],:); b_mean_MCF7_PanelB_3(3,[3,5:9],:)]))'./sqrt(3);
carb_MCF7_meanSTD     = squeeze(mean([b_std_MCF7_PanelB_1(3,[3,5:9],:);  b_std_MCF7_PanelB_2(3,[3,5,6,8,11,12],:);  b_std_MCF7_PanelB_3(3,[3,5:9],:)]))';
carb_MCF7_meanSTD_sem = squeeze(std ([b_std_MCF7_PanelB_1(3,[3,5:9],:);  b_std_MCF7_PanelB_2(3,[3,5,6,8,11,12],:);  b_std_MCF7_PanelB_3(3,[3,5:9],:)]))'./sqrt(3);

doc_MCF7_meanSGR     = squeeze(mean([b_mean_MCF7_PanelB_1(4,[3,5:9],:); b_mean_MCF7_PanelB_2(4,[3,5,6,8,11,12],:); b_mean_MCF7_PanelB_3(4,[3,5:9],:)]))';
doc_MCF7_meanSGR_sem = squeeze(std ([b_mean_MCF7_PanelB_1(4,[3,5:9],:); b_mean_MCF7_PanelB_2(4,[3,5,6,8,11,12],:); b_mean_MCF7_PanelB_3(4,[3,5:9],:)]))'./sqrt(3);
doc_MCF7_meanSTD     = squeeze(mean([b_std_MCF7_PanelB_1(4,[3,5:9],:);  b_std_MCF7_PanelB_2(4,[3,5,6,8,11,12],:);  b_std_MCF7_PanelB_3(4,[3,5:9],:)]))';
doc_MCF7_meanSTD_sem = squeeze(std ([b_std_MCF7_PanelB_1(4,[3,5:9],:);  b_std_MCF7_PanelB_2(4,[3,5,6,8,11,12],:);  b_std_MCF7_PanelB_3(4,[3,5:9],:)]))'./sqrt(3);



ht_BT474_meanSGR     = squeeze(mean([b_mean_BT474_PanelA_1(1,:,:); b_mean_BT474_PanelA_2(1,:,:); b_mean_BT474_PanelA_3(1,:,:)]))';
ht_BT474_meanSGR_sem = squeeze(std([b_mean_BT474_PanelA_1(1,:,:); b_mean_BT474_PanelA_2(1,:,:); b_mean_BT474_PanelA_3(1,:,:)]))'./sqrt(3);
ht_BT474_meanSTD     = squeeze(mean([b_std_BT474_PanelA_1(1,:,:); b_std_BT474_PanelA_2(1,:,:); b_std_BT474_PanelA_3(1,:,:)]))';
ht_BT474_meanSTD_sem = squeeze(std([b_std_BT474_PanelA_1(1,:,:); b_std_BT474_PanelA_2(1,:,:); b_std_BT474_PanelA_3(1,:,:)]))'./sqrt(3);

lap_BT474_meanSGR     = squeeze(mean([b_mean_BT474_PanelA_1(2,:,:); b_mean_BT474_PanelA_2(2,:,:); b_mean_BT474_PanelA_3(2,:,:)]))';
lap_BT474_meanSGR_sem = squeeze(std([b_mean_BT474_PanelA_1(2,:,:); b_mean_BT474_PanelA_2(2,:,:); b_mean_BT474_PanelA_3(2,:,:)]))'./sqrt(3);
lap_BT474_meanSTD     = squeeze(mean([b_std_BT474_PanelA_1(2,:,:); b_std_BT474_PanelA_2(2,:,:); b_std_BT474_PanelA_3(2,:,:)]))';
lap_BT474_meanSTD_sem = squeeze(std([b_std_BT474_PanelA_1(2,:,:); b_std_BT474_PanelA_2(2,:,:); b_std_BT474_PanelA_3(2,:,:)]))'./sqrt(3);

fulv_BT474_meanSGR     = squeeze(mean([b_mean_BT474_PanelA_1(3,:,:); b_mean_BT474_PanelA_2(3,:,:); b_mean_BT474_PanelA_3(3,:,:)]))';
fulv_BT474_meanSGR_sem = squeeze(std([b_mean_BT474_PanelA_1(3,:,:); b_mean_BT474_PanelA_2(3,:,:); b_mean_BT474_PanelA_3(3,:,:)]))'./sqrt(3);
fulv_BT474_meanSTD     = squeeze(mean([b_std_BT474_PanelA_1(3,:,:); b_std_BT474_PanelA_2(3,:,:); b_std_BT474_PanelA_3(3,:,:)]))';
fulv_BT474_meanSTD_sem = squeeze(std([b_std_BT474_PanelA_1(3,:,:); b_std_BT474_PanelA_2(3,:,:); b_std_BT474_PanelA_3(3,:,:)]))'./sqrt(3);

dox_BT474_meanSGR     = squeeze(mean([b_mean_BT474_PanelA_1(4,:,:); b_mean_BT474_PanelA_2(3,:,:); b_mean_BT474_PanelA_3(4,:,:)]))';
dox_BT474_meanSGR_sem = squeeze(std([b_mean_BT474_PanelA_1(4,:,:); b_mean_BT474_PanelA_2(3,:,:); b_mean_BT474_PanelA_3(4,:,:)]))'./sqrt(3);
dox_BT474_meanSTD     = squeeze(mean([b_std_BT474_PanelA_1(4,:,:); b_std_BT474_PanelA_2(3,:,:); b_std_BT474_PanelA_3(4,:,:)]))';
dox_BT474_meanSTD_sem = squeeze(std([b_std_BT474_PanelA_1(4,:,:); b_std_BT474_PanelA_2(3,:,:); b_std_BT474_PanelA_3(4,:,:)]))'./sqrt(3);

FU_BT474_meanSGR     = squeeze(mean([b_mean_BT474_PanelA_1(5,:,:); b_mean_BT474_PanelA_2(5,:,:); b_mean_BT474_PanelA_3(5,:,:)]))';
FU_BT474_meanSGR_sem = squeeze(std([b_mean_BT474_PanelA_1(5,:,:); b_mean_BT474_PanelA_2(5,:,:); b_mean_BT474_PanelA_3(5,:,:)]))'./sqrt(3);
FU_BT474_meanSTD     = squeeze(mean([b_std_BT474_PanelA_1(5,:,:); b_std_BT474_PanelA_2(5,:,:); b_std_BT474_PanelA_3(5,:,:)]))';
FU_BT474_meanSTD_sem = squeeze(std([b_std_BT474_PanelA_1(5,:,:); b_std_BT474_PanelA_2(5,:,:); b_std_BT474_PanelA_3(5,:,:)]))'./sqrt(3);

palbo_BT474_meanSGR     = squeeze(mean([b_mean_BT474_PanelB_1(1,[3,5,6,8,11,12],:); b_mean_BT474_PanelB_2(1,[3,5,6,8,11,12],:); b_mean_BT474_PanelB_3(1,[3,5:9],:)]))';
palbo_BT474_meanSGR_sem = squeeze(std([b_mean_BT474_PanelB_1(1,[3,5,6,8,11,12],:); b_mean_BT474_PanelB_2(1,[3,5,6,8,11,12],:); b_mean_BT474_PanelB_3(1,[3,5:9],:)]))'./sqrt(3);
palbo_BT474_meanSTD     = squeeze(mean([b_std_BT474_PanelB_1(1,[3,5,6,8,11,12],:); b_std_BT474_PanelB_2(1,[3,5,6,8,11,12],:); b_std_BT474_PanelB_3(1,[3,5:9],:)]))';
palbo_BT474_meanSTD_sem = squeeze(std([b_std_BT474_PanelB_1(1,[3,5,6,8,11,12],:); b_std_BT474_PanelB_2(1,[3,5,6,8,11,12],:); b_std_BT474_PanelB_3(1,[3,5:9],:)]))'./sqrt(3);

vin_BT474_meanSGR     = squeeze(mean([b_mean_BT474_PanelB_1(2,[3,5,6,8,11,12],:); b_mean_BT474_PanelB_2(2,[3,5,6,8,11,12],:); b_mean_BT474_PanelB_3(2,[3,5,6,8,11,12],:)]))';
vin_BT474_meanSGR_sem = squeeze(std([b_mean_BT474_PanelB_1(2,[3,5,6,8,11,12],:); b_mean_BT474_PanelB_2(2,[3,5,6,8,11,12],:); b_mean_BT474_PanelB_3(2,[3,5,6,8,11,12],:)]))'./sqrt(3);
vin_BT474_meanSTD     = squeeze(mean([b_std_BT474_PanelB_1(2,[3,5,6,8,11,12],:); b_std_BT474_PanelB_2(2,[3,5,6,8,11,12],:); b_std_BT474_PanelB_3(2,[3,5,6,8,11,12],:)]))';
vin_BT474_meanSTD_sem = squeeze(std([b_std_BT474_PanelB_1(2,[3,5,6,8,11,12],:); b_std_BT474_PanelB_2(2,[3,5,6,8,11,12],:); b_std_BT474_PanelB_3(2,[3,5,6,8,11,12],:)]))'./sqrt(3);

carb_BT474_meanSGR     = squeeze(mean([b_mean_BT474_PanelB_1(3,[3,5,6,8,11,12],:); b_mean_BT474_PanelB_2(3,[3,5,6,8,11,12],:); b_mean_BT474_PanelB_3(3,[3,5,6,8,11,12],:)]))';
carb_BT474_meanSGR_sem = squeeze(std ([b_mean_BT474_PanelB_1(3,[3,5,6,8,11,12],:); b_mean_BT474_PanelB_2(3,[3,5,6,8,11,12],:); b_mean_BT474_PanelB_3(3,[3,5,6,8,11,12],:)]))'./sqrt(3);
carb_BT474_meanSTD     = squeeze(mean([b_std_BT474_PanelB_1(3,[3,5,6,8,11,12],:);  b_std_BT474_PanelB_2(3,[3,5,6,8,11,12],:);  b_std_BT474_PanelB_3(3,[3,5,6,8,11,12],:)]))';
carb_BT474_meanSTD_sem = squeeze(std ([b_std_BT474_PanelB_1(3,[3,5,6,8,11,12],:);  b_std_BT474_PanelB_2(3,[3,5,6,8,11,12],:);  b_std_BT474_PanelB_3(3,[3,5,6,8,11,12],:)]))'./sqrt(3);

doc_BT474_meanSGR     = squeeze(mean([b_mean_BT474_PanelB_1(4,[3,5,6,8,11,12],:); b_mean_BT474_PanelB_2(4,[3,5,6,8,11,12],:); b_mean_BT474_PanelB_3(4,[3,5,6,8,11,12],:)]))';
doc_BT474_meanSGR_sem = squeeze(std ([b_mean_BT474_PanelB_1(4,[3,5,6,8,11,12],:); b_mean_BT474_PanelB_2(4,[3,5,6,8,11,12],:); b_mean_BT474_PanelB_3(4,[3,5,6,8,11,12],:)]))'./sqrt(3);
doc_BT474_meanSTD     = squeeze(mean([b_std_BT474_PanelB_1(4,[3,5,6,8,11,12],:);  b_std_BT474_PanelB_2(4,[3,5,6,8,11,12],:);  b_std_BT474_PanelB_3(4,[3,5,6,8,11,12],:)]))';
doc_BT474_meanSTD_sem = squeeze(std ([b_std_BT474_PanelB_1(4,[3,5,6,8,11,12],:);  b_std_BT474_PanelB_2(4,[3,5,6,8,11,12],:);  b_std_BT474_PanelB_3(4,[3,5,6,8,11,12],:)]))'./sqrt(3);












