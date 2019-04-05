clc
close all

Percent_Fill = 0;

BaseName = ['1_3_' num2str(Percent_Fill) '_']; % The begining of the file name.

%Path = 'E:\iCloudDrive\Documents\University\Year 4\FYP\Matlab\FYP-AM_NDT_IET\Audio_Clips\Training_Data\AM_4_Cylinders\Second_Test_Set\Site3\Good\';
Path = ['E:\iCloudDrive\Documents\University\Year 4\FYP\Matlab\FYP-AM_NDT_IET\Audio_Clips\Training_Data\Machined_Part\Tempurature_Testing\hot\'];

for i=1:5
    
    disp('---------------------------------');
    disp(num2str(i));
    disp('---------------------------------');
    
    RecordAudio(Path, [BaseName num2str(i)], 4)
    
end