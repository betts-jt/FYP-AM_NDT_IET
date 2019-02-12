function [recObj] = RecordAudio(AudioTrackName, Duration)
% This function will record the audio from a microphone where
%   AudioTrackName = The name for the audiofile to be saved as
%   Duration is the duration of the recording

recObj = audiorecorder(44100, 16, 1);


% Start a 3 second countdown to part testing
disp('Apply impulse to part in...')
pause(1)
disp('3')
pause(1)
disp('2')
pause(1)
disp('1')
pause(1)

disp('Hit the test piece')
recordblocking(recObj, Duration);
disp('Recording Ended')

y = getaudiodata(recObj);
audiowrite(['Audio_Clips\' AudioTrackName '.wav'],y,44100);
end