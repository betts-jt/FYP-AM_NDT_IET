function [FreqCommonPeaks] = CommonPeakFinder(freqPeaks1, freqPeaks2)
% This function calculatesa the number of frequency peaks common between
% two parts and the frequencies at which these peaks occur.
%   Where
%   freqPeaks1 = The frequencies of peaks in part 1
%   freqPeaks2 = The frequencies of peaks in part 2

ComparePeaks = freqPeaks1 - freqPeaks2; % Difference between the peaks for the first and second part.
CommonPeaks  = zeros(1,length(ComparePeaks)); % Initiallise variable to cound common peaks

tol = 5; % The difference that is allowed within the parts frtequency peaks for them to be concidered the same

for i = 1:length(ComparePeaks)
    if abs(ComparePeaks(i)) < tol % There is a common peak within the parts
        CommonPeaks(i) = 1;
    else % There isn't a common peak
        CommonPeaks(i) = 0;
    end
end

%Find the frequency of common peaks
j=1; % Counter for setting FreqCommonPeaks correctly
for i = 1:length(CommonPeaks)
    if CommonPeaks(i) == 1 % If there is a common peak
        FreqCommonPeaks(j) = freqPeaks1(i); % add the frequency to the common frequency variable.
        j = j+1;
    end
end
end