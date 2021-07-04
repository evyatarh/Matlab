function [leaf] = classify(Xt)
%This function classify the labels
y1 = length(Xt(Xt(:,end)==0));
y2 = length(Xt(Xt(:,end)==1));
y3 = length(Xt(Xt(:,end)==2));

help = max([y1 y2 y3]);
if help == y1
    leaf.name = 'Setosa';
elseif help == y2
    leaf.name = 'Versicolor';
else
    leaf.name = 'Virginica';
end

end

