clc
clear 
close all

outdirect = 'E:\BMVC2019\HMDB_bmvc_flow_lrsr\';
if ~exist(outdirect)
    mkdir(outdirect)
end
viddirect = 'E:\BMVC2019\HMDB_bmvc_vid_lrsr\';
src = dir(viddirect);
src = src(3:end);
count = 0;

for k = 1:length(src)
    fname = src(k).name;
    fdir = dir([viddirect,fname,'\*avi']);
    
    
    for l = 1:length(fdir)
        outdir = [outdirect, fname];
        vidname = fdir(l).name(1:end-4);
        disp([num2str(count),' -- ',num2str(k),' - ',num2str(l),' - ',vidname]);
        
        if ~exist(outdir, 'dir') mkdir(outdir); end
        
        folderfilex = [outdirect,fname,'\',vidname,'\mini_x'];   
        if ~exist(folderfilex, 'dir') mkdir(folderfilex); end
        folderfiley = [outdirect,fname,'\',vidname,'\mini_y'];   
        if ~exist(folderfiley, 'dir') mkdir(folderfiley); end
        
        namee = [viddirect,fname,'\',vidname,'.avi'];
        system(['denseFlow2.exe -f ',namee,' -x ',folderfilex,'\flow_x -y ',folderfiley,'\flow_y -b 20 -t 1 -d 3']);
        count = count+1;
        
    end
end
