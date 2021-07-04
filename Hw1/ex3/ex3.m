close all;
clear;
clc;
load 'houses.txt'; 

areaHouse= houses(:,1);
badroomsNumber=houses(:,2);
thePriceOfTheHouse=houses(:,3);


%section a
[areaHouse, avg1 , standartDev1]=data_normalization(areaHouse); %normalized HoseArea
[badroomsNumber, avg2 , standartDev2]=data_normalization(badroomsNumber); %normalized NoOfBadrooms
[thePriceOfTheHouse, avg3 , standartDev3]=data_normalization(thePriceOfTheHouse); %normalized HousePrice
max_iter=5000;
alpha=0.01;%teaching rythen
m=length(thePriceOfTheHouse);
X = [ones(m,1) areaHouse badroomsNumber areaHouse.*badroomsNumber]; %the price of the house is 
%the house area & the number of the badrooms (the last
%element in the vector X)
theta = zeros(4,1); 
[ theta,J] = gradient_descent( X, thePriceOfTheHouse,theta, alpha, max_iter); 
fprintf('the theta vector dimention is: [%g %g]\n\n',size(theta));

%section b
estimaationHouse=[1 1800 5];
estimaationHouse(2)= (estimaationHouse(2)-avg1)/standartDev1;%normalized HoseArea
estimaationHouse(3)= (estimaationHouse(3)-avg2)/standartDev2;%normalized HoseNoOfRooms
normalizedPrice=([estimaationHouse(2) , estimaationHouse(3)]')*theta';
estimatedPrice= ((normalizedPrice)*standartDev3)+avg3;
fprintf('The house cost prediction with 5 badroom and 1800 sf is: %g \n\n',sum(sum(estimatedPrice,2))/length(estimatedPrice));

%section c
x = houses(:,1:2);
y = houses(:,3);
estimationHouse2=[1800 5];

theta = ((x'*x)^-1)*x'* y; %normelaized equation formula
priceEstimated = estimationHouse2*theta;

fprintf('the cost of house with 5 badroom and 1800 sf in normal equation is: %g \n\n',priceEstimated);



