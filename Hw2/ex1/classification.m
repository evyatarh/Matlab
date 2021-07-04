function [cnt] = classification(email_test,theta,flag)
%The flag is for the Square regrassion - if the flag equal 1 is a Square
%regrassion else is a Linear regrassion

%The function sperate values and classify them - 
%on the one side if the values with the
%the result lower equal then 0.5 we classify it to the "zero" class 
%and on the other side if the values with result higher then 0.5
%we classify it to the "one" class

cnt = 0;
for i=1:length(email_test.ytest)
    res = theta(1)+theta(2)*email_test.Xtest(i,1)+theta(3)*email_test.Xtest(i,2);
    if flag == 1
        res = res +theta(4)*email_test.Xtest(i,1).^2;
    end
    if res <= 0.5
        res=0;
    else
        res=1;
    end
    if res == email_test.ytest(i)
        cnt = cnt+1;
    end
end

end

