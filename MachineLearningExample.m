% Specify the training data
% X rows = data sets
% X columns = frequency through time
% Y Train = Calecories for classification

[XTrain,YTrain] = japaneseVowelsTrainData;

% Prepare the data for padding (not nessusarily needed in my data as all
% results are the same legnth)
numObservations = numel(XTrain);
for i=1:numObservations
    sequence = XTrain{i};
    sequenceLengths(i) = size(sequence,2);
end

[sequenceLengths,idx] = sort(sequenceLengths); % Sort by sequency legnth
XTrain = XTrain(idx);
YTrain = YTrain(idx);

% Define LSTM Network Architecture

inputSize = 12; % Number of data categories for each test sample
numHiddenUnits = 100; % Numebr of hidden units
numClasses = 9; % Numebr fo possible outcomes

layers = [sequenceInputLayer(inputSize) bilstmLayer(numHiddenUnits,'OutputMode','last') fullyConnectedLayer(numClasses) softmaxLayer classificationLayer];

maxEpochs = 100; % Set the maxinum number of Epochs to be used 
miniBatchSize = 27;

% Set the training options
options = trainingOptions('adam', 'ExecutionEnvironment','cpu', 'GradientThreshold',1, 'MaxEpochs',maxEpochs, 'MiniBatchSize',miniBatchSize, 'SequenceLength','longest', 'Shuffle','never','Verbose',1,'Plots','training-progress');

% Train the LSTM network
net = trainNetwork(XTrain,YTrain,layers,options);

%Test the LSTM network
[XTest,YTest] = japaneseVowelsTestData;

% Prepare data for padding in the same way as above. (again not nessusarliy
% needed)
numObservationsTest = numel(XTest);
for i=1:numObservationsTest
    sequence = XTest{i};
    sequenceLengthsTest(i) = size(sequence,2);
end
[sequenceLengthsTest,idx] = sort(sequenceLengthsTest);
XTest = XTest(idx);
YTest = YTest(idx);

% Pad test data
miniBatchSize = 27;
YPred = classify(net,XTest, ...
    'MiniBatchSize',miniBatchSize, ...
    'SequenceLength','longest');

% Calculate accuracy of predictions
acc = sum(YPred == YTest)./numel(YTest)