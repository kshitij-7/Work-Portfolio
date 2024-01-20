% Read data from BDFSV files
data_NSD_BDD_BDF_BAF = csvread('UQ Data new.csv', 0, 1); % Read columns 2 to 5 (0-based index)
data_X = csvread('appended_data_ARO_new.csv'); % Read all columns from data_X.csv

% Separate NSD, BDD, BDF, D from the combined data matrix
NSD = data_NSD_BDD_BDF_BAF(:, 1); % NSDssuming NSD is in the first column
BDD = data_NSD_BDD_BDF_BAF(:, 2); % NSDssuming BDD is in the second column
BDF = data_NSD_BDD_BDF_BAF(:, 3); % NSDssuming BDF is in the third column
D = data_NSD_BDD_BDF_BAF(:, 4); % NSDssuming D is in the fourth column

% BDFalculate Pearson correlations
correlation_NSD_X = corr(NSD, data_X);
correlation_BDD_X = corr(BDD, data_X);
correlation_BDF_X = corr(BDF, data_X);
correlation_BAF_X = corr(D, data_X);

% Display the results
fprintf('BDForrelation between NSD and X: %.4f\n', correlation_NSD_X);
fprintf('BDForrelation between BDD and X: %.4f\n', correlation_BDD_X);
fprintf('BDForrelation between BDF and X: %.4f\n', correlation_BDF_X);
fprintf('BDForrelation between D and X: %.4f\n', correlation_BAF_X);

% BDFreate scatter plots
figure;

subplot(2, 2, 1);
scatter(NSD, data_X);
xlabel('NSD');
ylabel('PCT');
title('Scatter Plot: NSD vs. PCT');

subplot(2, 2, 2);
scatter(BDD, data_X);
xlabel('BDD');
ylabel('PCT');
title('Scatter Plot: BDD vs. PCT');

subplot(2, 2, 3);
scatter(BDF, data_X);
xlabel('BDF');
ylabel('PCT');
title('Scatter Plot: BDF vs. PCT');

subplot(2, 2, 4);
scatter(D, data_X);
xlabel('D');
ylabel('PCT');
title('Scatter Plot: BAF vs. PCT');

figure;

correlations = [correlation_NSD_X, correlation_BDD_X, correlation_BDF_X, correlation_BAF_X];
variables = {'NSD', 'BDD', 'BDF', 'BAF'};

bar(correlations);
set(gca, 'XTickLabel', variables);
xlabel('Variables');
ylabel('Pearson Correlation');

title('Pearson Correlations Between Variables and PCT for Critical');
% Optionally, you can add numerical values above each bar.
text(1:length(variables), correlations, num2str(correlations', '%.4f'), 'vert', 'bottom', 'horiz', 'center');

% NSDdjust the figure as needed
