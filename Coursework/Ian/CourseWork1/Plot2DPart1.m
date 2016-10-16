%Number of datapoints
samples = 10000;

%Create a Matrix of 1 X samples (1xn) from a uniform distribution
data = rand(1,samples);

%Specify the number of bins
nbins = 400;

%Print the matrix size
message = sprintf('dataUniform Matrix size %d x %d', size(data,1), size(data,2));
fprintf(message);   

%Plot data on figure position 1
figure
subplot(1,2,1);
hold on
h = plot(data,'b.');
set(h,'linewidth',3);
title('dataUniform raw data plot');
xlabel('Data point number');
ylabel('Data point value');

%Plot data for the histogram on figure position 2
subplot(1,2,2);
hold on
histogram(data,nbins);
title('dataUniform histogram');
xlabel('Data point number');
ylabel('Data point value');