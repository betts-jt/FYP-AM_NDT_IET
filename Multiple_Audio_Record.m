clc
close all

BaseName = '0_0_'; % The begining of the file name.

Path = 'C:\Users\joebe\iCloudDrive\Documents\University\Year 4\FYP\FYP-AM_NDT_IET\Audio_Clips\Training_Data\Good\';

for i=1:30

RecordAudio(Path, [BaseName num2str(i)], 1.5)

end