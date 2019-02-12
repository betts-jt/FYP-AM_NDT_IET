function [X, f, a, b] = Time_Freq_domain(AudioTrack)
% get a section of the sound file
[x, fs] = audioread(AudioTrack);   % load an audio file
x = x(:, 1);                        % get the first channel
N = length(x);                      % signal length
t = (0:N-1)/fs;                     % time vector

% spectral analysis
w = hanning(N, 'periodic');
[X, f] = periodogram(x, w, N, fs, 'power');
X = 20*log10(sqrt(X)*sqrt(2));

%  Plot largest peaks on first part
minPeakProminence = 25; % The minimum peak provinence for finding peaks
NumPeaks = 100; % Reset the value of number of peaks

RequiredPeaks = 10; % Set required nuber of peaks

while NumPeaks > RequiredPeaks
    [a, b] = findpeaks(X, 'MinPeakProminence', minPeakProminence);
    minPeakProminence = minPeakProminence+1;
    NumPeaks = length(a);
end


end