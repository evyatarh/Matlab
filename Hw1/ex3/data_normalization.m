function [ X,avg,standartDev] = data_normalization( X )

avg=mean(X);%the average of the vector 
standartDev= std(X);%vector standart deviation
X=(X-avg)/standartDev;
end

