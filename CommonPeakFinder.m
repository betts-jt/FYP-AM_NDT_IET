function [FreqCommonPeaks] = CommonPeakFinder(freqPeaks1, freqPeaks2)
% This function calculatesa the number of frequency peaks common between
% two parts and the frequencies at which these peaks occur.
%   Where
%   freqPeaks1 = The frequencies of peaks in part 1
%   freqPeaks2 = The frequencies of peaks in part 2

tol = 100; % The difference that is allowed within the parts frtequency peaks for them to be concidered the same

%Check if the peaks from part 1 are found in part 2
for i = 1:length(freqPeaks1)
    for k = 1:length(freqPeaks2)
        Common(k,i) = freqPeaks2(k)-freqPeaks1(i);
    end
    PeakFound(i) = any(abs(Common(:,i))<tol);
end

%Find the frequency of common peaks
j=1; % Counter for setting FreqCommonPeaks correctly
for i = 1:length(freqPeaks1)
    if PeakFound(i) == 1 % If there is a common peak
        FreqCommonPeaks(j) = freqPeaks1(i); % add the frequency to the common frequency variable.
        j = j+1;
    end
end
end