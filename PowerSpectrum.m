function [] = PowerSpectrum(AudioTrack)
% This is a function to plot the poer spectrum for a give audio track.

% get a section of the sound file
[x, fs] = audioread(AudioTrack);   % load an audio file
x = x(:, 1); % get the first channel
N = length(x); % signal length
y = fft(x); % Perform a fast fouier transform

f = (0:N-1)*(fs/N);     % frequency range
power = abs(y).^2/N;    % power of the DFT

plot(f, power)
xlabel('Frequency')
ylabel('Power')
end
