% Define the directory where your CSV files are located
dataDirectory = 'E:\Manchester\MSc Dissertation\ARO New Reports';

% Initialize an empty array to store the data
appendedData = [];

% Loop through each value of x from 1 to 59
for x = 1:59
    % Construct the filename for the current case
    fileName = sprintf('Case_ARO_%d-newreport.csv', x);
    
    % Check if the file exists in the specified directory
    if exist(fullfile(dataDirectory, fileName), 'file')
        % Read the CSV file as a table (includes headers)
        data = readtable(fullfile(dataDirectory, fileName));
        
        % Extract the data from the second cell of the second column
        if size(data, 1) >= 2 && size(data, 2) >= 2
            cellData = data{1, 2};
            
            % Append the data to the appendedData array
            appendedData = [appendedData; cellData];
        else
            fprintf('File %s does not have the required structure.\n', fileName);
        end
    else
        fprintf('File %s not found.\n', fileName);
    end
end

% Define the output filename for the single-column CSV
outputFileName = 'appended_data_ARO_new.csv';

% Write the appended data to a single-column CSV file
writematrix(appendedData, outputFileName);

fprintf('Data appended and saved to %s.\n', outputFileName);
