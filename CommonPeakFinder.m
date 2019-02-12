function [FreqCommonPeaksOut] = CommonPeakFinder(FrequencyArray)
% This function calculates the common frequencuies
%   Where
%   freqPeaks1 = The frequencies of peaks in part 1


tol = 100; % The difference that is allowed within the parts frtequency peaks for them to be concidered the same

loopcount =0;

for i = 1:length(FrequencyArray(1,:))
    loopcount = loopcount+1;
    clear Common PeakFound
    if loopcount ==1
        %Check if the peaks from part 1 are found in part 2
        for i = 1:length(FrequencyArray(:,1))
            for k = 1:length(FrequencyArray(:,2))
                Common(k,i) = FrequencyArray(k,2)-FrequencyArray(i,1);
            end
            PeakFound(i) = any(abs(Common(:,i))<tol);
        end
        
        %Find the frequency of common peaks
        j=1; % Counter for setting FreqCommonPeaks correctly
        for i = 1:length(FrequencyArray(:,1))
            if PeakFound(i) == 1 % If there is a common peak
                FreqCommonPeaks(loopcount, j) = FrequencyArray(i,1); % add the frequency to the common frequency variable.
                j = j+1;
            end
        end
        
    else
        
        %Check if the peaks from part 1 are found in part 2
        for i = 1:length(FreqCommonPeaks)
            for k = 1:length(FrequencyArray(:,loopcount))
                Common(k,i) = FrequencyArray(k,loopcount)-FreqCommonPeaks(loopcount-1, i);
            end
            PeakFound(i) = any(abs(Common(:,i))<tol);
        end
        
        %Find the frequency of common peaks
        j=1; % Counter for setting FreqCommonPeaks correctly
        for i = 1:length(FreqCommonPeaks)
            if PeakFound(i) == 1 % If there is a common peak
                FreqCommonPeaks(loopcount, j) = FreqCommonPeaks(loopcount-1,i); % add the frequency to the common frequency variable.
                j = j+1;
            end
        end
    end
    FreqCommonPeaksOut = FreqCommonPeaks(end,:);
end