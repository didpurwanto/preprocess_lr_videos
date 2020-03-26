clc
clear
close all

inp = '/media/didpurwanto/DiskD/ICIP2019/HMDB_new/';
out = '/media/didpurwanto/DiskD/ICIP2019/HMDB_24x24/';
dataset_folder = dir(inp);
dataset_folder = dataset_folder(3:end);
count = 0;
for i = 1:length(dataset_folder)
    class_folder = dataset_folder(i).name;
    class = dir([inp, class_folder, '/']);
    class = class(3:end);
    disp(length(class))
    for j = 1:length(class)
        vid_folder = class(j).name;
        
        videoi = dir([inp, class_folder,'/', vid_folder,'/i/*.jpg']); %rgb
        videox = dir([inp, class_folder,'/', vid_folder,'/x/*.jpg']); %flow_x
        
        %n = min([length(videoi),length(videox)]);
        mini_videoi = [inp, class_folder,'/',vid_folder,'/mini_i/'];
        
        if exist(mini_videoi) == 0 mkdir(mini_videoi)
        end
        
        if exist([out, class_folder,'/']) == 0 mkdir([out, class_folder,'/'])
        end
        
        % video
        output_vid = VideoWriter([out, class_folder,'/', vid_folder,'.avi']);
        output_vid.FrameRate = 10;
        open(output_vid);
        count = count+1;
        disp([num2str(count),' -- ',num2str(i),' - ',vid_folder]);
        
        for t = 1:length(videoi)
            filedata = [inp, class_folder,'/',vid_folder,'/i/',num2str(t),'.jpg'];
            imag = imread(filedata);
            tmp = imresize(imag,0.05);
            % img = imresize(tmp,[112 112]);
            img = tmp;
            % imshow(img);
            
            % 112x112 i
            tt = sprintf('%.04d',t);
            filename1 = [inp(1:end-4),'24x24_frame/', class_folder,'/',vid_folder,'/mini_i_24x24/'];
            if ~exist(filename1)
                mkdir(filename1)
            end
            filename = [filename1, tt,'.jpg'];
            imwrite(img,filename)
            
            writeVideo(output_vid,img);
        end
    end
end