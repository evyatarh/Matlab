close all;
clear;
clc;

%section a
load 'Xcricket.mat'
figure(1);
scatter(Xcricket(:,2),Xcricket(:,1));
title('Xcricket');
xlabel('Temperture');
ylabel('Chirp');
hold on

%section b
M = ones(15,2);
M(:, 2) = Xcricket(:, 2);
theta = ((M'*M)^(-1))*M'*Xcricket(:,1);
t = linspace(60,100,1000);
plot(t,(theta(1)+theta(2)*t));
hold on;

%section c
newTheta = zeros(2,1);
iter = 500;
[theta2,J] = gradient_descent(M,Xcricket(:, 2),newTheta,1e-5,iter);
figure(2);
plot(1:iter,J);
xlabel('Iteration');ylabel('cost(J)');

fprintf('1.c\n');
fprintf('Lets see the diffrents between anlyte calculation and the gradient descent coefficients:\n');
fprintf('anlyte: %g ==> gradient descent: %g\n',theta(1),theta2(1));
fprintf('anlyte: %g ==> gradient descent: %g\n\n',theta(2),theta2(2));

%section d


fprintf('1.d\n');

y1=theta'*[1 90]';
y2=theta'*[1 70]';
fprintf('For 90F temp the chirp is: %g\n',y1);
fprintf('For 70F temp the chirp is: %g\n\n',y2);

%section e
fprintf('1.e\n');

y3=theta'*[1 30]';
fprintf('For 30F temp the chirp is: %g\n',y3);