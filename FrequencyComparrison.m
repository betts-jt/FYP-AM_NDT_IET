clear
clc
close all
PathAdd()

% This script allows for the easy comparrison of part freqency graphs.

tol = 100; % tolerence of difference in peak value to be concidered the same

AudioRequired = 1; % Set variable to check if the user wishes to enter audio
GoodCount = 1; % Counter for the numebr of good parts that have been analysed
BadCount = 1; % Counter for the numebr of good parts that have been analysed

figure(1)
hold on
grid on

while AudioRequired == 1
    
    % Check if the user withes to enter a known good or bad part
    answer = questdlg('What type of audio do you want to be analysed?','Audio Selection','Good Part', 'Bad Part', 'Finish Input', 'Finish Input');
    
    switch answer
        case 'Good Part'
            % Open file select window
            [file,path] = uigetfile('*.wav', 'Select an audio file', 'MultiSelect', 'on');
            
            if isequal(file,0) % User canceled file selection
                disp('User selected Cancel');
            else
                FileList = fullfile(path,file);
                FileList = string(FileList); % convert to string array
                
                if length(FileList) == 1 % if only one file was selected
                    [XGF(:,GoodCount), fGF(:,GoodCount), aF, bF] = Time_Freq_domain_Frequency(FileList);
                    
                    [XGP(:,GoodCount), fGP(:,GoodCount), aP, bP] = Time_Freq_domain_Power(FileList);
                    
                    figure(1)
                    hold on
                    plot(fGF(:,GoodCount), XGF(:,GoodCount), 'b') % Plot known good part sprectrum
                    plot(fGF(bF), aF, 'xg'); % plot good peak points
                    % Set X limit for graph
                    xlim([0 max(fGF(:,GoodCount))]) % Set X limit for graph
                    
                    freqPeaksGoodF(:,GoodCount) = fGF(bF,GoodCount);
                    
                    figure(2)
                    hold on
                    plot(fGP(:,GoodCount), XGP(:,GoodCount), 'b') % Plot known good part sprectrum
                    plot(fGP(bP), aP, 'xg'); % plot good peak points
                    % Set X limit for graph
                    xlim([0 max(fGP(:,GoodCount))]) % Set X limit for graph
                    
                    freqPeaksGoodP(:,GoodCount) = fGP(bP,GoodCount);
                    
                    GoodCount = GoodCount + 1;
                    
                else % If multiple files are selected
                    
                    for k = 1:length(file)
                        [XGF(:,GoodCount), fGF(:,GoodCount), aF, bF] = Time_Freq_domain_Frequency(FileList(k));
                        
                        [XGP(:,GoodCount), fGP(:,GoodCount), aP, bP] = Time_Freq_domain_Power(FileList(k));
                        
                        % Frequency plot
                        figure(1)
                        hold on
                        plot(fGF(:,GoodCount), XGF(:,GoodCount), 'b') % Plot known good part sprectrum
                        plot(fGF(bF), aF, 'xg'); % plot good peak points
                        % Set X limit for graph
                        xlim([0 max(fGF(:,GoodCount))]) % Set X limit for graph
                        
                        freqPeaksGoodF(:,GoodCount) = fGF(bF,GoodCount);
                        
                        % Power Plot
                        figure(2)
                        hold on
                        plot(fGP(:,GoodCount), XGP(:,GoodCount), 'b') % Plot known good part sprectrum
                        plot(fGP(bP), aP, 'xg'); % plot good peak points
                        % Set X limit for graph
                        xlim([0 max(fGP(:,GoodCount))]) % Set X limit for graph
                        
                        freqPeaksGoodP(:,GoodCount) = fGP(bP,GoodCount);
                        
                        GoodCount = GoodCount + 1; % Increase the good counter for each spectrum plotted
                    end
                end
            end
            
        case 'Bad Part'
            
            % Open file select window
            [file,path] = uigetfile('*.wav', 'Select an audio file', 'MultiSelect', 'on');
            
            if isequal(file,0) % User canceled file selection
                disp('User selected Cancel');
            else
                FileList = fullfile(path,file);
                
                FileList = fullfile(path,file);
                FileList = string(FileList); % convert to string array
                
                if length(FileList) == 1 % if only one file was selected
                    [XBF(:,BadCount), fBF(:,BadCount), aF, bF] = Time_Freq_domain_Frequency(FileList);
                    
                    [XBP(:,BadCount), fBP(:,BadCount), aP, bP] = Time_Freq_domain_Power(FileList);
                    
                    figure(1)
                    hold on
                    plot(fBF(:,BadCount), XBF(:,BadCount), 'r') % Plot known good part sprectrum
                    plot(fBF(bF), aF, 'xk'); % plot good peak points
                    % Set X limit for graph
                    xlim([0 max(fBF(:,BadCount))]) % Set X limit for graph
                    
                    freqPeaksBadF(:,BadCount) = fBF(bF,BadCount);
                    
                    figure(2)
                    hold on
                    plot(fBP(:,BadCount), XBP(:,BadCount), 'r') % Plot known good part sprectrum
                    plot(fBP(bP), aP, 'xk'); % plot good peak points
                    % Set X limit for graph
                    xlim([0 max(fBP(:,BadCount))]) % Set X limit for graph
                    
                    freqPeaksBadP(:,BadCount) = fBP(bP,BadCount);
                    
                    BadCount = BadCount+1;
                    
                else % If multiple files are selected
                    
                    for k = 1:length(file)
                        [XBF(:,BadCount), fBF(:,BadCount), aF, bF] = Time_Freq_domain_Frequency(FileList(k));
                        
                        [XBP(:,BadCount), fBP(:,BadCount), aP, bP] = Time_Freq_domain_Power(FileList(k));
                        
                        % Frequency plot
                        figure(1)
                        hold on
                        plot(fBF(:,BadCount), XBF(:,BadCount), 'r') % Plot known good part sprectrum
                        plot(fBF(bF), aF, 'xk'); % plot good peak points
                        % Set X limit for graph
                        xlim([0 max(fBF(:,BadCount))]) % Set X limit for graph
                        
                        freqPeaksBadF(:,BadCount) = fBF(bF,BadCount);
                        
                        % Power Plot
                        figure(2)
                        hold on
                        plot(fBP(:,BadCount), XBP(:,BadCount), 'r') % Plot known good part sprectrum
                        plot(fBP(bP), aP, 'xk'); % plot good peak points
                        % Set X limit for graph
                        xlim([0 max(fBP(:,BadCount))]) % Set X limit for graph
                        
                        freqPeaksBadP(:,BadCount) = fBP(bP,BadCount);
                        
                        BadCount = BadCount + 1; % Increase the bad counter for each spectrum plotted
                        
                    end
                end
            end
            
            
        case 'Finish Input'
            AudioRequired = 0; % End audio input loop
    end
end
%{
% Revert back to figure 1 to plot the common frequencies
figure(1)
hold on

if GoodCount > 1 % Good parts have been plotted
    GoodPeaks = CommonPeakFinder(freqPeaksGoodF); % Find the good part peaks
    
    % Plot the peak lines on the graph
    % Good part peak lines
    for i = 1:length(GoodPeaks)
        xline(GoodPeaks(i), 'k') % Plot the peak value line
        xline(GoodPeaks(i)-tol, '--k') % Plot the lower tolerence peak line
        xline(GoodPeaks(i)+tol, '--k') % Plot the lower tolerence peak line
    end
end

if BadCount > 1 % Good parts have been plotted
    
    BadPeaks = CommonPeakFinder(freqPeaksBadF); % Find the bad part peaks
    
    % Check if any of the good part peaks are on the bad peak list
    if GoodCount >1
        for i = 1: length(GoodPeaks)
            counter = 0;
            for k = 1:length(BadPeaks)
                counter = counter+1;
                difference = abs(BadPeaks(counter)-GoodPeaks(i)); % Calculate the difference between the badPeaks and GoodPeaks value
                if difference < tol % If the value if lower than the tol value
                    BadPeaks(counter) = []; % remove the bad peak the is the same as the good peak
                    counter = counter - 1;
                elseif BadPeaks(counter) == 0 % If the value of badpeaks is zero
                    BadPeaks(counter) = []; % remove the bad peak the is the same as the good peak
                    counter = counter - 1;
                end
            end
        end
    end
    
    % Bad part peak lines
    for i = 1:length(BadPeaks)
        xline(BadPeaks(i), 'r') % Plot the peak value line
        xline(BadPeaks(i)-tol, '--r') % Plot the lower tolerence peak line
        xline(BadPeaks(i)+tol, '--r') % Plot the lower tolerence peak line
    end
end
%}
% Change to figure 2 to plot any nessusary lines at a later date. Suggest
% lines to show height of power.
figure(2)
hold on


