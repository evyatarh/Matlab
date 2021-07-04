function  predictAndPrintTheError(X,y,theta)
%this function find the error between the original to the prediction
z = theta' * X';
h_theta = sigmoid(z);
%find the length of the values who higher then 0.5
fH_theta = find(h_theta > 0.5);
lenF = length(fH_theta);
fY  = find(y > 0);
lenY = length(fY);
fprintf('The error prediction is on %g precent\n',abs(lenF-lenY)/length(y));

end

