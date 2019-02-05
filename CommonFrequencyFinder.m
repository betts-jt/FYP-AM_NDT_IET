clear
clc
close all
addpath 'Audio_Clips' 'Data'

% Setting Audio Tracks
known_good_audio = 'mug1.wav';
test_part_audio = 'mug2.wav';

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

%  Plot largest peaks on first part
minPeakProminence = 25; % The minimum peak provinence for finding peaks
NumPeaks = 100; % Reset the value of number of peaks

RequiredPeaks = 8; % Set required nuber of peaks

while NumPeaks > RequiredPeaks
    [a, b] = findpeaks(X1, 'MinPeakProminence', minPeakProminence);
    minPeakProminence = minPeakProminence+1;
    NumPeaks = length(a);
end

%  Plot largest peaks on test good part
minPeakProminence = 25; % The minimum peak provinence for finding peaks
NumPeaks = 100; % Reset the value of number of peaks

while NumPeaks > RequiredPeaks
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
legend('First Part','Second Part','First Part Peaks','Second Part Peaks')

%Plot Peaks on there own graph
figure(2)
hold on
plot(f1(b), a, 'or'); % Peaks of know good part
plot(f2(d), c, 'xb'); % Peaks of test part
xlabel('Frequency, Hz')
ylabel('Magnitude, dB')
Legend{1} = 'First Part';
Legend{2} = 'Second Part';


freqPeaks1 = f1(b); % Frequency of peaks in first part
freqPeaks2 = f2(d); % Frequency of peaks in second part

% Check if the required number of peaks has been found
% Check part 1
if length(freqPeaks1) < NumPeaks
    error(['Not enough peaks with the correct promminence can be found in part 1. Make the value for RequiredPeaks lower than ' num2str(length(freqPeaks1)) ' and try again'])
end

% Check part 2
if length(freqPeaks2) < NumPeaks
    error(['Not enough peaks with the correct promminence can be found in part 1 \n Make the value for RequiredPeaks lower than ' num2str(length(freqPeaks1)) ' and try again'])
end

% Run Function to find common peak frequencys
[FreqCommonPeaks] = CommonPeakFinder(freqPeaks1, freqPeaks2);

% Plot lines on frequency graph showing the common peaks
figure(2)
hold on
for i=1:length(FreqCommonPeaks)
    xline(FreqCommonPeaks(i));
    Legend{i+2} = ['Common Frequency ' num2str(FreqCommonPeaks(i)) ' Hz'];
end
legend(Legend);

% chekc if user wants to save results
answer = questdlg('Save the common frequencies','Save Frequencies','Yes', 'No', 'No');
switch answer
    case 'Yes'
    % Save common frequencies
    SaveCommonFreq(FreqCommonPeaks)
    disp('Results have been saved.')
    case 'No'
        disp('Results have not been saved.')
end

