close all;
clear;
clc;

% section a
load 'faithful.txt'; 
X = faithful(:,1); %x column
Y = faithful(:,2);% y column
plot(X,Y,'rx'); %display diagram of duration by time
ylabel('Time to next eruption (minutes)'); xlabel('Duration of minutes of the eruption');

%section b
%I used main_faithful as a function and not as a script because i use it later
[theta,X,Xnew]=main_faithful(X,Y,0.01,1);

%section c
fprintf('2.c \n')

x=[1.5, 3, 5]; %vector of time
timeVec=ones(1,3); %empty vector to save expected time till next eruption

for i=1:length(x)
timeVec(i)=theta'*[1 x(i)]' ;%calculate the duration of eurption at time x
end

fprintf('current duration euruption is 1.5 ==> next euruption in minutes is %g\n',timeVec(1))
fprintf('current duration euruption is 3 ==> next euruption in minutes is %g\n',timeVec(2));
fprintf('current duration euruption is 5 ==> next euruption in minutes is %g\n',timeVec(3));


%section d
fprintf('2.d \n')
J=cost_computation(Xnew,Y,theta); 
fprintf('the cost is: %g \n\n',J);

%section e
figure(3);hold on;

% Grid for contour plot of gradient descent
theta0=linspace(0, 30, 500);
theta1=linspace(0, 20, 500);
J =zeros(length(theta0),length(theta1));
% a matrix of J values for each theta
for i = 1:length(theta0)
 for j = 1:length(theta1)
 thetamatrix = [theta0(i); theta1(j)];
 J(i,j) = cost_computation(Xnew, Y,thetamatrix);
 end
end
% contour plot using a logarithmic scale
contour(theta0, theta1, J, logspace(-2, 7,35))
xlabel('\theta_0'); ylabel('\theta_1'); hold on;
plot(theta(1), theta(2), 'bx', 'MarkerSize', 5, 'LineWidth', 2);
% theta(1) and theta(2) are the values computed by gradient descent


%section f
fprintf('2.f \n')

[theta1]=main_faithful(X,Y,1,0);
[theta2]=main_faithful(X,Y,0.1,0);
[theta4]=main_faithful(X,Y,5e-1,0);
[theta5]=main_faithful(X,Y,1e-3,0);
[theta3]=main_faithful(X,Y,1e-10,0);

fprintf('for alpha = 1 we get that theta is: [%g %g]\n',theta1);
fprintf('for alpha = 0.1 we get that theta is: [%g %g]\n',theta2);
fprintf('for alpha = 5e-1 we get that theta is: [%g %g]\n',theta3);
fprintf('for alpha = 1e-3 we get that theta is: [%g %g]\n',theta4);
fprintf('for alpha = 1e-10 we get that theta is: [%g %g]\n',theta5);

fprintf('so, we can see that if we changes the alpha values\n');
fprintf('to be high we might skip our global minima and may ')
fprintf('not convergence. \n')
fprintf('and if we choosing lower alpha value we might get stuck in local minima\n');
