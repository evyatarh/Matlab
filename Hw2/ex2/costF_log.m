function [J, grad_J] = costF_log(theta, X, y)

m = length(y);
theta = theta(:);
y = y(:);
z = X*theta;
h_theta = sigmoid(z);
J = (1/m)*((y' * log(h_theta))+((1-y)' * log(1-h_theta)));
grad_J = (1/m)*X'*(h_theta-y);

end