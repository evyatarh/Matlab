function [angle] = cos_x_y(X,y)
angle = (X'*y)/norm(X)*norm(y);
angle = acosd(angle);
end

