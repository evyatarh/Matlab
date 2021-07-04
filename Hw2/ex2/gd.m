function [theta,J]=gd(X,y,theta,alpha,num_iters)

m = length(y);
J = zeros(num_iters,1);

for j=1:num_iters
        theta = theta - alpha * (1 / m) * ((sigmoid(X * theta) - y)' * X)';
        J(j) = costF_log(theta, X, y);

end

