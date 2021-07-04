function [test_err] = my_perceptron_test(theta, X_test, y_test)

test_err = 0;
n = length(X_test);

    for k = 1:n
       if  y_test(k)*theta'*X_test(k,:)' < 0 %finding the numbers of
           %the errors in the prediction
           test_err = test_err + 1;
       end
    end
    test_err = test_err / n; %number of relative errors
end

