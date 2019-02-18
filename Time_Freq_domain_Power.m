function [power , f, a, b] = Time_Freq_domain_Power(AudioTrack)

% get a section of the sound file
[x, fs] = audioread(AudioTrack);   % load an audio file
x = x(:, 1); % get the first channel
N = length(x); % signal length
y = fft(x);
f = (0:N-1)*(fs/N);     % frequency range
power = abs(y).^2/N;    % power of the DFT

% plot the direct result of the FFT
%{
figure(2)
hold on
plot(f,abs(y))
%}

%  Plot largest peaks on first part
minPeakHeight = 1.5; % The minimum height for finding peaks

[a, b, ~, PeakProm] = findpeaks(power, 'MinPeakHeight', minPeakHeight);

data(:,1) = a; % Set column one to the peak magnitude values
data(:,2) =  b; % Set column one to the peak frequency values
data(:,3) = PeakProm(:); % Set column 3 to the peak frequency values

SortedData = sortrows(data,3, 'descend'); % Sort the data by decending peak prominence

RequiredData = SortedData(1:length(a),1:2); % Select the peaks with the heighest peak prominence

a = RequiredData(:,1); % set a to be the magnitude of the peaks
b = RequiredData(:,2); % Set b to be the frequency index of the peaks

end