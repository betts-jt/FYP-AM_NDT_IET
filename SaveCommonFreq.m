function [] = SaveCommonFreq(FreqCommonPeaks)
% This function saves the common frequecies to file to allow then to be
% read later.
%   Where
%   FreqCommonPeaks is an array of freqencies common between two test parts

% prompt user to enter name to same file as
fileName = input('Please insert a file name to save the common frequencies as. \n Leave black if you do not want to save. \n', 's');

% Check if fileName was left blakc and therefore the user doesn't want to
% save

if isempty(fileName)
    return
end

% Save the frequencies as a Mablad data file with the input name
save(['Data\' fileName], 'FreqCommonPeaks')

end


