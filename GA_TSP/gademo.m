function res = gademo()
% ELEC 6604  Dr. G. Pang
% Example on the MATLAB implementation of the Genetic Algorithm
% Feb 2017

% based on paper2 (EV charging, 3 players)

% Problem description:
% Three players: 
% player 1, demand 6 kW/hr, 5 time intervals
% player 2, demand 6 kW/hr, 6 time intervals
% player 3, demand 3 kW/hr, 3 time intervals
% max power each interval is 3.2 kWh, each vehicle per interval has a max limit of 1.6 kWh

%         $20 $45 $30  $x  $y  $z
% EV1  a1   b1   c1   d1  e1
% EV2  a2   b2   c2   d2  e2  f2
% EV3  a3   b3   c3

clear all,close all
% Free parameters are d1, a2, b2, c2, d2, e2, b3, c3

% Part 1: Initialization
% The randsize is the number of random cases generated
% Each case will be checked to see if it can satisfy the contraints to be a parent.
% If so, it will be added to parentpop. 
% The desired number of initial parent is popsize, which is the population size. 
randsize=200;
popsize=20;
EP=[20 45 30 50 60 70];

parentpop=[ ];  childpop = [ ];
bestTparent=0;
checksize = [ 0 0 ];


% Part 2: To generate only the "popsize" number of valid parents to enter into the Main Loop
while (checksize(1) < popsize )
   pop = rand(randsize,8)*1.6;  % 8 free parameters, final 14 parameters

    for (i=1:randsize)
      tmp=create(pop(i,:));
         if (tmp ~= 999)
            parentpop = [parentpop ; tmp];
         end
    end
   checksize=size(parentpop);
end % End of the while loop

% To generate the parents and sort the best popsize to enter into the main loop
    results=cost(parentpop,EP);
    [A,index]=sort(cost(parentpop,EP),1,'ascend');
    newparentsort=parentpop(index,:);
    parentpop=newparentsort([1:popsize],:);

% To test crossover functions using two individual parents
parent1 = parentpop(3,:);
parent2 = parentpop(4,:);
[child1,child2]=crossover1(parent1,parent2);
[child3,child4]=crossover2(parent1,parent2);
% To test mutation function 
[child5]=mutation( parentpop(1,:));


%-- Part 3: Canonical Main Loop----------------------------------------------------

NumGeneration = 200;

for igen = 1:NumGeneration

%---- Part 3A, to generate the children by GA as new generation ---------
childpop=[ ];
childpopsize=[ 0  0 ];

% parentpop has popsize number of parents
% To generate the popsize number of children
while (childpopsize(1) < popsize )
% To generate the random index for crossover and mutation 
ind=randi(popsize,[1 2]) ;
parent1 = parentpop(ind(1),:);
parent2 = parentpop(ind(2),:);
[child1,child2]=crossover1(parent1,parent2);
[child3,child4]=crossover2(parent1,parent2);
[child5]=mutation( parent1);

if (child1 ~= 999)
childpop = [childpop ; child1];
end
if (child2 ~= 999)
childpop = [childpop ; child2];
end
if (child3 ~= 999)
childpop = [childpop ; child3];
end
if (child4 ~= 999)
childpop = [childpop ; child4];
end
if (child5 ~= 999)
childpop = [childpop ; child5];
end
childpopsize=size(childpop);

end % End of the while loop

% childpop has over popsize number of children

% Elite: parentpop and childpop are added together before sorting for the best popsize to continue
% truncation selection to generate parents for the next generation
totalpop=[parentpop ; childpop ];
    [A,index]=sort(cost(totalpop,EP),1,'ascend');
    newtotalsort=totalpop(index,:);
    parentpop=newtotalsort([1:popsize],:);

% The best parent is saved for display
plot_opti(igen)=A(1);

%--------- Part 3B, for comparison, generate popsize parents randomly, and save the best ----
Tparentpop = [ ];
checksize = [ 0 0 ];

while (checksize(1) < popsize )
   pop = rand(randsize,8)*1.6;  % 8 free parameters, final 14 parameters

    for (i=1:randsize)
      tmp=create(pop(i,:));
         if (tmp ~= 999)
            Tparentpop = [Tparentpop ; tmp];
         end
    end
   checksize=size(Tparentpop);
end % End of the while loop

% Just pick up the top "popsize" number of valid, random cases
Tparentpop = Tparentpop(1:popsize,:);
size(Tparentpop)

% To sort for the best, and save the best result if it is better than before
    [A,index]=sort(cost(Tparentpop,EP),1,'ascend');
   if (igen == 1)
      plot_rand(igen) = A(1); % The best rand case is saved for display
      bestTparent = Tparentpop(index(1),:);
   else
     if ( A(1) < plot_rand(igen-1) )
     plot_rand(igen) = A(1);  % The best rand case is saved for display
     bestTparent = Tparentpop(index(1),:);
     else
     plot_rand(igen) = plot_rand(igen-1);
     end
  end


end % END of the Main FOR loop

% Part 4: Results
[plot_opti ; plot_rand]
parentpop(1,:)
bestTparent 

figure,plot(1:igen,plot_opti,'b',1:igen,plot_rand,'r') 
title('GA algorithm for EV charging problem: blue is the optimized case')

end