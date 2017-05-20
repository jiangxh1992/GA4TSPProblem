function imglist = getTestData()

%imgs array
imglist = cell(1,30);

%read imgs
for i = 1:10
    img = imread(['ANN/numS/',num2str(i-1),'numS.bmp']);
    %imshow(img);
    %convert the image into double(only r channel will be saved)
    bwimg=img(:,:,1)/255;
    imglist{i}=bwimg;
end

%read imgs
for i = 1:10
    img = imread(['ANN/numSnoise/',num2str(i-1),'numSn.bmp']);
    %imshow(img);
    %convert the image into double(only r channel will be saved)
    bwimg=img(:,:,1)/255;
    imglist{10+i}=bwimg;
end

%read imgs
for i = 1:10
    img = imread(['ANN/numVnoise/',num2str(i-1),'numVn.bmp']);
    %imshow(img);
    %convert the image into double(only r channel will be saved)
    bwimg=img(:,:,1)/255;
    imglist{20+i}=bwimg;
end

end