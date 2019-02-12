clear
clc
close all

% This script allows for the easy comparrison of part freqency graphs.

AudioRequired = 1; % Set variable to check if the user wishes to enter audio
LoopCount = 0; % Counter for the number of audio clips analysed
GoodCount = 0; % Counter for the numebr of good parts that have been analysed
BadCount = 0; % Counter for the numebr of good parts that have been analysed

while AudioRequired == 1
    LoopCount = LoopCount + 1; % Add one to counter
    
    % Check if the user withes to enter a known good or bad part
    answer = questdlg('What type of audio do you want to be analysed?','Audio Selection','Good Part', 'Bad Part', 'Finish Input', 'Finish Input');
    
    switch answer
        case 'Good Part'
            GoodCount = GoodCount +1; % Add one to good part counter
            prompt = {'Enter good part audio'};
            title = 'Audio File';
            definput = {''};
            answer = inputdlg(prompt,title,[1 40],definput);
            
            [XG(:,GoodCount), fG(:,GoodCount)] = Time_Freq_domain([answer{1}, '.wav']);
            
            if GoodCount == 1
                figure(1)
                hold on
                grid on
                semilogx(fG(:,GoodCount), XG(:,GoodCount), 'b') % Plot known good part sprectrum
                
                % Set X limit for graph
                xlim([0 max(fG(:,GoodCount))]) % Set X limit for graph
                
                %  Plot largest peaks on first part
                minPeakProminence = 50; % The minimum peak provinence for finding peaks
                NumPeaks = 100; % Reset the value of number of peaks
                
                RequiredPeaks = 5; % Set required nuber of peaks
                
                while NumPeaks > RequiredPeaks
                    [a, b] = findpeaks(XG(:,GoodCount), 'MinPeakProminence', minPeakProminence);
                    minPeakProminence = minPeakProminence+1;
                    NumPeaks = length(a);
                end
                
                freqPeaksGood(:,GoodCount) = fG(b,GoodCount);
                
            else
                figure(1)
                hold on
                grid on
                semilogx(fG(:,GoodCount), XG(:,GoodCount), 'b') % Plot known good part sprectrum
                
                %  Plot largest peaks on first part
                minPeakProminence = 50; % The minimum peak provinence for finding peaks
                NumPeaks = 100; % Reset the value of number of peaks
                
                RequiredPeaks = 5; % Set required nuber of peaks
                
                while NumPeaks > RequiredPeaks
                    [a, b] = findpeaks(XG(:,GoodCount), 'MinPeakProminence', minPeakProminence);
                    minPeakProminence = minPeakProminence+1;
                    NumPeaks = length(a);
                end
                
                freqPeaksGood(:,GoodCount) = fG(b,GoodCount);
            end
            
        case 'Bad Part'
            BadCount = BadCount +1; % Add one to good part counter
            prompt = {'Enter bad part audio'};
            title = 'Audio File';
            definput = {''};
            answer = inputdlg(prompt,title,[1 40],definput);
            
            [XB(:,BadCount), fB(:,BadCount)] = Time_Freq_domain([answer{1}, '.wav']);
            
            if BadCount == 1
                figure(1)
                hold on
                grid on
                semilogx(fB(:,BadCount), XB(:,BadCount), 'r') % Plot known good part sprectrum
                
                % Set X limit for graph
                xlim([0 max(fB(:,BadCount))]) % Set X limit for graph
                
                %  Plot largest peaks on first part
                minPeakProminence = 50; % The minimum peak provinence for finding peaks
                NumPeaks = 100; % Reset the value of number of peaks
                
                RequiredPeaks = 5; % Set required nuber of peaks
                
                while NumPeaks > RequiredPeaks
                    [a, b] = findpeaks(XB(:,BadCount), 'MinPeakProminence', minPeakProminence);
                    minPeakProminence = minPeakProminence+1;
                    NumPeaks = length(a);
                end
                
                freqPeaksBad(:,BadCount) = fB(b,BadCount);
                
            else
                figure(1)
                hold on
                grid on
                semilogx(fB(:,BadCount), XB(:,BadCount), 'r') % Plot known good part sprectrum
                
                %  Plot largest peaks on first part
                minPeakProminence = 50; % The minimum peak provinence for finding peaks
                NumPeaks = 100; % Reset the value of number of peaks
                
                RequiredPeaks = 5; % Set required nuber of peaks
                
                while NumPeaks > RequiredPeaks
                    [a, b] = findpeaks(XB(:,BadCount), 'MinPeakProminence', minPeakProminence);
                    minPeakProminence = minPeakProminence+1;
                    NumPeaks = length(a);
                end
                
                freqPeaksBad(:,BadCount) = fB(b,BadCount);
            end
            
        case 'Finish Input'
            AudioRequired = 0; % End audio input loop
    end
    
end

