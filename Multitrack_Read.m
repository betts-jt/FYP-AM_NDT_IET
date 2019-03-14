for i = 1:30
    [x, fs] = audioread(['E:\iCloudDrive\Documents\University\Year 4\FYP\Matlab\FYP-AM_NDT_IET\Audio_Clips\Training_Data\Bad\0_15_' num2str(i) '.wav']);   % load an audio file
    x = x(:, 1);                        % get the first channel
    RequiredData = length(x);                      % signal length
    t = (0:RequiredData-1)/fs;                     % time vector   
    % Experimental analysis
    NFFT = 2^nextpow2(RequiredData); % Next power of 2 from length of y
    Y = fft(x,NFFT)/RequiredData;
    f = fs/2*linspace(0,1,NFFT/2+1);
    X(i,:) = 2*abs(Y(1:NFFT/2+1));
end

a(1,1:65537) = f;
a(2:31,:) = X;
a(:,65538) = 1;
%csvwrite('Bad15.csv', a')