%Get input data form csv files
Path = 'E:\iCloudDrive\Documents\University\Year 4\FYP\Matlab\FYP-AM_NDT_IET\TestCSV\AM_Piece\Second_Test\'; % Path that required /csv's live in
OutData = CSVimport(Path); % Run the funciton to import and format the data

[x, t] = DataProcessing(OutData); % Format the data for the neural network

clear net tr

%create a nural network layout for the problem
net = patternnet([128 128]); % creates a two hidden layer neural network with 1024 hidden neurons in each layer
view(net) % dispalys the layout of the neural network

%set training parameters
net.trainParam.epochs = 100; % Maximum numebr of epochs
net.trainParam.showCommandLine = 0; % Show command line data

% Train the neural network based on the above layout and data
[net,tr] = train(net,x,t);

%Plot networks performance
plotperform(tr)

% Get the portion of the data dedicated to testing
testX = x(:,tr.testInd);
testT = t(:,tr.testInd);

testY = net(testX);
testClasses = testY > 0.5;

% Plot test confusion matrix
plotconfusion(testT,testY)

% Display the suscessful and error percentages
[c,cm] = confusion(testT,testY);

fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-c));
fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);

% Generate a receiver operating characteristic plot
plotroc(testT,testY)


%% References
% [1] T.P. Conrads, et al., "High-resolution serum proteomic features for
%     ovarian detection", Endocrine-Related Cancer, 11, 2004, pp. 163-178.
%%
% [2] E.F. Petricoin, et al., "Use of proteomic patterns in serum to
%     identify ovarian cancer", Lancet, 359(9306), 2002, pp. 572-577.
