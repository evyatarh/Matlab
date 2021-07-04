function [ theta,J ] = gradient_descent( X,y,theta,alpha,max_iter )
%gradient_descent function

m=length(y);

J = zeros(max_iter,1);

for i=1:max_iter

    theta = theta - alpha * 1/m(1) * X' * (X * theta - y);
     J(i) = cost_computation(X,y,theta);
end


end

