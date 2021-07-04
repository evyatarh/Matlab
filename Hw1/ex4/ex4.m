close all;
clear;
clc;

%section a
data= csvread('kleibers_law_data.csv', 1 ,0);
dataLog=log(data);%log all data(decrease values)
Xp=dataLog(:,1);% vector of mass
Yp=dataLog(:,2);% vector of metabolic_rate

figure(1),scatter(Xp,Yp,'k.');hold on;plot(max(dataLog(:,1)),12.7513,'or');
plot(min(dataLog(:,1)),3.3735,'or');xlabel('log of mass');ylabel('log of metabolic rate')

%section b
fprintf('4.b \n');
max_iter=2000;
alpha=0.01;%teaching rythen
m = length(Yp); 
Xp = [ones(m,1) Xp];
theta = zeros(2,1);
[ theta,J] = gradient_descent( Xp, Yp,theta, alpha, max_iter);
fprintf('The thetas are : [%g ,%g]\n\n',theta);
x0 =-7; %choosing x0 
x1= 8; %choosing x1
y0 = theta'*[1 x0]';
y1 = theta'*[1 x1]';
figure(1), line([x0 x1],[y0 y1]) 

%section c
fprintf('4.c \n');
%The thetas are: 6.81472 and 0.65281! lets create a non linear equation by multiply in exp 
%the equation that we got in the exercise:
fprintf('The equation is : y = exp(theta(2)*log(x)+theta(1)) \n\n');

%section d
fprintf('4.d \n');
animalWeight = 10; %The animal weight is 10kg
caloriePerJoul=4.18;
AnimalCalories=exp((theta(2)*log(animalWeight)+theta(1)));%by the equation we create at the last section
fprintf('10kg mammal will consume %g kkl per day \n \n',(AnimalCalories/caloriePerJoul));




%section e
fprintf('4.e \n');

%lets take the x value from the equation ==> log(1.63) = theta(2)*log(x)+theta(1);
mammalSeaWeight=1.63;
expectedWeight=(log(mammalSeaWeight)-theta(1))/theta(2);
expectedWeightResult=exp(expectedWeight);
fprintf('Sea mammal consume 1.63 kJoul per day, The weight is : %g kg => %g g => %g mg\n',...
expectedWeightResult,expectedWeightResult*10^3,expectedWeightResult*10^6);



