function [X, f, a, b] = Time_Freq_domain_Frequency(AudioTrack)
% get a section of the sound file
[x, fs] = audioread(AudioTrack);   % load an audio file
x = x(:, 1);                        % get the first channel
RequiredData = length(x);                      % signal length
t = (0:RequiredData-1)/fs;                     % time vector

% spectral analysis
w = hanning(RequiredData, 'periodic');
[X, f] = periodogram(x, w, RequiredData, fs, 'power');
X = 20*log10(sqrt(X)*sqrt(2));

%  Plot largest peaks on first part
minPeakProminence = 25; % The minimum peak provinence for finding peaks
NumPeaks = 100; % Reset the value of number of peaks

RequiredPeaks = 15; % Set required nuber of peaks

[a, b, ~, PeakProm] = findpeaks(X, 'MinPeakProminence', minPeakProminence);
minPeakProminence = minPeakProminence+1;
NumPeaks = length(a);

data(:,1) = a; % Set column one to the peak magnitude values
data(:,2) =  b; % Set column one to the peak frequency values
data(:,3) = PeakProm(:); % Set column 3 to the peak frequency values

SortedData = sortrows(data,3, 'descend'); % Sort the data by decending peak prominence

RequiredData = SortedData(1:RequiredPeaks,1:2); % Select the peaks with the heighest peak prominence

a = RequiredData(:,1); % set a to be the magnitude of the peaks
b = RequiredData(:,2); % Set b to be the frequency index of the peaks

end