clc
clear 
close all

outdirect = '/media/didpurwanto/DiskD/BMVC/';

viddirect = '/media/didpurwanto/DiskD/BMVC2019/Ixmas_flow_bmvc2/';
src = dir(viddirect);
src = src(3:end);

for k = 1:length(src)
    k
%     vid = [viddirect, src(k).name, '\lrsr\'];
%     target = [outdirect, src(k).name,'\sr_i\'];
%     if ~exist(target) mkdir(target); end
%     copyfile(vid,target)
    
    vidx = [viddirect, src(k).name, '/sr_x/'];
    targetx = [outdirect, src(k).name,'/srf_x/'];
    if ~exist(targetx) mkdir(targetx); end
    copyfile(vidx,targetx)
    
    vidy = [viddirect, src(k).name, '/sr_y/'];
    targety = [outdirect, src(k).name,'/srf_y/'];
    if ~exist(targety) mkdir(targety); end
    copyfile(vidy,targety)
        
end
