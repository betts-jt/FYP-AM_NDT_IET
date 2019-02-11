clear
clc
close all

tol = 100; % The difference that is allowed within the parts frtequency peaks for them to be concidered the same

% Check if the user is ready to test the part
answer = questdlg('Are you ready to test the part?' , 'Test Part Now','Yes', 'No', 'No');

switch answer
    case 'Yes'
        
        % Start a 3 second countdown to part testing
        disp('Apply impulse to part in...')
        pause(1)
        disp('3')
        pause(1)
        disp('2')
        pause(1)
        disp('1')
        pause(1)
        % End checkpart function
    case 'No'
        disp('Please run the function again to test a part')
        return
end

% Run the record audio function
RecordAudio('TestPart', 1.5)

test_part_audio = 'TestPart.wav';
PartExpectedFrequency = 'PintGlass';
PartErrorFrequency = 'PintGlassError';

[X1, f1] = Time_Freq_domain(test_part_audio);

load([PartExpectedFrequency])
load([PartErrorFrequency])

% plot the signal spectrum
figure(1)
hold on
grid on
semilogx(f1, X1, 'b') % Plot known good part sprectrum
Legend{1} = 'Test part';

% Plot Expected frequency lines
for i=1:length(FreqCommonPeaks)
    xline(FreqCommonPeaks(i)); % Plot the expected peak
    xline(FreqCommonPeaks(i)-tol, '--') % plot the lower tolerence bound
    xline(FreqCommonPeaks(i)+tol, '--') % Plot the upper tolerence bound
end
Legend{2} = 'Expected Frequencies';

% Plot the error frequency lines
for i=1:length(FrequencyError)
    xline(FrequencyError(i), 'r'); % Plot the error peak
    xline(FrequencyError(i)-tol, '--r') % plot the lower tolerence bound
    xline(FrequencyError(i)+tol, '--r') % Plot the upper tolerence bound
end
Legend{3} = 'Error Frequencies';
legend(Legend);

saveas(gcf,'Figures\TestPart.fig') % Save the figure

%  Find peak Frequencies in test part
minPeakProminence = 50; % The minimum peak provinence for finding peaks
NumPeaks = 100; % Reset the value of number of peaks

RequiredPeaks = 10; % Set required nuber of peaks

while NumPeaks > RequiredPeaks
    [a, b] = findpeaks(X1, 'MinPeakProminence', minPeakProminence);
    minPeakProminence = minPeakProminence+1;
    NumPeaks = length(a);
end

freqPeaksTest = f1(b); % Frequency of peaks in Test part

plot(freqPeaksTest, a, 'og'); % Plot frequency peaks on graph

for i = 1:length(FreqCommonPeaks)
    for k = 1:NumPeaks
        Common(k,i) = freqPeaksTest(k)-FreqCommonPeaks(i);
    end
    PeakFound(i) = any(abs(Common(:,i))<tol);
end

% Check if there is a peak at an error value


if any(PeakFound ==0)
    disp('Failed')
else
    disp('Passed')
end


