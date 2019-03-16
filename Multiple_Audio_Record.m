clc
close all

BaseName = '0_1_'; % The begining of the file name.

Path = 'E:\iCloudDrive\Documents\University\Year 4\FYP\Matlab\FYP-AM_NDT_IET\Audio_Clips\Training_Data\Initial_Test_Cylinder\Bad\1\';

for i=1:30
    
    disp('---------------------------------');
    disp(num2str(i));
    disp('---------------------------------');
    
    RecordAudio(Path, [BaseName num2str(i)], 1.5)
    
end