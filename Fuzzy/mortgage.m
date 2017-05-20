function [output] = mortgage(marketval,location,asset,income,interest)
%data convert
asset = asset*100000;
income = income*10000;
%get fis
house = readfis('house');
applicant = readfis('applicant');
credit = readfis('credit');
% home evaluation:input market value and location, output house evaluation
houseval = evalfis([marketval location],house);
% applicant evaluation:input asset and income, output applicant evaluation
applicantval = evalfis([asset income],applicant);
% credit evaluation:input house value,income,interest and applicant value, output and return credit evaluation
creditval = evalfis([houseval income interest applicantval],credit);

output = [houseval applicantval creditval];
end