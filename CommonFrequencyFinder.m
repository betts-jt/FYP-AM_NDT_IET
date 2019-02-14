clear
clc
close all

PathAdd();

% Setting Audio Tracks
Part1 = '50_1.wav';
Part2 = '50_2.wav';

% Run through time to frequcency domain function
[X1, f1, a, b] = Time_Freq_Domain(Part1);
[X2, f2, c ,d] = Time_Freq_Domain(Part2);

% plot the signal spectrum
figure(1)
hold on
grid on
plot(f1, X1, 'r') % Plot known good part sprectrum
plot(f2, X2, 'b') % Plot test part sprectrum

% Set X limit for graph
xlim([0 max(f2)]) % Set X limit for graph

%Plot peaks on spectrum graphs
plot(f1(b), a, 'og'); % Peaks of know good part
plot(f2(d), c, 'xk'); % Peaks of test part

%Add graph titles and legends
title('Amplitude spectrum of the signal')
xlabel('Frequency, Hz')

ylabel('Power')
legend('First Part','Second Part','First Part Peaks','Second Part Peaks')

saveas(gcf,'Figures\Specrogram.fig') % Save the comparrison spectrogram

%Plot Peaks on there own graph
figure(2)
hold on
plot(f1(b), a, 'or'); % Peaks of know good part
plot(f2(d), c, 'xb'); % Peaks of test part
xlabel('Frequency, Hz')
ylabel('Magnitude, dB')
Legend{1} = 'First Part';
Legend{2} = 'Second Part';

freqPeaks(:,1) = f1(b); % Frequency of peaks in first part
freqPeaks(:,2) = f2(d); % Frequency of peaks in second part

% Run Function to find common peak frequencys
[FreqCommonPeaks] = CommonPeakFinder(freqPeaks);

% Plot lines on frequency graph showing the common peaks
figure(2)
hold on
for i=1:length(FreqCommonPeaks)
    xline(FreqCommonPeaks(i));
    Legend{i+2} = ['Common Frequency ' num2str(FreqCommonPeaks(i)) ' Hz'];
end
legend(Legend);

% check if user wants to save results
answer = questdlg('Save the common frequencies','Save Frequencies','Yes', 'No', 'No');
switch answer
    case 'Yes'
        % Save common frequencies
        SaveCommonFreq(FreqCommonPeaks)
        disp('Results have been saved.')
    case 'No'
        disp('Results have not been saved.')
end

% chekc if user wants to enter error peaks
answer = questdlg('Do you wish to enter error frequencuies','Enter Error Frequencies','Yes', 'No', 'No');
figure(2)
hold on
switch answer
    case 'Yes' 
        MoreError = 1;
        g=1;
        while MoreError == 1
            % prompt user to enter name to same file as
            text = input('Please insert an error frequency \n', 's');
            FrequencyError(g) = str2num(text);
            xline(FrequencyError(g), 'r'); % Plot Error frequency line
            answer1 = questdlg('Do you wish to enter more error frequencies ','More Error Frequencies?','Yes', 'No', 'No');
            switch answer1
                case 'Yes'
                    g=g+1;
                case 'No'
                    SaveErrorFreq(FrequencyError) % Run the function to save error frequencies
                    MoreError = 0; % Stop the loop to enter error frequencies
            end
        end
    case 'No'
        disp('No error frequencies have been entered')
end
saveas(gcf,'Figures\CommonPeaks.fig')