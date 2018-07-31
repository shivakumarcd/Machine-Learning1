clear ; close all; clc

%% =================== Load all data ================
data = load('data.txt');
%% =================== Train =======================
x_train = [ round(data(0001:2354,1:15)); round(data(3140:3558,1:15)) ];
y_train = [ data(0001:2354,16)  ; data(3140:3558,16) ];
x_val = [ round(data(2354:2499,1:15)); round(data(3559:3698,1:15)) ];
y_val = [ data(2354:2499,16)  ; data(3559:3698,16) ];

%fprintf("Finding best C and sigma");
%[C, sigma] = dataset3Params(x_train, y_train, x_val, y_val)
%fprintf("best C and sigma");

%?best C and sigmaC =
%   0.10000
%   0.30000
%   1.00000
C = 0.1
sigma=0.3
pause;

fprintf('\nTraining NONNONNON-Linear SVM (Spam Classification)\n')
fprintf('(this may take much more than 1 to 2 minutes) ...\n')

model= svmTrain(x_train, y_train, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
%=====================================================================
%Old linearKernel model
%C = 10000;
%model = svmTrain(x_train, y_train, C, @linearKernel);
C
sigma
%% =================== Test Classification training ================
p_train = svmPredict(model, x_train);
fprintf('Accuracy for train: %f\n', mean(double(p_train == y_train)) * 100);
%% =================== Classification val ================
p_val = svmPredict(model, x_val);
fprintf('Accuracy for val: %f\n', mean(double(p_val == y_val)) * 100);
%% =================== Test Classification for only 1s ================
x_1s = data(3140:3698,1:15);
y_1s = data(3140:3698,16);
p_1s = svmPredict(model, x_1s);
fprintf('Accuracy for 1s: %f\n', mean(double(p_1s == y_1s)) * 100);
%% =================== Test Classification for only 0s ================
x_0s = data(0001:3139,1:15);
y_0s = data(0001:3139,16);
p_0s = svmPredict(model, x_0s);
fprintf('Accuracy for 0s: %f\n', mean(double(p_0s == y_0s)) * 100);
%% =================== Test Classification for all data================
x_all = data(:,1:15);
y_all = data(:,16);
p_all = svmPredict(model, x_all);
fprintf('Accuracy for all: %f\n', mean(double(p_all == y_all)) * 100);
fprintf("press enter to continue");
pause;
%% Top Predictors ====================
fprintf('\nTop 5 best predictors weights and id\n');
% Sort the weights and obtin the vocabulary list
[weight, idx] = sort(model.w, 'descend');
tmpMatrix = [weight, idx];
for i=1:8,
	sprintf("%0.3f %0.3f\n",tmpMatrix(i,1), tmpMatrix(i,2))
end