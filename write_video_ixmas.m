clc
clear
close all

inp = 'E:\BMVC\';
out = 'E:\BMVC2019\';
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
        videoi = dir([inp, class_folder, '\', vid_folder,'\lrsr\*.jpg']);
        
        for t = 1:length(videoi)
            tt = sprintf('%.04d',t);
            filedata = [inp, class_folder,'\',vid_folder,'\lrsr\',num2str(tt),'.jpg'];
            imag = imread(filedata);
            
            writeVideo(output_vid,imag);
        end
    end
end

% clc
% clear
% 
% a = [3 10]
% b = repelem(a,1,5)