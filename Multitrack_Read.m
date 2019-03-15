% This script runs through all of the audio files with the same initial
% file make and writes the results to a csv file.

PreName = '0_0_'; % Initial name of the audio file
Path = 'E:\iCloudDrive\Documents\University\Year 4\FYP\Matlab\FYP-AM_NDT_IET\Audio_Clips\Training_Data\Good\'; % Path where the audio files are located
NumFiles = 90; % Number of audio files of that type
OutName = 'test'; % Output ifle name for the csv
Category = 0; % Category for the data (0 = good, 1 = bad, ect)

for i = 1:90
    [x, fs] = audioread([Path PreName num2str(i) '.wav']);   % load an audio file
    x = x(:, 1); % get the first channel
    RequiredData = length(x); % signal length
    t = (0:RequiredData-1)/fs; % time vector  
    
    % Experimental analysis
    NFFT = 2^nextpow2(RequiredData); % Next power of 2 from length of y
    Y = fft(x,NFFT)/RequiredData;
    f = fs/2*linspace(0,1,NFFT/2+1);
    X(i,:) = 2*abs(Y(1:NFFT/2+1));
end

a(1:NumFiles,:) = X;
a(:,length(X)+1) = Category;
csvwrite([Path OutName '.csv'], a')