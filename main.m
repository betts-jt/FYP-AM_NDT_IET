clear
clc
close all

% Setting Audio Tracks
known_good_audio = 'Track1.wav';
test_part_audio = 'Track3.wav';

% Run through time to frequcency domain function
[X1, f1] = Time_Freq_domain(known_good_audio);
[X2, f2] = Time_Freq_domain(test_part_audio);

% plot the signal spectrum
figure(1)
hold on
grid on
semilogx(f1, X1, 'r') % Plot known good part sprectrum
semilogx(f2, X2, 'b') % Plot test part sprectrum

% Set X limit for graph
xlim([0 max(f2)]) % Set X limit for graph

%  Plot largest peaks on known good part
minPeakProminence = 25; % The minimum peak provinence for finding peaks
NumPeaks = 100;
RequiredPeaks = 10; % Set required nuber of peaks

while NumPeaks > RequiredPeaks
    [a, b] = findpeaks(X1, 'MinPeakProminence', minPeakProminence);
    minPeakProminence = minPeakProminence+1;
    NumPeaks = length(a);
end

%  Plot largest peaks on test good part
minPeakProminence = 25; % The minimum peak provinence for finding peaks
NumPeaks = 100;

while NumPeaks > 10
    [c, d] = findpeaks(X2, 'MinPeakProminence', minPeakProminence);
    minPeakProminence = minPeakProminence+1;
    NumPeaks = length(c);
end

%Plot peaks on spectrum graphs
plot(f1(b), a, 'og'); % Peaks of know good part
plot(f2(d), c, 'xk'); % Peaks of test part

%Add graph titles and legends
title('Amplitude spectrum of the signal')
xlabel('Frequency, Hz')
ylabel('Magnitude, dB')
legend('Known Good Part','Test Part','Known Good Part Peaks','Test Part Peaks')

%Plot Peaks on there own graph
figure(2)
hold on
plot(f1(b), a, 'or'); % Peaks of know good part
plot(f2(d), c, 'xb'); % Peaks of test part
xlabel('Frequency, Hz')
ylabel('Magnitude, dB')
legend('Known Good Part','Test Part Audio')


% For each peak in f1 check if any of the peaks in f2 are the same +/- the
allowable deviation in the peak value.
PeakRange = 5; % Set the allowable deviation in peak
for i = 1:NumPeaks
    for k = 1:NumPeaks
        
    end
end
