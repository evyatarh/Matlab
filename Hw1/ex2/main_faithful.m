function [ theta ,X,Xnew] = main_faithful(X,Y,alpha,flag)

max_iter=2000;
m = length(Y); 
Xnew = [ones(m,1) X];
theta = zeros(2,1);
[ theta,J] = gradient_descent( Xnew, Y,theta, alpha, max_iter); 

x0 = 1; 
x1 = 6; %ended around 6 minutes
y0 = theta'*[1 x0]';
y1 = theta'*[1 x1]';

if flag == 1
    figure(1), line([x0 x1],[y0 y1]) 
    figure(2),plot(1:max_iter,J); xlabel('number of iteration'); ylabel('cost (J)')% ploting cost vs num of iteration
end

grid on

end