% Step 1: Import data from the CSV file
data = csvread('appended_data_ARO_new.csv'); % Replace 'your_data.csv' with your file path

% Step 2: Create a vector of numbers from 1 to 59
x = 1:59;

% Step 3: Plot the data points as markers
plot(x, data, 'bx'); % 'bo' specifies blue circles (markers)

% Add labels and title
xlabel('Case');
ylabel('Temperature (K)');
title('Maximum Wall Temperature');

% Optionally, customize the plot further (e.g., axis limits, grid, etc.)
grid on;
axis tight; % Adjust axis limits to fit the data
