function [] = Pathadd()
% This function adds all the nessusary paths to file for the testing
% functions to work.

addpath 'Audio_Clips' 'Data' 'Data/ErrorFreq' 'Data/CommonFreq' 'Figures' 'Lib'
addpath(genpath('Audio_Clips'))
addpath(genpath('TestCSV'))
addpath(genpath('TestNetworks'))
end