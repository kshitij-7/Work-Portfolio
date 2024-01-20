% Desired probability
probability = 0.95;

% Calculate the z-score corresponding to the desired probability
zScore = norminv(1 - (1 - probability)/2);

% Parameters
meanValue = 0.004270248;        % Mean value of the Gaussian distribution
stdDeviation = 0.0004270248;   % Standard deviation of the Gaussian distribution
numDataPoints = 59; % Number of data points to be sampled

% Calculate the standard deviation to achieve the desired 95th percentile
adjustedStdDev = zScore * stdDeviation;

% Generate data points from the Gaussian distribution
dataPoints = normrnd(meanValue, adjustedStdDev, [numDataPoints, 1]);

% Calculate the actual achieved probability (within 1.96 standard deviations)
actualProbability = sum(abs(dataPoints - meanValue) < 1.96 * adjustedStdDev) / numDataPoints;

% Display the achieved probability
disp(['Actual achieved probability: ' num2str(actualProbability)]);

% Plot the histogram to visualize the distribution of data points
histogram(dataPoints, 'Normalization', 'pdf');
xlabel('Data Points');
ylabel('Probability Density');
title('Gaussian Distribution');

% Optional: Overlay the theoretical Gaussian distribution on the histogram
hold on;
x = linspace(min(dataPoints), max(dataPoints), 1000);
y = normpdf(x, meanValue, adjustedStdDev);
plot(x, y, 'r', 'LineWidth', 2);
legend('Sampled Data', 'Theoretical Gaussian');
hold off;

