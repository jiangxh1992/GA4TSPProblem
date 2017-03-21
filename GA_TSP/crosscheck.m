%check if the two parent can generate valid children after crossover
function res = crosscheck(parent1,parent2)
res = 0;
for i = 1:12
    p1 = [parent1(:,1:i) parent2(:,i+1:13)];
    p2 = [parent2(:,1:i) parent1(:,i+1:13)];
    if length(p1)==length(unique(p1)) && length(p2)==length(unique(p2))
        res = 1;
    end
end
end