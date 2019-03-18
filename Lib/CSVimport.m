function [OutData] = CSVimport(Path)
% This function read the data in from all csv's in one folder and makes then
% into a matlab workspace.

listing = dir([Path '*.csv']); % Get data of all files in path folder that are .csv's
NumFolders = length(listing); % Get number of csv's in folder

% Generate one large array with the data in for each of the csv's

for i=1:NumFolders % For each of the input csv files
    data(i).file = csvread([Path listing(i).name]); % read the data into a structure
    [~, FileWidth] = size(data(i).file); % Find the size of the data
    if i == 1 % On the first loop
        OutData(:,1:FileWidth) = data(i).file; % Insert the data to the start of the array
    else % On every subsiquent loop
        [~, DataWidth] = size(OutData);
        OutData(:,DataWidth + 1:DataWidth + FileWidth) = data(i).file; % Add the data to the next section of the array
    end
end

end