function plotPespetron(X,y,theta)

    plot(X(y==1,1),X(y==1,2),'ro');hold on;
    plot(X(y==-1,1),X(y==-1,2),'bx');
    v = axis; %find the minimum and maximum for each x and y
    xmax = v(2);
    xmin = v(1);
    ymax = (-theta(1)/theta(2))*xmax;
    ymin = (-theta(1)/theta(2))*xmin;
    plot([xmin,xmax],[ymin,ymax],'g','LineWidth',2);
    
end

