function pop = generate(num)
res = [];
%generate num random populations
for i = 1:num
    tmp = [0 0 0 0 0 0 0 0 0 0 0 0 0];
    tmp0 = [1 2 3 4 5 6 7 8 9 10 11 12 13];
    for j = 1:13
        %random index
        index = randi([1 14-j]);
        tmp(j) = tmp0(index);
        %delete randomly selected element
        tmp0(:,index) = [];
    end
    res = [res;tmp];
end
pop = res;
end