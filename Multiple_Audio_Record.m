clc
close all

BaseName = '0_0_'; % The begining of the file name.

Path = 'E:\iCloudDrive\Documents\University\Year 4\FYP\Matlab\FYP-AM_NDT_IET\Audio_Clips\Training_Data\Good\';

for i=31:60

RecordAudio(Path, [BaseName num2str(i)], 1.5)

end