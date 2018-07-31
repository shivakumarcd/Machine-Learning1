%this file prepares the input data like
%     Replaces NAs/-1s with average of rest in colmn
%     Normalzation

clear; clc;

%**********FUNCTIONS{*****************************************
%finding mean of a column ignoring -1's
function avg = calculate_avg_for_col(matrixTemp, columnNum)
  %finding number of -1s in a column
  data = matrixTemp;
  numOfMinus1s = sum(data(:,columnNum)==-1);
  n = size(data,1) - numOfMinus1s;
  positiveSum = sum(data(:,columnNum)) + numOfMinus1s;
  mean = positiveSum/n;
  avg = mean;
end

%check if column contains -1's
function contains = contains_negative_1(matrixTemp, columnNum)
  contains = 0;
  numOfRows = size(matrixTemp, 1);
  for i=1:numOfRows,
    if matrixTemp(i, columnNum) == -1,
      contains = 1;
      break;
    end
  end 
end

%Replacing -1 values with average of rest of values in respective column


%Fucntion to normalze of data
function normalized_data = normalize(data)
  num_rows_data = size(data,1);
  num_cols_data = size(data,2);
  for j=1:num_cols_data,
      mean_of_col = mean(data(:,j));
      sd_of_col = std(data(:,j));
      for i=1:num_rows_data,
        data(i,j) = (data(i,j)-mean_of_col)/sd_of_col;
      end
  end
  normalized_data = data;
end

%Function to scale data b/w 0-1


%**********}FUNCTIONS*****************************************

fprintf('sample data : ');
data36 = load('30-6 data.txt');
round(data36(1:5,2:17))
fprintf('\n__________________________________Running test scripts for data 30:6(subset)___________________________')
data36 = data36(:,2:17); %ingnoring id column
fprintf('\nnumber of healthy/notHealthy results\n')
healthy = sum(data36(:,16)==0)
notHealthy = sum(data36(:,16)==1)

fprintf('replacing -1s in each column by average of rest of entries\n')
numOfColsData36 = size(data36,2)
numOfRowsData36 = size(data36,1)
for j=1:numOfColsData36,
    if(contains_negative_1(data36, j) == 1),
       average_for_current_column = calculate_avg_for_col(data36, j);
       for i=1:numOfRowsData36,
          if data36(i, j) == -1,
             data36(i, j) = average_for_current_column;
          end;
       end;
    end;
end;
%data36 = normalize(data36);
data36(1:5,:)
pause;
fprintf('press enter to continue');


fprintf('\n__________________________________Running test scripts for data(whole)__________________________________')
data = load('data with -1 and id.txt');
data = data(:, 2:17);%ingnoring id column

fprintf('\nnumber of healthy/notHealthy results\n')
healthy = sum(data(:,16)==0)
notHealthy = sum(data(:,16)==1)

fprintf('replacing -1s in each column by average of rest of entries\n')
numOfColsData = size(data,2)
numOfRowsData = size(data,1)
for j=1:numOfColsData,
    if(contains_negative_1(data, j) == 1),
       average_for_current_column = calculate_avg_for_col(data, j);
       for i=1:numOfRowsData,
          if data(i, j) == -1,
             data(i, j) = average_for_current_column;
          end;
       end;
    end;
end;
%normalized_data = normalize(data);
pause;
fprintf("press enter to continue to Testing functions and random codes")

fprintf('_________________________________________Testing fucntions/and other codes_________________________________________\n')
tmpMatrix = [ .1, .2, .3, .4;  .4, -.5, .6, .1;  .7, .8, .9, .8;.7, .5, .3,-.7]
fprintf("calculate_col_avg(tmpMatrix, 3) = ");
calculate_avg_for_col(tmpMatrix, 3)
fprintf("contains_negative_1(tmpMatrix,1) = \n");
contains_negative_1(tmpMatrix,1)
fprintf("contains_negative_1(tmpMatrix,4) = \n");
contains_negative_1(tmpMatrix,4)
fprintf

%normalize(tmpMatrix);