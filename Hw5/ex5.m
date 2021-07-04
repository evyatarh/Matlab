%% Ex - 5
close all;
clear;
clc;

%% Section a
data = load('face_train.mat');
xtrain = data.Xtrain;
ytrain = data.ytrain;

%% Section b
vecOfPic(xtrain);

%% Section c

InputLayerSize  = size(xtrain,2); %number of pixles of image
HiddenLayerSize = [4,8,15]; %hidden units
numLabels = 2; %or its an image or not
max_iter = 2000;
alpha=[3,5,7];
Lambda=[0.01,0.1,1];
ytrain(ytrain == -1) = 2;
maxPrediction = 0;



%% Section d - I put all the code in comment to avoid running the code when i publish
%cross validation:
%i devided it to 20 - 80. meaning that i took to the test group 20 precents
%of the data.
xtrain2 = [xtrain(201:999,:);xtrain(1800:5000,:)];
ytrain2 = [ytrain(201:999,:);ytrain(1800:5000,:)];
xtest2 = [xtrain(1:200,:);xtrain(1000:1799,:)];
ytest2 = [ytrain(1:200,:);ytrain(1000:1799,:)];
m2 = size(xtest2, 1);

ytrain2(ytrain2 == -1) = 2;
% maxPrediction2 = 0;
% for i=1:length(alpha)
%     for j=1:length(Lambda)
%         for k=1:length(HiddenLayerSize)
%             % training the network using backpropagation algorithm
%             Theta1 = InitializeParam(InputLayerSize, HiddenLayerSize(k));
%             Theta2= InitializeParam(HiddenLayerSize(k), numLabels);
%             [J, Theta1,Theta2,precentOfPrediction] = bp(Theta1, Theta2, xtrain2,ytrain2,max_iter,alpha(i), Lambda(j));
%             if precentOfPrediction > maxPrediction2
%                 Jmax2 = J;
%                 Theta1Max2 = Theta1;
%                 Theta2Max2 = Theta2;
%                 maxPrediction2 = precentOfPrediction;
%                 bestAlpha2 = alpha(i);
%                 bestLambda2 = Lambda(j);
%                 bestHidden2 = HiddenLayerSize(k);
%             end
%         end
%     end
% end
% 
% % Performance of the trained nn on training set for cross validation:
% p = ff_predict(Theta1Max2, Theta2Max2, xtest2,ytest2);
% ytest2(ytest2 == -1) = 2;
% fprintf('Network Accuracy For Testing Set - one Layer - Cross validation: %g\n\n',sum(p == ytest2)/m2 * 100);
% 
% fprintf('The best Network Accuracy for Training Set is: %g\n',maxPrediction2);
% fprintf('with parameters:\n');
% fprintf('alpha = %g\nLambda = %g\nHidden Layer Size:%g\n\n',bestAlpha2,bestLambda2,bestHidden2);

% %% Section e
 dataTest = load('face_test.mat');
 xtest = dataTest.Xtest;
 ytest = dataTest.ytest;
 ytest(ytest == -1) = 2;
 m = size(xtest, 1); 
% The result of forward propogation
%  p = ff_predict(Theta1Max2, Theta2Max2, xtest,ytest);
%   fprintf('Network Accuracy For Testing Set - with one Layer: %g\n\n',sum(p == ytest)/m * 100);

%% Section f
%redo Section d+e
% HiddenLayerSize2 = HiddenLayerSize;
% maxPrediction3 = 0;
% for i=1:length(alpha)
%     for j=1:length(Lambda)
%         for k=1:length(HiddenLayerSize)
%             for t=1:length(HiddenLayerSize2) %added a seconed layer
%                 % training the network using backpropagation algorithm
%                 Theta1 = InitializeParam(InputLayerSize, HiddenLayerSize(k));
%                 Theta2= InitializeParam(HiddenLayerSize(k),  HiddenLayerSize2(t));
%                 Theta3 = InitializeParam( HiddenLayerSize2(t),numLabels);
%                 [J, Theta1,Theta2,Theta3,precentOfPrediction] = bp2(Theta1,Theta2, Theta3, xtrain2,ytrain2,max_iter,alpha(i), Lambda(j));
%                 if precentOfPrediction > maxPrediction3
%                     Jmax2 = J;
%                     Theta1Max3 = Theta1;
%                     Theta2Max3 = Theta2;
%                     Theta3Max3 = Theta3;
%                     maxPrediction3 = precentOfPrediction;
%                     bestAlpha3 = alpha(i);
%                     bestLambda3 = Lambda(j);
%                     bestFirstHidden = HiddenLayerSize(k);
%                     bestSeconedHidden = HiddenLayerSize2(t);
%                 end
%             end
%         end
%     end
% end
% % Performance of the trained nn on training set for cross validation:
% p = ff_predict2(Theta1Max3, Theta2Max3,Theta3Max3, xtest2,ytest2);
% ytest2(ytest2 == -1) = 2;
% fprintf('Network Accuracy For Testing Set - with two Layers - Cross validation: %g\n\n',sum(p == ytest2)/m2 * 100);
% 
% fprintf('The best Network Accuracy for Training Set is: %g\n',maxPrediction3);
% fprintf('with parameters:\n');
% fprintf('alpha = %g\nLambda = %g\nFirst Hidden Layer Size: %g\nSeconed Layer Size: %g\n',bestAlpha3,bestLambda3,bestFirstHidden,bestSeconedHidden);
% 
% 
% %The result of forward propogation
% p = ff_predict2(Theta1Max3, Theta2Max3,Theta3Max3, xtest,ytest);
% fprintf('Network Accuracy For Testing Set - with Two Layers: %g\n\n',sum(p == ytest)/m * 100);

