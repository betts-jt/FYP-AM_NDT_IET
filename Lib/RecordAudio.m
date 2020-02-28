function [] = RecordAudio(Path, AudioTrackName, Duration)
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
audiowrite([Path AudioTrackName '.wav'],y,44100);

close all

[x, fs] = audioread([Path AudioTrackName '.wav']); % read the just saved audiofile
N = length(x); % signal length
f = (0:N-1)*(fs/N);% Frequency range
plot((Duration/N)*(1:N), x); % Plot the recorded waveform
xlabel('Time')
ylabel('Amplitude')

end