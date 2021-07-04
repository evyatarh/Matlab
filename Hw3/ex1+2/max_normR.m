function [maxR] = max_normR(X)

m = length(X);
maxR = size(1,m);
for k=1:m
    maxR(k) = norm(X(k));
end
maxR = max(maxR);
end

