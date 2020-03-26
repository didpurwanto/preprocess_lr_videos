clc
clear
close all

inp = 'E:\BMVC2019\HMDB_bmvc\';
out = 'E:\BMVC2019\HMDB_bmvc_vid\';
dataset_folder = dir(inp);
dataset_folder = dataset_folder(3:end);
count = 0;
for i = 1:length(dataset_folder)
    class_folder = dataset_folder(i).name;
    class = dir([inp, class_folder, '\']);
    class = class(3:end);
    disp(length(class))
    for j = 1:length(class)
        
        vid_folder = class(j).name;
        cfolder = [out, class_folder,'\'];
        if ~exist(cfolder)
            mkdir(cfolder)
        end
        % video
        output_vid = VideoWriter([cfolder, vid_folder,'.avi']);
        output_vid.FrameRate = 10;
        open(output_vid);
        count = count+1;
        disp([num2str(count),' -- ',num2str(i),' - ',num2str(j),' >> ',vid_folder]);
        videoi = dir([inp, class_folder, '\', vid_folder,'\combineLRSR\*.jpg']);
        
        for t = 1:length(videoi)
            filedata = [inp, class_folder,'\',vid_folder,'\combineLRSR\',num2str(t),'.jpg'];
            imag = imread(filedata);
            tt = sprintf('%.04d',t);
            
            writeVideo(output_vid,img);
        end
    end
end