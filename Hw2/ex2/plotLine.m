function plotLine(X,y,theta)

figure(3)
grid;hold on
title('Separate Line');
plot(X(y==0,2),X(y==0,3),'ko','MarkerFaceColor', 'g'); hold on
plot(X(y==1,2),X(y==1,3),'kd','MarkerFaceColor', 'r');hold on

v = axis; %find the minimum and maximum for each x and y
xmax = v(2);
xmin = v(1);
ymax = (-theta(1)-theta(2)*xmax)/theta(3);
%by the formula : theta0 + theta1*xmax + theta3*ymax = 0 ==>
%ymax = -theta(1)-theta(2)*xmax)/theta(3)
%same for ymin
ymin = (-theta(1)-theta(2)*xmin)/theta(3);
plot([xmin,xmax],[ymin,ymax],'b','LineWidth',2);


end

