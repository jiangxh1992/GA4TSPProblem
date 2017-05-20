function main = main()
%clear screen
clc;
clear;
close all;
%string of file path
filepath = './ANN/numV';
imgs = getImages(filepath);
%get input data:A.B.C
input_data = ann_methodC(imgs);

%desired output
d0 = [1 0 0 0 0 0 0 0 0 0];
d1 = [0 1 0 0 0 0 0 0 0 0];
d2 = [0 0 1 0 0 0 0 0 0 0];
d3 = [0 0 0 1 0 0 0 0 0 0];
d4 = [0 0 0 0 1 0 0 0 0 0];
d5 = [0 0 0 0 0 1 0 0 0 0];
d6 = [0 0 0 0 0 0 1 0 0 0];
d7 = [0 0 0 0 0 0 0 1 0 0];
d8 = [0 0 0 0 0 0 0 0 1 0];
d9 = [0 0 0 0 0 0 0 0 0 1];
desired_data = [d0;d1;d2;d3;d4;d5;d6;d7;d8;d9];

%get the trained result
net = ann_train(input_data,desired_data,60,100);

%read the test images files
imgs = getTestData();
%process the test data as input data
cell_data = cell(30,1);
for i = 1:30
    cell_data{i} = imgs{i};
end
%input_data = cell2mat(cell_data);

%get the test result
output=net(input_data);

%calculate the result
[maxvalue,result] = max(output);
%desired result
desired_result = [1 2 3 4 5 6 7 8 9 10];
%desired_result = [desired_result desired_result desired_result]

%calculate the match result
match = desired_result - result;
%get the error number
error_count = sum(match(:)~=0)

end