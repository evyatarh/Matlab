function [Xnew] = concatination(X,y)
%concat to X the lables and put int insted of the string
Xnew = [X zeros(length(X),1)];
for i=1:length(y)
    if strcmp(y(i), 'setosa')
        Xnew(i,end) = 0;
    elseif strcmp(y(i),'versicolor')
        Xnew(i,end) = 1;
    else 
        Xnew(i,end) = 2;
    end
end

end

