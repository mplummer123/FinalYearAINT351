%Number of datapoints
samples = 10000;

%Create a Matrix of 2 X samples (2xn) (randn is produced with a mean of 0 
%and standard deviation of 1, otherwise it would be: standardDeviation * randn(2,n) + mean;)
data = randn(2,samples);

%Set the x and y points to be plotted. One dimension against another.
x = data(1,:);
y = data(2,:);

%Print the matrix size
message = sprintf('data Matrix size %d x %d', size(data,1), size(data,2));
fprintf(message);

%Plot data on figure position 1
figure
subplot(1,1,1);
hold on
scatter(x,y,'b.');
title('Uniform 2D plot');
xlabel('x-value');
ylabel('y-value');