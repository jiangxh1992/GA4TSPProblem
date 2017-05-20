function annA = ann_methodA(imgs)

%divide the img into 7 segments and collect average values as input data
cell_data = cell(10,1);
for i = 1:10
    seg1 = imgs{i}(1:2,2:9);
    seg2 = imgs{i}(10:11,2:9);
    seg3 = imgs{i}(19:20,2:9);
    seg4 = imgs{i}(2:9,1:3);
    seg5 = imgs{i}(2:9,8:10);
    seg6 = imgs{i}(11:19,1:3);
    seg7 = imgs{i}(11:19,8:10);
    inputi = [mean(seg1(:)),mean(seg2(:)),mean(seg3(:)),mean(seg4(:)),mean(seg5(:)),mean(seg6(:)),mean(seg7(:))];
    cell_data{i} = inputi;
end
input_data = cell2mat(cell_data)';
annA = input_data;

end