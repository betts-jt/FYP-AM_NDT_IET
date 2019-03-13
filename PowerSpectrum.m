function [] = PowerSpectrum(AudioTrack)
% This is a function to plot the poer spectrum for a give audio track.

[power , f1, a, b] = Time_Freq_Domain(AudioTrack);

figure(1)
hold on

plot(f1, power)
xlabel('Frequency')
ylabel('Power')

%Plot peaks on spectrum graphs
plot(f1(b), a, 'og'); % Peaks of know good part

end
