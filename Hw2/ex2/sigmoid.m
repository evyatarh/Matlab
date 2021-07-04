function [y] = sigmoid(Z)
%logistic regration
y=1./(1+exp(-Z));
end

