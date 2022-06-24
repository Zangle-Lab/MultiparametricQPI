%%
function [b, cells_loc, cells_drug, cells_conc,cells_ID,b_raw,a_raw,cells_intmass,cells_meanmass,cells_finalmass] ...
    = sgrmaker_mean(tracks,tracksColHeaders, StartFrame, EndFrame, minmass, minp)
%%% This code 'sgrmaker_mean.m' is copyright 2021
% Authors: Tarek E. Mustafa, Edward R. Polanco, Thomas A. Zangle
% This code is distributed under a creative commons attributable
% sharealike license. This license allows you to remix, adapt, and build 
% upon this work, as long as the authors are credited and the modified code
% is redistributed under the same license.

if nargin ==4
    minmass = 80;
    minp      = EndFrame-StartFrame;
end

if nargin ==5
    minp      = EndFrame-StartFrame;
end
[cells, cells_loc, cells_drug, cells_conc, cells_ID] = cellhunt_frame(tracks,tracksColHeaders, StartFrame, EndFrame, minmass,minp);
%This loop is used to preform regression for each cell that meet the min
%path length
leen = cellfun(@length,cells);

cells_mod     = cell(length(cells),1);
xav           = zeros(length(cells),1);
x2            = zeros(length(cells),1);
yav           = zeros(length(cells),1);
xy            = zeros(length(cells),1);
b_raw         = zeros(length(cells),1);
a_raw         = zeros(length(cells),1);
mean_mass     = zeros(length(cells),1);
r2            = zeros(length(cells),1);
TSS           = zeros(length(cells),1);
LRSS          = zeros(length(cells),1);
syx           = zeros(length(cells),1);
syxy          = zeros(length(cells),1);

sb            = zeros(length(cells),1);

cells_intmass   = zeros(length(cells),1);
cells_finalmass = zeros(length(cells),1);
for i= 1:length(cells)
        % Set each cell inital time to zero  imfilter(cells{i}(:,2), fspecial('gaussian', [12 12], 3))
        cells_mod{i}= [cells{i}(:,1)-cells{i}(1,1) cells{i}(:,2)];
        
        % Calculate paramters used for regression
        % For more insight check Zar's book on biostatistics chapter 17
        xav(i)      = mean(cells_mod{i}(:,1));
        x           = cells_mod{i}(:,1)-xav(i);
        x2(i)       = sum(x.^2);
        yav(i)      = mean(cells_mod{i}(:,2));
        y            = cells_mod{i}(:,2)-yav(i);
        xy(i)       = sum(x.*y);
        b_raw(i)    = xy(i)/x2(i);
        % Growth rate of each cell
        a_raw(i)    = yav(i)-b_raw(i)*xav(i);
%         mean_mass(i)= mean(cells{i}(:,2));
        % Y intercept of each cell (intial mass)
%         r2(i)       = (xy(i)^2/x2(i))/sum(y.^2);
        TSS(i) = sum(y.^2);
        LRSS(i) = (xy(i)^2/x2(i));
        syx(i)  = sqrt((TSS(i) - LRSS(i))/(leen(i)-2));
        
        cells_intmass(i) = cells_mod{i}(1,2);
        
        cells_finalmass(i)=cells_mod{i}(end,2);
%         syxy(i) = syx(i)/yav(i);
%         sb(i)   = sqrt(syx(i)^2/x2(i));
end

cells_meanmass = yav;
% normalize growth rate by y intercept
b           = b_raw./a_raw;

% for jj = 1:max(cells_drug)
%     drug_conc = unique(cells_conc(cells_drug==jj));
%     for ii = 1:length(drug_conc)
%         x = cells_drug' == jj & cells_conc'==drug_conc(ii) ;
%         z = b>= mean(b(x))+3*std(b(x)) | b<= mean(b(x))-3*std(b(x));
%         b(x&z) = [];
%         cells_conc(x&z)=[];
%         cells_drug(x&z)=[];
%         cells_loc(x&z)=[];
% 
%     end
% end
% 
c=-1/(sqrt(2)*erfcinv(3/2));
% MADsb = c*median(abs(sb-median(sb)));
MADsyx = c*median(abs(syx-median(syx)));
MADb = c*median(abs(b-median(b)));

% lsb = find(sb>median(sb)+3*MADsb);
lsyx= find(syx>median(syx)+3*MADsyx);
lb  = find(b>median(b)+3*MADb|b<median(b)-3*MADb);
% ss  = unique([lb; lsyx]);
% b(ss) = [];
% cells_conc(ss)=[];
% cells_drug(ss)=[];
% cells_loc(ss)=[];

for jj = 1:max(cells_drug)
    drug_conc = unique(cells_conc(cells_drug==jj));
    for ii = 1:length(drug_conc)
        x = cells_drug == jj & cells_conc==drug_conc(ii) ;
        x = x';
        MADsyx = c*median(abs(syx(x)-median(syx(x))));
        MADb = c*median(abs(b(x)-median(b(x))));
        z = b>=median(b(x))+3*MADb | b<=median(b(x))-3*MADb;
        y = syx>=median(syx(x))+3*MADsyx;
        zy = z|y;
        b(x&zy) = [];
        cells_conc(x&zy)=[];
        cells_drug(x&zy)=[];
        cells_loc(x&zy)=[];
        cells_ID(x&zy)=[];
        syx(x&zy)=[];
        b_raw(x&zy) = [];
        a_raw(x&zy) = [];
        cells_intmass(x&zy) = [];
        cells_meanmass(x&zy) = [];
        cells_finalmass(x&zy) = [];
    end
end

end