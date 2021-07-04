function [tree] = create_tree(Xt,n,stop_spliting_creterion)
%this function creating tree and use heap structure
tree = cell(1,n); 
tree{1} = Xt;
for i = 1:n
    if ~isempty(tree{i})
    [alpha,feature,xy,xn,leaf,kind] = split(tree{i},stop_spliting_creterion);
    
    if kind == 0 %if Xt is empty
        fprintf('The node is Empty\n');
    elseif kind == 1
        tree{i} = leaf;
    else
        node.alpha = alpha;
        node.feature = feature; %the feature is X1 | X2 | X3 | X4 by the index
        tree{i} = node;
        tree{2*i} = xy;
        tree{2*i+1} = xn;
    end
    end
    
end
end

