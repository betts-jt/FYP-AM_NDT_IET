clc
close all

BaseName = '2_3_5_'; % The begining of the file name.

%Path = 'E:\iCloudDrive\Documents\University\Year 4\FYP\Matlab\FYP-AM_NDT_IET\Audio_Clips\Training_Data\AM_4_Cylinders\Second_Test_Set\Site3\Good\';
Path = 'E:\iCloudDrive\Documents\University\Year 4\FYP\Matlab\FYP-AM_NDT_IET\Audio_Clips\Training_Data\AM_4_Cylinders\Live_Testing_Experiment\';

for i=1:10
    
    disp('---------------------------------');
    disp(num2str(i));
    disp('---------------------------------');
    
    RecordAudio(Path, [BaseName num2str(i)], 8)
    
end