%Get input data form csv files
Path = 'E:\iCloudDrive\Documents\University\Year 4\FYP\Matlab\FYP-AM_NDT_IET\TestCSV\'; % Path that required /csv's live in
OutData = CSVimport(Path); % Run the funciton to import and format the data

[x, t] = DataProcessing(OutData); % Format the data for the neural network

clear net tr



%set training parameters%create a nural network layout for the problem
net = patternnet([64 64 64]); % creates a two hidden layer neural network with 1024 hidden neurons in each layer
view(net) % dispalys the layout of the neural network
net.trainParam.epochs = 100; % Maximum numebr of epochs
net.trainParam.showCommandLine = 0; % Show command line data

%%
% Train the neural network based on the above layout and data
[net,tr] = train(net,x,t);


%%
%Plot networks performance
plotperform(tr)
yTrn = net(x(:,tr.trainInd));
tTrn = t(:,tr.trainInd);
yTst = net(x(:,tr.testInd));
tTst = t(:,tr.testInd);
yVal = net(x(:,tr.valInd));
tVal = t(:,tr.valInd);

plotconfusion(tTrn, yTrn, 'AM Part Test')
plotconfusion(tTst, yTst, 'AM Part Test')