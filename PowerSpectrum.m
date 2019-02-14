function [f , power] = PowerSpectrum(AudioTrack)
clear

% get a section of the sound file
[x, fs] = audioread(AudioTrack);   % load an audio file
x = x(:, 1);                        % get the first channel
N = length(x);                      % signal length
y = fft(x);
f = (0:N-1)*(fs/N);     % frequency range
power = abs(y).^2/N;    % power of the DFT

plot(f,power, 'b')
xlabel('Frequency')
ylabel('Power')

end