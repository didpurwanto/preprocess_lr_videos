data = imread('a0001.jpg');
b = imresize(data, [16 14]);
imshow(b)
imwrite(b,'a.jpg')