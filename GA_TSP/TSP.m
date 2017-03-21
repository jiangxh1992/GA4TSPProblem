function tmp = TSP()
close all;
clc;

%----------------------------data area-------------------------------------
% distance from a city to others
Amsterdam    = [0    2.2  18.1 4.8  9.2  8.4  5.2  0.4  9.3  11.3 10.2 0.4  10.4]; %1
Athens       = [2.2  0    17.5 2.8  7.9  6.6  3.3  1.8  8.5  9.8  8.7  2.4  9.6];  %2
Auckland     = [18.1 17.5 0    14.7 9.6  10.9 14.2 18.2 9.1  7.6  8.7  18.3 8.0];  %3
Bahrain      = [4.8  2.8  14.7 0    5.4  3.8  0.5  4.4  6.4  7.0  6.0  5.1  7.4];  %4
Bangkok      = [9.2  7.9  9.6  5.4  0    2.4  4.9  9.0  1.7  2.3  1.2  9.5  2.2];  %5
Colombo      = [8.4  6.6  10.9 3.8  2.4  0    3.3  8.1  4.1  3.3  2.5  8.7  4.6];  %6
Dubai        = [5.2  3.3  14.2 0.5  4.9  3.3  0    4.8  6.0  6.6  5.5  5.5  6.9];  %7
Frankflurt   = [0.4  1.8  18.2 4.4  9.0  8.1  4.8  0    9.2  11.1 10.0 0.6  10.3]; %8
HK           = [9.3  8.5  9.1  6.4  1.7  4.1  6.0  9.2  0    3.3  2.5  9.6  1.1];  %9
Jakarta      = [11.3 9.8  7.6  7.0  2.3  3.3  6.6  11.1 3.3  0    1.2  11.7 2.8];  %10
KualaLumpur  = [10.2 8.7  8.7  6.0  1.2  2.5  5.5  10.0 2.5  1.2  0    10.5 2.5];  %11
London       = [0.4  2.4  18.3 5.1  9.5  8.7  5.5  0.6  9.6  11.7 10.5 0    10.7]; %12
Manila       = [10.4 9.6  8.0  7.4  2.2  4.6  6.9  10.3 1.1  2.8  2.5  10.7 0];    %13
costM = [Amsterdam;Athens;Auckland;Bahrain;Bangkok;Colombo;Dubai;Frankflurt;HK;Jakarta;KualaLumpur;London;Manila];

%mutation probability
pmutation = 1.0;
%max generation
MaxGeneration = 200;
%poputation size
popsize = 20;
%select popsize parents from randomsize generated possible parents
randsize = 200;

%parent generations
parentpop = [];
%best parent of every generation
best_cost = [];

%-------------------generate parent generation-----------------------------
preparentpop = generate(randsize);
[A,index] = sort(cost(preparentpop,costM),1,'ascend');
%orderd preparentpop
orderedpreparentpop = preparentpop(index,:);
%selected top popsize parentpop
parentpop = orderedpreparentpop([1:popsize],:);

%---------------------main revolution loop---------------------------------
for igen = 1:MaxGeneration
    childpop = [];
    childpopsize = [0 0];
    %generate enough children
    while childpopsize(1) < popsize
        % To generate the random index for crossover and mutation 
        ind=randi(popsize,[1 2]) ;
        parent1 = parentpop(ind(1),:);
        parent2 = parentpop(ind(2),:);
        [child1,child2] = crossover(parent1,parent2);
        [child3] = mutation(parent1,pmutation);
        if child1~=0
            childpop = [childpop;child1];
        end
        if child2~=0
            childpop = [childpop;child2];
        end
        if child3~=0
            childpop = [childpop;child3];
        end
        childpopsize = size(childpop);
    end
    
    % Elite: parentpop and childpop are added together before sorting for the best popsize to continue
    allpop = [parentpop;childpop];
    [A,index] = sort(cost(allpop,costM),1,'ascend');
    orderdallpop = allpop(index,:);
    %parentpop of current generation
    parentpop = orderdallpop([1:popsize],:);
    best_cost(igen)=A(1);
end

%display
display('the best parentpop:')
parentpop
display('the lowest cost of every generation:')
best_cost'

figure,plot(1:igen,best_cost,'b') 
title('GA algorithm for TSP problem')

end