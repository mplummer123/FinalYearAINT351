function learnDescisionTree(variables, classification)

global variableSet;
variableSet = variables;

measData = num2cell(variables);

global dataSet;
dataSet =[measData,classification];

global variableNum;
variableNum = 1;

global thresholdValue;
thresholdValue = 1;

global rowNumber;
rowNumber = 1;

global bestSplitSet1;
global bestSplitSet2;
global bestVariableSet;
global bestVariable;

split(variableNum,variableSet,thresholdValue);



end

