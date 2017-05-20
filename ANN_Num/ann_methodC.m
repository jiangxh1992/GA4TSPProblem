function annC = ann_methodC(imgs)

%use each individual pixel as one input
cell_data = cell(10,1);

for i = 1:10
    cell_data{i} = imgs{i};
end
input_data = cell2mat(cell_data);
annC = input_data;
end