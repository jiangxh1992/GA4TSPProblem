function annB = ann_methodB(imgs) 

%divide the img into 7 segments and collect average values as input data
cell_data = cell(10,1);

for i = 1:10
    seg1 = imgs{i}(1:2,1:3);
    seg2 = imgs{i}(1:2,4:5);
    seg3 = imgs{i}(1:2,6:7);
    seg4 = imgs{i}(1:2,8:10);
    
    seg5 = imgs{i}(3:5,1:3);
    seg6 = imgs{i}(3:5,4:5);
    seg7 = imgs{i}(3:5,6:7);
    seg8 = imgs{i}(3:5,8:10);
    
    seg9 = imgs{i}(6:7,1:3);
    seg10 = imgs{i}(6:7,4:5);
    seg11 = imgs{i}(6:7,6:7);
    seg12 = imgs{i}(6:7,8:10);
    
    seg13 = imgs{i}(8:9,1:3);
    seg14 = imgs{i}(8:9,4:5);
    seg15 = imgs{i}(8:9,6:7);
    seg16 = imgs{i}(8:9,8:10);
    
    seg17 = imgs{i}(10:11,1:3);
    seg18 = imgs{i}(10:11,4:5);
    seg19 = imgs{i}(10:11,6:7);
    seg20 = imgs{i}(10:11,8:10);
    
    seg21 = imgs{i}(12:13,1:3);
    seg22 = imgs{i}(12:13,4:5);
    seg23 = imgs{i}(12:13,6:7);
    seg24 = imgs{i}(12:13,8:10);
    
    seg25 = imgs{i}(14:15,1:3);
    seg26 = imgs{i}(14:15,4:5);
    seg27 = imgs{i}(14:15,6:7);
    seg28 = imgs{i}(14:15,8:10);
    
    seg29 = imgs{i}(16:18,1:3);
    seg30 = imgs{i}(16:18,4:5);
    seg31 = imgs{i}(16:18,6:7);
    seg32 = imgs{i}(16:18,8:10);
    
    seg33 = imgs{i}(19:20,1:3);
    seg34 = imgs{i}(19:20,4:5);
    seg35 = imgs{i}(19:20,6:7);
    seg36 = imgs{i}(19:20,8:10);
    
    inputi = [mean(seg1(:)),mean(seg2(:)),mean(seg3(:)),mean(seg4(:)),mean(seg5(:)),mean(seg6(:)),mean(seg7(:)),mean(seg8(:)),mean(seg9(:)),mean(seg10(:)),mean(seg11(:)),mean(seg12(:)),mean(seg13(:)),mean(seg14(:)),mean(seg15(:)),mean(seg16(:)),mean(seg17(:)),mean(seg18(:)),mean(seg19(:)),mean(seg20(:)),mean(seg21(:)),mean(seg22(:)),mean(seg23(:)),mean(seg24(:)),mean(seg25(:)),mean(seg26(:)),mean(seg27(:)),mean(seg28(:)),mean(seg29(:)),mean(seg30(:)),mean(seg31(:)),mean(seg32(:)),mean(seg33(:)),mean(seg34(:)),mean(seg35(:)),mean(seg36(:)),];
    cell_data{i} = inputi;
end
input_data = cell2mat(cell_data)';
annB = input_data;
end