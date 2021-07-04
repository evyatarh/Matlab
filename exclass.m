%% Class Exercise - Email

close all;
clear;
clc;

[spmatrix, tokenlist, trainCategory] = readMatrix( 'MATRIX.TRAIN' );
trainMatrix = full(spmatrix);
numTrainDocs = size(trainMatrix, 1); % number of training ducuments
numTokens = size(trainMatrix, 2); % number of training tokens
trainMatrix(:,1210) = []; % cleaning news and spam words
trainMatrix(:,861) = [];
numOfNotOnes = trainMatrix(trainMatrix(:,:)>0);
numOfNotOnes = length(numOfNotOnes);
[rows,cols] = size(trainMatrix);
prec = (numOfNotOnes/(rows*cols))*100;
HigherThenOne = sum(sum(trainMatrix>1));

[spmatrix1, tokenlist1, testCategory] = readMatrix( 'MATRIX.TEST' );
testMatrix = full(spmatrix1);
testMatrix(:,1210) = []; % cleaning news and spam words
testMatrix(:,861) = [];
numTestDocs = size(testMatrix, 1); % number of training documents
figure(1)
imagesc(trainMatrix(1:100,1:100));
title('Train matrix for 100 words in 100 documents');hold on;


trainMatrixbin = trainMatrix;
trainMatrixbin(trainMatrix > 0) = 1; %binary matrix

figure(2)
imagesc(trainMatrixbin(1:100,1:100));
title('Binary Train matrix for 100 words in 100 documents');hold on;



commonWordSum = sum(trainMatrixbin);
indexWord = find(commonWordSum == max(commonWordSum)); 
numOfDocument = commonWordSum(indexWord);


Word700 = commonWordSum(700);

[commonWord,numOfCommonWord] = find(trainMatrix == max(max(trainMatrix)));
numOfCommonWord = trainMatrix(commonWord, numOfCommonWord);



testMatrixbin = testMatrix;
testMatrixbin(testMatrix > 0) = 1;%binary test matrix

testCategory = full(testCategory);
trainCategory = full(trainCategory);

spam = size(trainCategory(trainCategory == 1),2);
notSpam= size(trainCategory(trainCategory == 0),2);
omega = spam + notSpam;
P1 = spam/omega;
P0 = notSpam/omega;

%laplace transform
k1=find(trainCategory==1);
k0=find(trainCategory==0);
k=2;
pSpam=(sum(trainMatrixbin(k1',:))+1)/(sum(trainCategory==1)+k);
pReal=(sum(trainMatrixbin(k0',:))+1)/(sum(trainCategory==0)+k);

pj2i0 = pReal(2);
pj2i1 = pSpam(2);


firstMail = prod(pSpam(testMatrixbin(1,:)>0));
[m,~] = size(testMatrix);

for i=1:m 
    xiy1 = prod(pSpam(testMatrixbin(i,:)>0));
    xiy0 = prod(pReal(testMatrixbin(i,:)>0));
    totalProbability(i) = (xiy1 *P1)/(xiy1*P1 + xiy0*P0);
    compleatingProb(i) = 1 - totalProbability(i);
end

for i=1:m
    %log ruls for multiplication
    logS = log(pSpam(testMatrixbin(i,:)>0));
    logR = log(pReal(testMatrixbin(i,:)>0));
    logSpam(i)=sum(logS) + log(P1); 
    logReal(i)=sum(logR) + log(P0);
end


check = (logSpam > logReal);
error = sum(check == testCategory)/length(testCategory);
error = 1 - error;
inductive = logSpam./logReal; %by the formula from the exercise

sortedInductive = sort(inductive);
topFiveInductive = sortedInductive(:,end-4:end);
