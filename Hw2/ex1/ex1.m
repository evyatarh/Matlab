%% Ex - 1:

clear;
clc;
close all;
load 'emaildata1.mat';

%% Section a

%plot the data, each of the y's(0,1) vals are in diffrent color
grid;hold on
plot(X(y==0,1),X(y==0,2),'ko','MarkerFaceColor', 'g'); hold on
plot(X(y==1,1),X(y==1,2),'kd','MarkerFaceColor', 'r');hold on
xlabel('First feature');ylabel('Second feature');hold on;

%% Section b

numOfIterations = 10000;
alpha=0.01;
X1 = [ones(length(y),1) X]; %concatinat the ones vector to X
theta=zeros(size(X1,2),1);

[theta , J]= gd(X1,y,theta,alpha,numOfIterations);
%printing linear line
plotLine(X1,y,theta);hold on; %plotLine is the function from the class exercise

%% Section c

alpha = 0.1;
numOfIterations = 100000;
X2 = [ones(length(y),1) X X(:,1).^2]; %adding last column with the x1 values
%in square by the formula on the exercise
theta2 = zeros(size(X2,2),1);

[theta2 , J]= gd(X2,y,theta2,alpha,numOfIterations);

figure(3);
grid;hold on
title('Quadratic Seperation');
plot(X(y==0,1),X(y==0,2),'ko','MarkerFaceColor', 'g'); hold on
plot(X(y==1,1),X(y==1,2),'kd','MarkerFaceColor', 'r');hold on
xlabel('First feature');ylabel('Second feature');hold on;

v = axis;
xmin = v(1);
xmax = v(2);
xx=linspace(xmin,xmax,numOfIterations);
yy=(-theta2(1)-theta2(2)*xx-theta2(4)*xx.^2)/theta2(3);% by the formula
line(xx,yy,'LineWidth', 1, 'Color', 'b')


%% Section d

figure(4);
alpha1=[0.0001, 0.001, 0.02, 0.1, 0.7, 1];

for i=1:length(alpha1)
    theta3 = zeros(size(X2,2),1);
    [theta3, J] = gd(X2,y,theta3,alpha1(i),numOfIterations);
    subplot(2,3,i);
    plot(1:numOfIterations, J);
    title(sprintf('i = %g, Alpha = %g',i,alpha1(i)));
    xlabel('Iteration');ylabel('Cost(J)');
end

fprintf('We can see the raise of the cost(J) -  if the alpha is too small');
fprintf(' the raise is too slower,\nif the alpha is too high the');
fprintf(' raise of cost(J) is too higer,\nand if the alpha is in the middle');
fprintf(' of the two edges so the rais is moderate.\n');

%% Section e

email_test = load('email_test_data.mat');%load the file(is a struct)

% Linear regression

fprintf('\nThe correct values classification using Linear regression: %i from %i\n',...
classification(email_test,theta2,0),length(email_test.ytest));


%Square regression

fprintf('The correct values classification using Square regression: %i from %i\n',...
classification(email_test,theta2,1),length(email_test.ytest));

%%
