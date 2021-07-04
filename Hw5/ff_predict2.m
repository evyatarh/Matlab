function [p, detectp] = ff_predict2(Theta1, Theta2,Theta3, X,y)
%UNTITLED3 Summary of this function goes here
m = size(X, 1);
num_labels = size(Theta2, 1);

p = zeros(size(X, 1), 1);
X1=[ones(size(X,1),1) X];

%this is the first layer:
z2=X1*Theta1';
a2=sigmoid(z2);
a2=[ones(size(a2,1),1) a2];

%this is the second layer:
z3=a2*Theta2';
a3=sigmoid(z3);
a3=[ones(size(a3,1),1) a3];
z4=a3*Theta3';
a4=sigmoid(z4);



[k,p]=max(a4');
p=p';
detectp=(sum(p == y)/m * 100);
end

