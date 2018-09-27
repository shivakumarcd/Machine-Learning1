This is an example asked for Data Science interview screening,


Files attached(sorted alphabetically)-
train.m            :Main file which trains and builds the model 
testScript.m -     :Prepares data suitable for training like removing all "NA" and replaces it with corresponding column's average of rest of the entries, removing first column 
svmTrain.m -       :Opensource Octave library API for SVM model training
output-analysis.txt:Tracking model accuracy as I tried various solutions
gaussianKernel.m   :Gaussian/ kernel
dataset3Params.m   :Finds best combination of C and sigma for which error is least/accuracy is best for all skewed data (taken from previous project)
Dataset-2.xlsx     :output file
data.txt           :Input training data (modified using above testScript.m)
P_ID	male	age	education	currentSmoker	cigsPerDay	BPMeds	prevalentStroke	prevalentHyp	diabetes	totChol	sysBP	diaBP	BMI	heartRate	glucose

Assignment Details.docx: Assignment question


Results-
For C=0.1 and Sigma=0.3 and after 1min training/buliding model over training data(80%) below are the accuracies,
Data		Acuuracy
Training	100%
Validation	56%
all 1's		94%
all 0's		83%	
