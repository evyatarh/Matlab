function [dis] = distance_xt(theta,X)
dis = theta'*X/norm(theta);
dis = abs(dis);
end

