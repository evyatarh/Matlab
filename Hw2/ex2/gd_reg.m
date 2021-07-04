function [ theta, J ] = gd_reg(X,y,theta,alpha,max_iter, lambda)

J = zeros(max_iter,1);
grad = zeros(length(theta),1);

for i=1:max_iter
    
     theta = theta - alpha*grad;
     [J(i) , grad] = cost_log_reg(theta,X,y,lambda);
   
end


