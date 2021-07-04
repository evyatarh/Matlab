function [ J, grad] = cost_log_reg(theta,X,y,lambda)

theta=theta(:);
m=length(X);
y=y(:);
z=theta'*X';
h_theta = sigmoid(z);
%by the formula on the exercise
J= (-1/m)*(((y')*log(h_theta)') + ((1-y)'* log(1-h_theta)'))+(lambda/2*m)*(sum(theta.^2));
%and the gradient:
if J>=1 %for J>=1 
    grad = (1/m)*X'*(h_theta-y')' + (lambda/m)*theta;
else %for J=0
    grad = (1/m)*X'*(h_theta-y')';
end

end


