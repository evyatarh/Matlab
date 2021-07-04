close all;
clear;
clc;
equationY = @(theta, x) theta(1) + (theta(2) * x); %local function
Moore= csvread('transistor_counts.csv');
x=[ones(length(Moore),1) Moore(:,1)];


figure(1) ,plot(Moore(:,1),Moore(:,2),'k.');xlabel('normal(Years)');ylabel('Transistors(in bilions)');
title('Original');hold on %plot of original data

%section a
fprintf('5.a \n')
fprintf('The realtion between the number of transistors and time can be express in the equation:\n');
fprintf('log(y)= theta(2)*x+theta(1)\n\n');
%we saw that the number of transistor rais exponent depend on years
%by use log we getting a linear connection
y=log2(Moore(:,2));
figure(2) ,plot(Moore(:,1),y,'k.');xlabel('normal(Years)');ylabel('log(Transistors)');
title('transformed');hold on %plot of data after transformation

%section b

theta=((x'*x)^(-1))*x'*y;
plot(x(:,2),theta'*x')
hold on
xMin = min(Moore(:,1));
xx=linspace(xMin,2015,100);
ff2=2.^(equationY(theta,xx));
figure(1);
plot(xx,ff2)
hold on;

%section c
result2017=2.^(equationY(theta,2017));
fprintf('The Number of transistors in 2017 at the cpu will be: %g\n',result2017);




