function [delta_impurity] = decrease_impurity(Xt,Xty,Xtn)
%this function compute the decrease impurity
delta_impurity = impurity(Xt) - (length(Xty)/length(Xt))*impurity(Xty)...
    -(length(Xtn)/length(Xt))*impurity(Xtn);
end

