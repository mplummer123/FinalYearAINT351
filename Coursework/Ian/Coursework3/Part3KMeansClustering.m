%select number of samples for each set
samples1 = 10000;
samples2 = 10000;

%define the mean for each set
meanSet1 = [-4 -1]';
meanSet2 = [3 4]';

%Abrituaryly set the mean for this at first
newMeanSet1 = [1 1]';
newMeanSet2 = [1 1]';

%define the standard deviation for each set 
stanDevSet1 = 0.75;
stanDevSet2 = 2;

%Create a Matrix of 2 X samples (2xn) with the specified mean and standard 
%deviation using 'standardDeviation * randn(2,n) + mean;' for each data set
uncorrelatedData1 = stanDevSet1 * randn(2,samples1) + meanSet1;

uncorrelatedData2 = stanDevSet2 * randn(2,samples2) + meanSet2;

%Concatenate the two sets into a single dataset
TrainData = [uncorrelatedData1; uncorrelatedData2];

%Define the x and y values for the 4 dimensions
x1 = TrainData(1,:);
y1 = TrainData(2,:);

x2 = TrainData(3,:);
y2 = TrainData(4,:);

oldMean1 = 0;
oldMean2 = 1;
newMean1 = 2;
newMean2 = 3;

iterationNumber = 1;

%set1 = zeros(2,10000);
%set2 = zeros(2,10000);

classidx1 = [];
classidx2 = [];

n = 1;

while oldMean1 ~= newMean1 && oldMean2 ~= newMean2
    classidx1Column = 1;
    classidx2Column = 1;
        if iterationNumber == 1
            while n <= size(TrainData,2)
    
                x = TrainData(1,n);
                y = TrainData(2,n);

                distance1 = norm(meanSet1 - [x y]);
                distance2 = norm(meanSet2 - [x y]);
                    if(distance1 < distance2)
                        classidx1(1,classidx1Column) = x;
                        classidx1(2,classidx1Column) = y;
                        classidx1Column = classidx1Column + 1;
                    else
                        classidx2(1,classidx2Column) = x;
                        classidx2(2,classidx2Column) = y;
                        classidx2Column = classidx2Column + 1;
                    end
                n = n + 1;
            end
            n = 1;
            while n <= size(TrainData,2)
                x = TrainData(3,n);
                y = TrainData(4,n);
    
                distance1 = norm(meanSet1 - [x y]);
                distance2 = norm(meanSet2 - [x y]);
                    if(distance1 < distance2)
                        classidx1(1,classidx1Column) = x;
                        classidx1(2,classidx1Column) = y;
                        classidx1Column = classidx1Column + 1;
                    else
                        classidx2(1,classidx2Column) = x;
                        classidx2(2,classidx2Column) = y;
                        classidx2Column = classidx2Column + 1;
                    end
                n = n + 1;
            end
            n=1;
        else
            while n <= size(classidx1,2)
                x = classidx1(1,n);
                y = classidx1(2,n);

                distance1 = norm(meanSet1 - [x y]);
                distance2 = norm(meanSet2 - [x y]);
                    if(distance1 < distance2)
                        classidx1(1,classidx1Column) = x;
                        classidx1(2,classidx1Column) = y;
                        classidx1Column = classidx1Column + 1;
                    else
                        classidx2(1,classidx2Column) = x;
                        classidx2(2,classidx2Column) = y;
                        classidx2Column = classidx2Column + 1;
                    end
                n = n + 1;
            end
            n = 1;
            while n <= size(classidx2,2)
                x = classidx2(1,n);
                y = classidx2(2,n);
    
                distance1 = norm(meanSet1 - [x y]);
                distance2 = norm(meanSet2 - [x y]);
                    if(distance1 < distance2)
                        classidx1(1,classidx1Column) = x;
                        classidx1(2,classidx1Column) = y;
                        classidx1Column = classidx1Column + 1;
                    else
                        classidx2(1,classidx2Column) = x;
                        classidx2(2,classidx2Column) = y;
                        classidx2Column = classidx2Column + 1;
                    end
                    n = n + 1;
            end
            n=1;
        end
    
    newMeanSet1 = nanmean(classidx1);
    newMeanSet2 = nanmean(classidx2);

    oldMean1 = newMean1;
    oldMean2 = newMean2;

    newMean1 = norm(newMeanSet1);
    newMean2 = norm(newMeanSet2);

    meanSet1 = newMeanSet1';
    meanSet2 = newMeanSet2';

    iterationNumber = iterationNumber+1;
end

disp(iterationNumber);
figure
hold on
plot(classidx1(1,:),classidx1(2,:),'r.');
plot(classidx2(1,:),classidx2(2,:),'b.');
title('K-means labelling of training data');
xlabel('x-value');
ylabel('y-value');
legend('classidx == 1','classidx == 2');