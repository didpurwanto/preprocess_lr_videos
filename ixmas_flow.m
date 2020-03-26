clc
clear 
close all

outdirect = 'E:\BMVC2019\Ixmas_flow_bmvc2\';
if ~exist(outdirect)
    mkdir(outdirect)
end
viddirect = 'E:\BMVC2019\IXMAS_dbpn_sr\';
src = dir([viddirect,'\*avi']);

for k = 32:length(src)
        k
        tic
        fname = src(k).name;
        outdir = [outdirect, fname(1:end-4)];
        vidname = [viddirect, fname];
        
        folderfilex = [outdir,'\sr_x'];   
        if ~exist(folderfilex, 'dir') mkdir(folderfilex); end
        folderfiley = [outdir,'\sr_y'];   
        if ~exist(folderfiley, 'dir') mkdir(folderfiley); end
        system(['denseFlow.exe -f ',vidname,' -x ',folderfilex,'\flow_x -y ',folderfiley,'\flow_y -b 20 -t 1 -d 3']);
        toc
end
