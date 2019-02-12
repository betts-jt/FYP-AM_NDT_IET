clear
clc
close all

% This script allows for the easy comparrison of part freqency graphs.

AudioRequired = 1; % Set variable to check if the user wishes to enter audio
LoopCount = 0; % Counter for the number of audio clips analysed
GoodCount = 0; % Counter for the numebr of good parts that have been analysed
BadCount = 0; % Counter for the numebr of good parts that have been analysed

figure(1)
hold on
grid on

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
            
            [XG(:,GoodCount), fG(:,GoodCount), a, b] = Time_Freq_domain([answer{1}, '.wav']);
            
            semilogx(fG(:,GoodCount), XG(:,GoodCount), 'b') % Plot known good part sprectrum
            
            % Set X limit for graph
            xlim([0 max(fG(:,GoodCount))]) % Set X limit for graph
            
            freqPeaksGood(:,GoodCount) = fG(b,GoodCount);
            
        case 'Bad Part'
            BadCount = BadCount +1; % Add one to good part counter
            prompt = {'Enter bad part audio'};
            title = 'Audio File';
            definput = {''};
            answer = inputdlg(prompt,title,[1 40],definput);
            
            [XB(:,BadCount), fB(:,BadCount), a, b] = Time_Freq_domain([answer{1}, '.wav']);
            
            
            semilogx(fB(:,BadCount), XB(:,BadCount), 'r') % Plot known good part sprectrum
            
            freqPeaksBad(:,BadCount) = fB(b,BadCount);
            
        case 'Finish Input'
            AudioRequired = 0; % End audio input loop
            
    end
    
end

