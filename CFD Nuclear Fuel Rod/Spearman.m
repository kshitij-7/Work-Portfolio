% Read data from CSV files
data_NSD_BDD_BDF_BAF = csvread('UQ Data new.csv', 0, 1); % Read columns 2 to 5 (0-based index)
data_X = csvread('appended_data_ARO_new.csv'); % Read all columns from data_X.csv

% Separate A, B, C, D from the combined data matrix
A = data_NSD_BDD_BDF_BAF(:, 1); % Assuming A is in the first column
B = data_NSD_BDD_BDF_BAF(:, 2); % Assuming B is in the second column
C = data_NSD_BDD_BDF_BAF(:, 3); % Assuming C is in the third column
D = data_NSD_BDD_BDF_BAF(:, 4); % Assuming D is in the fourth column

% Calculate Spearman correlations
correlation_NSD_X = corr(A, data_X, 'Type', 'Spearman');
correlation_BDD_X = corr(B, data_X, 'Type', 'Spearman');
correlation_BDF_X = corr(C, data_X, 'Type', 'Spearman');
correlation_BAF_X = corr(D, data_X, 'Type', 'Spearman');

% Display the results
fprintf('Spearman Correlation between A and X: %.4f\n', correlation_NSD_X);
fprintf('Spearman Correlation between B and X: %.4f\n', correlation_BDD_X);
fprintf('Spearman Correlation between C and X: %.4f\n', correlation_BDF_X);
fprintf('Spearman Correlation between D and X: %.4f\n', correlation_BAF_X);

% Create scatter plots
figure;

subplot(2, 2, 1);
scatter(A, data_X);
xlabel('A');
ylabel('PCT');
title('Scatter Plot (Spearman): NSD vs. PCT');

subplot(2, 2, 2);
scatter(B, data_X);
xlabel('B');
ylabel('PCT');
title('Scatter Plot (Spearman): BDD vs. PCT');

subplot(2, 2, 3);
scatter(C, data_X);
xlabel('C');
ylabel('PCT');
title('Scatter Plot (Spearman): BDF vs. PCT');

subplot(2, 2, 4);
scatter(D, data_X);
xlabel('D');
ylabel('PCT');
title('Scatter Plot (Spearman): BAF vs. PCT');

% Create a separate figure for the bar graph of Spearman correlations
figure;

correlations = [correlation_NSD_X, correlation_BDD_X, correlation_BDF_X, correlation_BAF_X];
variables = {'A', 'B', 'C', 'D'};

bar(correlations);
set(gca, 'XTickLabel', variables);
xlabel('Variables');
ylabel('Spearman Correlation');

title('Spearman Correlations Between Variables and PCT for Critical');

% Optionally, you can add numerical values above each bar.
%text(1:length(variables), correlations, num2str(correlations', '%.4f'), 'vert', 'bottom', 'horiz', 'center');

% Adjust the figures as needed
