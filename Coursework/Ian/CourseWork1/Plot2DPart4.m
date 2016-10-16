%Number of datapoints
samples = 1000;

%Create a Matrix of 1 X samples (1xn)
data = randn(1,samples);

%Specify the number of bins
nbins = 400;

%the normal probability density function set mean to 0 and standard deviation to 1 
norm = normpdf(data,0,1)*16;

%Split the data using the automatic algorithm 
N = histcounts(data);

%Print the matrix size
message = sprintf('data Matrix size %d x %d', size(data,1), size(data,2));
fprintf(message);

%Plot the norm and the histogram with a fitted line on a figure.
figure
hold on
plot(data,norm,'b.');
h = histfit(data,nbins);
title('Fit Histogram');
ylabel('Data point occurance');
xlabel('Data point value');