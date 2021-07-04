%% Ex1 + Ex2
clc;
clear;
close all;
%p.s - it was a class exercise 
 %% Section a
a = load ('data1.mat');
X1 = a.X;
y1 = a.y;
[theta1,k1] = my_perceptron_train(X1,y1);
test_err1 = my_perceptron_test(theta1,X1,y1);
fprintf('The number of the relative errors for data1 are: %g\n',test_err1);
fprintf('The angle between theta and [1 0] is : %g degrees\n',cos_x_y(theta1,[1 0]'));
fprintf('The number of steps for the convergence of the pecpetron algorithem is: %g\n',k1);
%% Section b
b = load ('data2.mat');
X2 = b.X;
y2 = b.y;
[theta2,k2] = my_perceptron_train(X2,y2);
test_err2 = my_perceptron_test(theta2,X2,y2);
fprintf('The number of the relative errors for data2 are: %g\n',test_err2);
fprintf('The angle between theta and [1 0] is : %g degrees\n',cos_x_y(theta2,[1 0]'));
fprintf('The number of steps for the convergence of the pecpetron algorithem is: %g\n',k2);

%% Sectioin c
geo_a = geometric_margins(theta1,X1);
fprintf('The geometric margins for Section a(the minimum projection) is: %g\n',geo_a(2));
geo_b = geometric_margins(theta2,X2);
fprintf('The geometric margins for Section b(the minimum projection) is: %g\n',geo_b(1));

%% Section d

fprintf('The R_a is: %g\n',max_normR(X1));
fprintf('The R_b is: %g\n',max_normR(X2));

%% Section e
figure(1)
plotPespetron(X1,y1,theta1);
figure(2)
plotPespetron(X2,y2,theta2);