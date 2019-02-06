function [] = SaveErrorFreq(FrequencyError)
% This function saves the error frequecies to file to allow then to be
% read later.
%   Where
%   FrequencyError is an array of error frequencies

% prompt user to enter name to same file as
fileName = input('Please insert a file name to save the Error frequencies as. \n Leave black if you do not want to save. \n', 's');

% Check if fileName was left black and therefore the user doesn't want to
% save

if isempty(fileName)
    disp('Error Frequencies have not been saved.')
    return
end

% Save the frequencies as a Mablad data file with the input name
save(['Data/ErrorFreq/' fileName], 'FrequencyError')

end


