function [cells, cells_loc, cells_drug, cells_conc,cells_ID] = cellhunt_frame(tracks, tracksColHeaders, StartFrame, EndFrame,minmass,minp)
%%% This code 'cellhunt_frame.m' is copyright 2021
% Authors: Tarek E. Mustafa, Edward R. Polanco, Thomas A. Zangle
% This code is distributed under a creative commons attributable
% sharealike license. This license allows you to remix, adapt, and build 
% upon this work, as long as the authors are credited and the modified code
% is redistributed under the same license.

if nargin == 2
    StartFrame = 0;
    EndFrame   = Inf;
    minmass    = 80;
    minp       = 20;
end
%First load tracks and trackheader 
% load([froot,'data_allframes.mat'],'tracks','tracksColHeaders');
% load([froot,'mass.mat'])
% Use trackheader to find location of drugID, concentration, time and
% frameID columns locations
% drugloc   = matches(tracksColHeaders,'condition_drugID');
drugloc   = 11;
% concloc   = matches(tracksColHeaders,'condition_concentration (um)');
concloc   = 12;
% timeloc   = matches(tracksColHeaders,'Time (h)');
timeloc   = 4;
% frameloc  = matches(tracksColHeaders,'Frame ID');
frameloc  = 9;
% cellsloc  = matches(tracksColHeaders,'id');
cellsloc  = 5;
% tracks(:,3)  = mass;
% masstracks = tracks(:,3);
% cellstracks = tracks(:,5);
% for i = 1:max(tracks(:,5))
% tracks(cellstracks == i,3)= medfilt2(masstracks(cellstracks==i),[filtersize,1],'symmetric');
% end

% find the cells id that exist between start frame and end frame
target      = tracks(:,frameloc)>= StartFrame & tracks(:,frameloc)<= EndFrame;
% the next line will find cells ID between frames then
cellsID       = unique(tracks(target,cellsloc));
Ncount        = histc(tracks(target,cellsloc),cellsID); 
targetcells   = cellsID(Ncount>= minp);


newtracks  = tracks(target,:);


remove= zeros(1,length(targetcells)); % Empty array to track how many cells were removed
mass  =  newtracks(:,3);
IDs   = newtracks(:,5);
for i = 1:length(targetcells)
    y = IDs==targetcells(i);
    m = mean(mass(y));
    if m <= minmass
        remove(i) = 1;
    end
end
z   = remove>0;
targetcells(z)=[];
    
    
    
cells         = cell(1,length(targetcells));
cells_loc     = zeros(1,length(targetcells));
cells_drug    = zeros(1,length(targetcells));
cells_conc    = zeros(1,length(targetcells));
cells_ID      = zeros(1,length(targetcells));
IDs   = newtracks(:,5);
for z = 1:length(targetcells)
    x = IDs == targetcells(z);
    target_tracks  = newtracks(x,:);
    cells{z}      =[target_tracks(:,timeloc) medfilt1(target_tracks(:,3),5,'truncate') target_tracks(:,frameloc)];
%     cells{z}      =[target_tracks(:,timeloc) target_tracks(:,3) target_tracks(:,frameloc)];

    cells_loc(z)  = target_tracks(1,8);
    cells_drug(z) = target_tracks(1,drugloc);
    cells_conc(z) = target_tracks(1,concloc);    
    cells_ID(z)   = target_tracks(1,5);
%     
% Comment the two rows above and uncomment two rows below for MCF7-panel A
% on 072020. The tracks array only had 11 elements back then, not 12
%     cells_drug(z) = target_tracks(1,10);
%     cells_conc(z) = target_tracks(1,11);  
end

end