function [x, t] = DataProcessing(OutData)
% This function processes training data form multiple csv's and outputs it
% is a format to put into a machine learning model.
%   Where:
%       X = The data to be processes by the machine learning model
%       t = the categories of each of the data sets for the model

[OutDataLen OutDataWid] = size(OutData);

% Get the category data from the OutData array
t = OutData(OutDataLen,:);

% Remove category data from the OutData array
x = OutData(1:OutDataLen-1, :);

end
