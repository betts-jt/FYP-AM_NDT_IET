AudioDuration = 8;

if exist('NetworkLoaded') == 1
    disp(strcat({'Network '}, string(file), {' loaded in to workspace'}))
else
    [file,path] = uigetfile('*.mat', 'Select a network to load');
    NetName = fullfile(path,file);
    NetName = string(NetName); % convert to string array
    
    load(NetName)
    disp(strcat({'Network '}, string(file), {' loaded in to Workspace'))
    NetworkLoaded = 1; % check if a network is loaded into the Workspace
end

% Check if the user is ready to test the part
answer = questdlg('Are you ready to test the part?' , 'Test Part Now','Yes', 'No', 'No');

switch answer
    case 'Yes'
        % Run the record audio function
        RecordAudio('E:\iCloudDrive\Documents\University\Year 4\FYP\Matlab\FYP-AM_NDT_IET\Audio_Clips\TestAudio\','TestPart', AudioDuration)
    case 'No'
        disp('Please run the function again to test a part')
        return
end

%Convert the recorded audio to the frequency domain
[X, ~, ~, ~] = Time_Freq_domain_Frequency('E:\iCloudDrive\Documents\University\Year 4\FYP\Matlab\FYP-AM_NDT_IET\Audio_Clips\TestAudio\TestPart.wav');

testY = net(X); % Run the recorded test part against the trained network
testClasses = testY > 0.5; % 

if testClasses(1) == 1
    disp('Failed')
    disp(['Percentage confidence =' num2str(testY(1)) '%'])
elseif testClasses(2) == 1
    disp('Passed')
    disp(['Percentage confidence =' num2str(testY(2)) '%'])
end

clear answer AudioDuration f X NetName path 

