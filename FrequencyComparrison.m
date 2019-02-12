% This script allows for the easy comparrison of part freqency graphs.

AudioRequired = 1; % Set variable to check if the user wishes to enter audio

while AudioRequired == 1
    % Check if the user withes to enter a known good or bad part
    answer = questdlg('What type of audio do you want to be analysed?','Audio Selection','Good Part', 'Bad Part', 'Finish Input', 'Finish Input');
    switch answer
        case 'Good Part'
            prompt = {'Enter good part audio'};
            title = 'Audio File';
            definput = {''};
            answer = inputdlg(prompt,title,[1 40],definput);
            
            [X1, f1] = Time_Freq_domain([answer{1}, '.wav']);
            
        case 'Bad Part'
            prompt = {'Enter bad part audio'};
            title = 'Audio File';
            definput = {''};
            answer = inputdlg(prompt,title,[1 40],definput);
            
            [X1, f1] = Time_Freq_domain([answer{1}, '.wav']);
        case 'Finish Input'
            AudioRequired = 0; % End audio input loop
    end
end

