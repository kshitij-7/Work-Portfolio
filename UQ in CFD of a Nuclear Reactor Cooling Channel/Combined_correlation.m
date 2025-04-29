% Read data from CSV files
data_NSD_BDD_BDF_BAF = csvread('UQ Data new.csv', 0, 1); % Read columns 2 to 5 (0-based index)
data_PCT = csvread('appended_data_ARO_new.csv'); % Read all columns from data_PCT.csv

% Separate A, B, C, D from the combined data matrix
A = data_NSD_BDD_BDF_BAF(:, 1); % Nucleation Site Density
B = data_NSD_BDD_BDF_BAF(:, 2); % Bubble Departure Diameter
C = data_NSD_BDD_BDF_BAF(:, 3); % Bubble Departure Frequency
D = data_NSD_BDD_BDF_BAF(:, 4); % Boiling Area Fraction

% Calculate Pearson correlations
correlation_NSD_PCT_pearson = corr(A, data_PCT);
correlation_BDD_PCT_pearson = corr(B, data_PCT);
correlation_BDF_PCT_pearson = corr(C, data_PCT);
correlation_BAF_PCT_pearson = corr(D, data_PCT);

% Calculate Spearman correlations
correlation_NSD_PCT_spearman = corr(A, data_PCT, 'Type', 'Spearman');
correlation_BDD_PCT_spearman = corr(B, data_PCT, 'Type', 'Spearman');
correlation_BDF_PCT_spearman = corr(C, data_PCT, 'Type', 'Spearman');
correlation_BAF_PCT_spearman = corr(D, data_PCT, 'Type', 'Spearman');

% Create a grouped bar graph for Pearson and Spearman correlations
variables = {'Nucleation Site Density (A)', 'Bubble Departure Diameter (B)', 'Bubble Departure Frequency (C)', 'Boiling Area Fraction (D)'};
pearson_correlations = [correlation_NSD_PCT_pearson, correlation_BDD_PCT_pearson, correlation_BDF_PCT_pearson, correlation_BAF_PCT_pearson];
spearman_correlations = [correlation_NSD_PCT_spearman, correlation_BDD_PCT_spearman, correlation_BDF_PCT_spearman, correlation_BAF_PCT_spearman];

figure;

bar([pearson_correlations; spearman_correlations]');
set(gca, 'XTickLabel', variables);
xlabel('Variables');
ylabel('Correlation');
legend('Pearson', 'Spearman');
title('Comparison of Pearson and Spearman Correlations for ARO condition');

% Adjust the figure as needed
