clear
clc
close all

test_part_audio = 'mug2.wav';
PartExpectedFrequency = 'test2';


[X1, f1] = Time_Freq_domain(test_part_audio);

load(PartExpectedFrequency)

% plot the signal spectrum
figure(1)
hold on
grid on
semilogx(f1, X1, 'r') % Plot known good part sprectrum
Legend{1} = 'Test part';

% Plot Expected frequency lines
for i=1:length(FreqCommonPeaks)
    xline(FreqCommonPeaks(i));
    Legend{i+1} = ['Expected Peak Frequency ' num2str(FreqCommonPeaks(i)) ' Hz'];
end
legend(Legend);

%  Find peak Frequencies in test part
minPeakProminence = 25; % The minimum peak provinence for finding peaks
NumPeaks = 100; % Reset the value of number of peaks

RequiredPeaks = 8; % Set required nuber of peaks

while NumPeaks > RequiredPeaks
    [a, b] = findpeaks(X1, 'MinPeakProminence', minPeakProminence);
    minPeakProminence = minPeakProminence+1;
    NumPeaks = length(a);
end

freqPeaksTest = f1(b); % Frequency of peaks in Test part

tol = 5; % The difference that is allowed within the parts frtequency peaks for them to be concidered the same

for i = 1:length(FreqCommonPeaks)
    for k = 1:RequiredPeaks
        Common(k,i) = freqPeaksTest(k)-FreqCommonPeaks(i);
    end
    PeakFound(i) = any(abs(Common(:,i))<tol);
end

if any(PeakFound ==0)
    disp('Failed')
else
    disp('Passed')
end


