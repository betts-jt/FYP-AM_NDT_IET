clc
close all

BaseName = '2_3_5_'; % The begining of the file name.

%Path = 'E:\iCloudDrive\Documents\University\Year 4\FYP\Matlab\FYP-AM_NDT_IET\Audio_Clips\Training_Data\AM_4_Cylinders\Second_Test_Set\Site3\Good\';
Path = 'E:\iCloudDrive\Documents\University\Year 4\FYP\Matlab\FYP-AM_NDT_IET\Audio_Clips\Training_Data\AM_4_Cylinders\Second_Test_Set\Site3\Bad\5\';

for i=19:30
    
    disp('---------------------------------');
    disp(num2str(i));
    disp('---------------------------------');
    
    RecordAudio(Path, [BaseName num2str(i)], 8)
    
end