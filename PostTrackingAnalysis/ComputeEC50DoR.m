%%% This code 'ComputeEC50DoR.m' is copyright 2021
% Authors: Tarek E. Mustafa, Edward R. Polanco, Thomas A. Zangle
% This code is distributed under a creative commons attributable
% sharealike license. This license allows you to remix, adapt, and build 
% upon this work, as long as the authors are credited and the modified code
% is redistributed under the same license.
%%
load('.\data\IC50_output.mat')
%%
BT474_QPI_IC50_24h = EC50_SG_BT474;
                 
MCF7_QPI_IC50_24h = EC50_SG_MCF7;
                 
MDA_QPI_IC50_24h = EC50_SG_MDA;

% replace inf and -inf with NaN for conditions where there was no response
BT474_QPI_IC50_24h(isinf(BT474_QPI_IC50_24h)) = NaN;
MCF7_QPI_IC50_24h(isinf(MCF7_QPI_IC50_24h))   = NaN;
MDA_QPI_IC50_24h(isinf(MDA_QPI_IC50_24h))     = NaN;

%% load depth of response
BT474_QPI_DoR_72h_PanelA = [ ... 
                             
                                 [ (fitresults_SG_BT474{1}.b - fitresults_SG_BT474{1}.a)./fitresults_SG_BT474{1}.b, ...
                                   (fitresults_SG_BT474{2}.b - fitresults_SG_BT474{2}.a)./fitresults_SG_BT474{2}.b, ...
                                   (fitresults_SG_BT474{3}.b - fitresults_SG_BT474{3}.a)./fitresults_SG_BT474{3}.b, ...
                                   (fitresults_SG_BT474{4}.b - fitresults_SG_BT474{4}.a)./fitresults_SG_BT474{4}.b, ...
                                   (fitresults_SG_BT474{5}.b - fitresults_SG_BT474{5}.a)./fitresults_SG_BT474{5}.b  ...
                                 ]; ...
                      
                        	  ];
                          
MCF7_QPI_DoR_72h_PanelA= [ ... 
                                [   (fitresults_SG_MCF7{1}.b - fitresults_SG_MCF7{1}.a)./fitresults_SG_MCF7{1}.b, ...
                                    (fitresults_SG_MCF7{2}.b - fitresults_SG_MCF7{2}.a)./fitresults_SG_MCF7{2}.b, ...
                                    (fitresults_SG_MCF7{3}.b - fitresults_SG_MCF7{3}.a)./fitresults_SG_MCF7{3}.b, ...
                                    (fitresults_SG_MCF7{4}.b - fitresults_SG_MCF7{4}.a)./fitresults_SG_MCF7{4}.b, ...
                                    (fitresults_SG_MCF7{5}.b - fitresults_SG_MCF7{5}.a)./fitresults_SG_MCF7{5}.b
                                ];  ...
                      
                        	  ];
                          
MDA_QPI_DoR_72h= [ ... 
                                [ (fitresults_SG_MDA{1}.b - fitresults_SG_MDA{1}.a)./fitresults_SG_MDA{1}.b, ...
                                  (fitresults_SG_MDA{2}.b - fitresults_SG_MDA{2}.a)./fitresults_SG_MDA{2}.b, ...
                                  (fitresults_SG_MDA{3}.b - fitresults_SG_MDA{3}.a)./fitresults_SG_MDA{3}.b, ...
                                  (fitresults_SG_MDA{4}.b - fitresults_SG_MDA{4}.a)./fitresults_SG_MDA{4}.b, ...
                                  (fitresults_SG_MDA{5}.b - fitresults_SG_MDA{5}.a)./fitresults_SG_MDA{5}.b, ...
                                ]; ...
                         ];
                         
%%
BT474_QPI_DoR_72h= [BT474_QPI_DoR_72h_PanelA, BT474_QPI_DoR_72h_PanelB]';
MCF7_QPI_DoR_72h=[MCF7_QPI_DoR_72h_PanelA, MCF7_QPI_DoR_72h_PanelB]';
MDA_QPI_DoR_72h=[MDA_QPI_DoR_72h_PanelA, MDA_QPI_DoR_72h_PanelB]';


%%
load('.\data\IC50_output_24h.mat')

%%
BT474_QPI_IC50_24h = EC50_SG_BT474;
                 
MCF7_QPI_IC50_24h = EC50_SG_MCF7;
                 
MDA_QPI_IC50_24h = EC50_SG_MDA;

% replace inf and -inf with NaN for conditions where there was no response
BT474_QPI_IC50_24h(isinf(BT474_QPI_IC50_24h)) = NaN;
MCF7_QPI_IC50_24h(isinf(MCF7_QPI_IC50_24h))   = NaN;
MDA_QPI_IC50_24h(isinf(MDA_QPI_IC50_24h))     = NaN;
%%
BT474_QPI_DoR_24h  = [ ... 
                             
                                 [ (fitresults_SG_BT474{1}.b - fitresults_SG_BT474{1}.a)./fitresults_SG_BT474{1}.b, ...
                                  (fitresults_SG_BT474{2}.b - fitresults_SG_BT474{2}.a)./fitresults_SG_BT474{2}.b, ...
                                  (fitresults_SG_BT474{3}.b - fitresults_SG_BT474{3}.a)./fitresults_SG_BT474{3}.b, ...
                                  (fitresults_SG_BT474{4}.b - fitresults_SG_BT474{4}.a)./fitresults_SG_BT474{4}.b, ...
                                  (fitresults_SG_BT474{5}.b - fitresults_SG_BT474{5}.a)./fitresults_SG_BT474{5}.b  ...
                                 ]; ...
                      
                        	  ];
                          
MCF7_QPI_DoR_24h = [ ... 
                                [   (fitresults_SG_MCF7{1}.b - fitresults_SG_MCF7{1}.a)./fitresults_SG_MCF7{1}.b, ...
                                  (fitresults_SG_MCF7{2}.b - fitresults_SG_MCF7{2}.a)./fitresults_SG_MCF7{2}.b, ...
                                  (fitresults_SG_MCF7{3}.b - fitresults_SG_MCF7{3}.a)./fitresults_SG_MCF7{3}.b, ...
                                    (fitresults_SG_MCF7{4}.b - fitresults_SG_MCF7{4}.a)./fitresults_SG_MCF7{4}.b, ...
                                    (fitresults_SG_MCF7{5}.b - fitresults_SG_MCF7{5}.a)./fitresults_SG_MCF7{5}.b
                                ];  ...
                      
                        	  ];
                          
MDA_QPI_DoR_24h = [ ... 
                                [ (fitresults_SG_MDA{1}.b - fitresults_SG_MDA{1}.a)./fitresults_SG_MDA{1}.b, ...
                                  (fitresults_SG_MDA{2}.b - fitresults_SG_MDA{2}.a)./fitresults_SG_MDA{2}.b, ...
                                   (fitresults_SG_MDA{3}.b - fitresults_SG_MDA{3}.a)./fitresults_SG_MDA{3}.b, ...
                                    (fitresults_SG_MDA{4}.b - fitresults_SG_MDA{4}.a)./fitresults_SG_MDA{4}.b, ...
                                   (fitresults_SG_MDA{5}.b - fitresults_SG_MDA{5}.a)./fitresults_SG_MDA{5}.b, ...
                                ]; ...
                             ];




%%
                
fitresults_24h = [fitresults_24h_a,fitresults_24h_b,fitresults_24h_c,fitresults_24h_d];
%% import CTG data

BT474_CTG_DoR_72h  = -1*csvread('.\data\DoR72h_CTGRawData.csv' ,0,0, [0  0  8 2])+1;
BT474_CTG_DoR_24h  = -1*csvread('.\data\DoR24h_CTGRawData.csv' ,0,0, [0  0  8 2])+1;
BT474_CTG_IC50_72h =    csvread('.\data\IC5072h_CTGRawData.csv',0,0, [0  0  8 2]);
BT474_CTG_IC50_24h =    csvread('.\data\IC5024h_CTGRawData.csv',0,0, [0  0  8 2]);

MCF7_CTG_DoR_72h  = -1*csvread('.\data\DoR72h_CTGRawData.csv'  ,11,0,[11 0 19 2])+1;
MCF7_CTG_DoR_24h  = -1*csvread('.\data\DoR24h_CTGRawData.csv'  ,11,0,[11 0 19 2])+1;
MCF7_CTG_IC50_72h =    csvread('.\data\IC5072h_CTGRawData.csv' ,11,0,[11 0 19 2]);
MCF7_CTG_IC50_24h =    csvread('.\data\IC5024h_CTGRawData.csv' ,11,0,[11 0 19 2]);

MDA_CTG_DoR_72h  = -1*csvread('.\data\DoR72h_CTGRawData.csv'   ,22,0,[22 0 30 2])+1;
MDA_CTG_DoR_24h  = -1*csvread('.\data\DoR24h_CTGRawData.csv'   ,22,0,[22 0 30 2])+1;
MDA_CTG_IC50_72h =    csvread('.\data\IC5072h_CTGRawData.csv'  ,22,0,[22 0 30 2]);
MDA_CTG_IC50_24h =    csvread('.\data\IC5024h_CTGRawData.csv'  ,22,0,[22 0 30 2]);

%% find means and sem

BT474_QPI_DoR_72h_mean  = nanmean(BT474_QPI_DoR_72h,2);
BT474_QPI_DoR_24h_mean  = nanmean(BT474_QPI_DoR_24h,2);
BT474_QPI_IC50_72h_mean = nanmean(BT474_QPI_IC50_72h,2);
BT474_QPI_IC50_24h_mean = nanmean(BT474_QPI_IC50_24h,2);

BT474_QPI_DoR_72h_std   = nanstd(BT474_QPI_DoR_72h')';
BT474_QPI_DoR_24h_std   = nanstd(BT474_QPI_DoR_24h')';
BT474_QPI_IC50_72h_std  = nanstd(BT474_QPI_IC50_72h')';
BT474_QPI_IC50_24h_std  = nanstd(BT474_QPI_IC50_24h')';

BT474_QPI_DoR_72h_sem   = BT474_QPI_DoR_72h_std./sqrt(3);
BT474_QPI_DoR_24h_sem   = BT474_QPI_DoR_24h_std./sqrt(3);
BT474_QPI_IC50_72h_sem  = BT474_QPI_IC50_72h_std./sqrt(3);
BT474_QPI_IC50_24h_sem  = BT474_QPI_IC50_24h_std./sqrt(3);

MCF7_QPI_DoR_72h_mean   = nanmean(MCF7_QPI_DoR_72h,2);
MCF7_QPI_DoR_24h_mean   = nanmean(MCF7_QPI_DoR_24h,2);
MCF7_QPI_IC50_72h_mean  = nanmean(MCF7_QPI_IC50_72h,2);
MCF7_QPI_IC50_24h_mean  = nanmean(MCF7_QPI_IC50_24h,2);

MCF7_QPI_DoR_72h_std    = nanstd(MCF7_QPI_DoR_72h')';
MCF7_QPI_DoR_24h_std    = nanstd(MCF7_QPI_DoR_24h')';
MCF7_QPI_IC50_72h_std   = nanstd(MCF7_QPI_IC50_72h')';
MCF7_QPI_IC50_24h_std   = nanstd(MCF7_QPI_IC50_24h')';

MCF7_QPI_DoR_72h_sem    = MCF7_QPI_DoR_72h_std./sqrt(3);
MCF7_QPI_DoR_24h_sem    = MCF7_QPI_DoR_24h_std./sqrt(3);
MCF7_QPI_IC50_72h_sem   = MCF7_QPI_IC50_72h_std./sqrt(3);
MCF7_QPI_IC50_24h_sem   = MCF7_QPI_IC50_24h_std./sqrt(3);

MDA_QPI_DoR_72h_mean    = nanmean(MDA_QPI_DoR_72h,2);
MDA_QPI_DoR_24h_mean    = nanmean(MDA_QPI_DoR_24h,2);
MDA_QPI_IC50_72h_mean   = nanmean(MDA_QPI_IC50_72h,2);
MDA_QPI_IC50_24h_mean   = nanmean(MDA_QPI_IC50_24h,2);

MDA_QPI_DoR_72h_std     = nanstd(MDA_QPI_DoR_72h')';
MDA_QPI_DoR_24h_std     = nanstd(MDA_QPI_DoR_24h')';
MDA_QPI_IC50_72h_std    = nanstd(MDA_QPI_IC50_72h')';
MDA_QPI_IC50_24h_std    = nanstd(MDA_QPI_IC50_24h')';

MDA_QPI_DoR_72h_sem     = MDA_QPI_DoR_72h_std./sqrt(3);
MDA_QPI_DoR_24h_sem     = MDA_QPI_DoR_24h_std./sqrt(3);
MDA_QPI_IC50_72h_sem    = MDA_QPI_IC50_72h_std./sqrt(3);
MDA_QPI_IC50_24h_sem    = MDA_QPI_IC50_24h_std./sqrt(3);

%% curate CTG data

BT474_CTG_DoR_72h_mean  = nanmean(BT474_CTG_DoR_72h,2);
BT474_CTG_DoR_24h_mean  = nanmean(BT474_CTG_DoR_24h,2);
BT474_CTG_IC50_72h_mean = nanmean(BT474_CTG_IC50_72h,2);
BT474_CTG_IC50_24h_mean = nanmean(BT474_CTG_IC50_24h,2);

BT474_CTG_DoR_72h_std   = nanstd(BT474_CTG_DoR_72h')';
BT474_CTG_DoR_24h_std   = nanstd(BT474_CTG_DoR_24h')';
BT474_CTG_IC50_72h_std  = nanstd(BT474_CTG_IC50_72h')';
BT474_CTG_IC50_24h_std  = nanstd(BT474_CTG_IC50_24h')';

BT474_CTG_DoR_72h_sem   = BT474_CTG_DoR_72h_std./sqrt(3);
BT474_CTG_DoR_24h_sem   = BT474_CTG_DoR_24h_std./sqrt(3);
BT474_CTG_IC50_72h_sem  = BT474_CTG_IC50_72h_std./sqrt(3);
BT474_CTG_IC50_24h_sem  = BT474_CTG_IC50_24h_std./sqrt(3);

MCF7_CTG_DoR_72h_mean   = nanmean(MCF7_CTG_DoR_72h,2);
MCF7_CTG_DoR_24h_mean   = nanmean(MCF7_CTG_DoR_24h,2);
MCF7_CTG_IC50_72h_mean  = nanmean(MCF7_CTG_IC50_72h,2);
MCF7_CTG_IC50_24h_mean  = nanmean(MCF7_CTG_IC50_24h,2);

MCF7_CTG_DoR_72h_std    = nanstd(MCF7_CTG_DoR_72h')';
MCF7_CTG_DoR_24h_std    = nanstd(MCF7_CTG_DoR_24h')';
MCF7_CTG_IC50_72h_std   = nanstd(MCF7_CTG_IC50_72h')';
MCF7_CTG_IC50_24h_std   = nanstd(MCF7_CTG_IC50_24h')';

MCF7_CTG_DoR_72h_sem    = MCF7_CTG_DoR_72h_std./sqrt(3);
MCF7_CTG_DoR_24h_sem    = MCF7_CTG_DoR_24h_std./sqrt(3);
MCF7_CTG_IC50_72h_sem   = MCF7_CTG_IC50_72h_std./sqrt(3);
MCF7_CTG_IC50_24h_sem   = MCF7_CTG_IC50_24h_std./sqrt(3);

MDA_CTG_DoR_72h_mean    = nanmean(MDA_CTG_DoR_72h,2);
MDA_CTG_DoR_24h_mean    = nanmean(MDA_CTG_DoR_24h,2);
MDA_CTG_IC50_72h_mean   = nanmean(MDA_CTG_IC50_72h,2);
MDA_CTG_IC50_24h_mean   = nanmean(MDA_CTG_IC50_24h,2);

MDA_CTG_DoR_72h_std     = nanstd(MDA_CTG_DoR_72h')';
MDA_CTG_DoR_24h_std     = nanstd(MDA_CTG_DoR_24h')';
MDA_CTG_IC50_72h_std    = nanstd(MDA_CTG_IC50_72h')';
MDA_CTG_IC50_24h_std    = nanstd(MDA_CTG_IC50_24h')';

MDA_CTG_DoR_72h_sem     = MDA_CTG_DoR_72h_std./sqrt(3);
MDA_CTG_DoR_24h_sem     = MDA_CTG_DoR_24h_std./sqrt(3);
MDA_CTG_IC50_72h_sem    = MDA_CTG_IC50_72h_std./sqrt(3);
MDA_CTG_IC50_24h_sem    = MDA_CTG_IC50_24h_std./sqrt(3);

%%

IC50_CTG_72h = [BT474_CTG_IC50_72h_mean; MCF7_CTG_IC50_72h_mean; MDA_CTG_IC50_72h_mean];
IC50_QPI_72h = [BT474_QPI_IC50_72h_mean; MCF7_QPI_IC50_72h_mean; MDA_QPI_IC50_72h_mean];
IC50_CTG_24h = [BT474_CTG_IC50_24h_mean; MCF7_CTG_IC50_24h_mean; MDA_CTG_IC50_24h_mean];
IC50_QPI_24h = [BT474_QPI_IC50_24h_mean; MCF7_QPI_IC50_24h_mean; MDA_QPI_IC50_24h_mean];
DoR_CTG_72h = [BT474_CTG_DoR_72h_mean; MCF7_CTG_DoR_72h_mean; MDA_CTG_DoR_72h_mean];
DoR_QPI_72h = [BT474_QPI_DoR_72h_mean; MCF7_QPI_DoR_72h_mean; MDA_QPI_DoR_72h_mean];
DoR_CTG_24h = [BT474_CTG_DoR_24h_mean; MCF7_CTG_DoR_24h_mean; MCF7_CTG_DoR_24h_mean];
DoR_QPI_24h = [BT474_QPI_DoR_24h_mean; MCF7_QPI_DoR_24h_mean; MDA_QPI_DoR_24h_mean];


