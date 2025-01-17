% Compute persistence spectrum

% Generated by MATLAB(R) 9.5 and Signal Processing Toolbox 8.1.
% Generated on: 12-Apr-2019 10:12:53

% Parameters
timeLimits = [0.68 0.88]; % seconds
frequencyLimits = [0 22050]; % Hz
overlapPercent = 50;

%%
% Index into signal time region of interest
x0_1_ROI = x0(:,1);
timeValues = x0(:,2);
minIdx = timeValues >= timeLimits(1);
maxIdx = timeValues <= timeLimits(2);
x0_1_ROI = x0_1_ROI(minIdx&maxIdx);
timeValues = timeValues(minIdx&maxIdx);

% Compute spectral estimate
% Run the function call below without output arguments to plot the results
[P,F,PWR] = pspectrum(x0_1_ROI,timeValues, ...
    'persistence', ...
    'FrequencyLimits',frequencyLimits, ...
    'OverlapPercent',overlapPercent);
