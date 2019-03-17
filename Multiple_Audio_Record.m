clc
close all

BaseName = '2_3_50_'; % The begining of the file name.

Path = 'E:\iCloudDrive\Documents\University\Year 4\FYP\Matlab\FYP-AM_NDT_IET\Audio_Clips\Training_Data\AM_4_Cylinders\Site3\Bad\10\Part4\';

for i=14:14
    
    disp('---------------------------------');
    disp(num2str(i));
    disp('---------------------------------');
    
    RecordAudio(Path, [BaseName num2str(i)], 8)
    
end