function [best_alpha,feature,bestImp] = select_feature_threshold(Xt)
%by the psaudo code from the lecture
[n,m] = size(Xt);
best_alpha = 0;
bestImp = inf;
feature = 1;
for i=1:m
    xi = Xt(:,i); %classify each of the column
    for j=1:n-1
        xk = xi(j);
        xk1 = xi(j+1);
        alpha = (xk+xk1)/2;
        XtY = xi(xi<=alpha);
        XtN = xi(xi>alpha);
        di = decrease_impurity(Xt,XtY,XtN);
        if di < bestImp
            bestImp = di;
            best_alpha = alpha;
            feature = i;
        end
    end
    
    
    
end
%returning the best alpha we got and the index of the best feature vector
end

