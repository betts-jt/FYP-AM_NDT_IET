clear
clc
close all
PathAdd()

% This script allows for the easy comparrison of part freqency graphs.

tol = 100; % tolerence of difference in peak value to be concidered the same

AudioRequired = 1; % Set variable to check if the user wishes to enter audio
GoodCount = 0; % Counter for the numebr of good parts that have been analysed
BadCount = 0; % Counter for the numebr of good parts that have been analysed

figure(1)
hold on
grid on

while AudioRequired == 1
    
    % Check if the user withes to enter a known good or bad part
    answer = questdlg('What type of audio do you want to be analysed?','Audio Selection','Good Part', 'Bad Part', 'Finish Input', 'Finish Input');
    
    switch answer
        case 'Good Part'
            GoodCount = GoodCount +1; % Add one to good part counter
            % Open file select window
            [file,path] = uigetfile('*wav', 'Select an audio file', 'MultiSelect', 'on');
            
            if isequal(file,0) % User canceled file selection
                disp('User selected Cancel');
            else
                FileList = fullfile(path,file);
                FileList = string(FileList); % convert to string array
                
                if length(FileList) == 1 % if only one file was selected
                    [XG(:,GoodCount), fG(:,GoodCount), a, b] = Time_Freq_domain_Frequency(FileList);
                    
                    plot(fG(:,GoodCount), XG(:,GoodCount), 'b') % Plot known good part sprectrum
                    plot(fG(b), a, 'xg'); % plot good peak points
                    % Set X limit for graph
                    xlim([0 max(fG(:,GoodCount))]) % Set X limit for graph
                    
                    freqPeaksGood(:,GoodCount) = fG(b,GoodCount);
                    
                else % If multiple files are selected
                    
                    for k = 1:length(file)
                        [XG(:,GoodCount), fG(:,GoodCount), a, b] = Time_Freq_domain_Frequency(FileList(k));
                        
                        plot(fG(:,GoodCount), XG(:,GoodCount), 'b') % Plot known good part sprectrum
                        plot(fG(b), a, 'xg'); % plot good peak points
                        % Set X limit for graph
                        xlim([0 max(fG(:,GoodCount))]) % Set X limit for graph
                        
                        freqPeaksGood(:,GoodCount) = fG(b,GoodCount);
                    end
                end
            end
            
        case 'Bad Part'
            BadCount = BadCount +1; % Add one to good part counter
            % Open file select window
            [file,path] = uigetfile('*wav', 'Select an audio file', 'MultiSelect', 'on');
            
            if isequal(file,0) % User canceled file selection
                disp('User selected Cancel');
            else
                FileList = fullfile(path,file);
                
                FileList = fullfile(path,file);
                FileList = string(FileList); % convert to string array
                
                if length(FileList) == 1 % if only one file was selected
                    [XB(:,BadCount), fB(:,BadCount), a, b] = Time_Freq_domain_Frequency(FileList);
                    
                    plot(fB(:,BadCount), XB(:,BadCount), 'r') % Plot known good part sprectrum
                    plot(fB(b), a, 'xk'); % plot bad peak points
                    freqPeaksBad(:,BadCount) = fB(b,BadCount);
                    % Set X limit for graph
                    xlim([0 max(fB(:,BadCount))]) % Set X limit for graph
                    
                else % If multiple files are selected
                    
                    for k = 1:length(file)
                        [XB(:,BadCount), fB(:,BadCount), a, b] = Time_Freq_domain_Frequency(FileList(k));
                        
                        plot(fB(:,BadCount), XB(:,BadCount), 'r') % Plot known good part sprectrum
                        plot(fB(b), a, 'xk'); % plot bad peak points
                        freqPeaksBad(:,BadCount) = fB(b,BadCount);
                        % Set X limit for graph
                        xlim([0 max(fB(:,BadCount))]) % Set X limit for graph
                    end
                end
            end
            
            
        case 'Finish Input'
            AudioRequired = 0; % End audio input loop
    end
end

if GoodCount >= 1 % Good parts have been plotted
    GoodPeaks = CommonPeakFinder(freqPeaksGood); % Find the good part peaks
    
    % Plot the peak lines on the graph
    % Good part peak lines
    for i = 1:length(GoodPeaks)
        xline(GoodPeaks(i), 'k') % Plot the peak value line
        xline(GoodPeaks(i)-tol, '--k') % Plot the lower tolerence peak line
        xline(GoodPeaks(i)+tol, '--k') % Plot the lower tolerence peak line
    end
end

if BadCount >= 1 % Good parts have been plotted
    
    BadPeaks = CommonPeakFinder(freqPeaksBad); % Find the bad part peaks
    
    % Check if any of the good part peaks are on the bad peak list
    if GoodCount >=1
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

