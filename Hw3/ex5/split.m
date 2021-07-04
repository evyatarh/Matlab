function [alpha,feature,Xty,Xtn,leaf,kind] = split(Xt,stop_spliting_criterion)

%if Xt is empty we just a leaf or nothing
if isempty(Xt)
    fprintf('The Xt is empty, we can stop at this node\n');
    kind = 0;
else
    [alpha,feature,best_imp] = select_feature_threshold(Xt);
    
    %if the decrease impurity lower then the stop spliting criterion meaning
    %we got to the optimal and we can stop (its a leaf)
    [row,col] = size(Xt);
    if best_imp < stop_spliting_criterion || row == 1
        leaf = classify(Xt);
        kind = 1;
        Xty = 0;
        Xtn = 0;
    else %classify the training exemples
        temp = Xt(:,feature);
        temp(:,2) = Xt(:,end);
        help1 = find(temp(:,1)<=alpha);
        help2 = find(temp(:,1)>alpha);
        Xty = zeros(length(help1),2);
        Xtn = zeros(length(help2),2);
        for k = 1:length(help1)
            Xty(k,:) = temp(help1(k),:);
        end
        for k = 1:length(help2)
            Xtn(k,:) = temp(help2(k),:);
        end
        kind = 2;
        leaf = 0;
    end
end
end

