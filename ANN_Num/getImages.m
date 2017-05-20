function imglist = getImages(filepath)

%count file number
files = dir(filepath);
n = length(files);

%imgs array
imglist = cell(1,10);

%add root path
addpath(filepath);

%read imgs
for i = 1:10
    img = imread([num2str(i-1),'numV.bmp']);
    %imshow(img);
    %convert the image into double(only r channel will be saved)
    bwimg=img(:,:,1)/255;
    imglist{i}=bwimg;
end

end