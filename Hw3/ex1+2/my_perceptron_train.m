function [theta,k] =  my_perceptron_train(X, y)

k = 1;
m = length(X);
theta = zeros(2,1);
numCurr = 0;

while numCurr < m % I repeat the process untill i dont have any of errors
    %in the prediction of the pattern
    
    %finding it by the formula of the lecture 6 - slide 6
    if y(k)*theta'*X(k,:)' > 0 
        numCurr = numCurr + 1;
        
    else
        %if its smaller then zero so we update the theta and training it
        %again
        theta = theta + y(k)*X(k,:)';
        numCurr = 0;
    end
    
    k = k + 1;
    
    %if i pass all the m training patterns without getting 
    %to the state that i dont have any errors prediction, i reset the counter 
    %and starting the process again from the first index in the vectors
    if k == m + 1 
        k = 1;
    end
end


end

