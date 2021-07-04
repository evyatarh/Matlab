function [min] = geometric_margins(theta,X)
    %finding the minimum projection
    min = inf;
    m = length(X);
    
    for k = 1:m
        dist = distance_xt(theta,X(k));
        if dist < min
            min = dist;
        end
    end

end

