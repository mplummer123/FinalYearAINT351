function entropyFunction(dataSet)

global irisSet1;
global irisSet2;

%entropy = -sum(count(unique(dataSet(:,5)))*log2(count(unique(dataSet(:,5))));
%entropy = size(irisSet1{:,5}=='setosa');

%Count number of each classification in the dataSet
setosaCount = sum(strncmp('setosa',dataSet,6));
virginicaCount = sum(strncmp('virginica',dataSet,6));
versicolorCount = sum(strncmp('versicolor',dataSet,6));

%Calculate the probability of each classification
probSetosa = setosaCount(1,5)/size(dataSet,1);
probVirginica = virginicaCount(1,5)/size(dataSet,1);
probVersicolor = versicolorCount(1,5)/size(dataSet,1);

%Calculate the entropy for each classification
entropySetosa = (probSetosa * log2(probSetosa)); 
entropyVirginica = (probVirginica * log2(probVirginica));
entropyVersicolor = (probVersicolor * log2(probVersicolor));

%Sum all of the above entropies
entropy = -(entropySetosa + entropyVirginica + entropyVersicolor);
disp(entropy);


% irisSet1OnlyVariables = cell2mat(irisSet1(:, 1:4));
% irisSet2OnlyVariables = cell2mat(irisSet2(:, 1:4));
% E = entropy(irisSet1OnlyVariables);
% E2 = entropy(irisSet2OnlyVariables);
% E3 = entropy(dataSet);
% disp('Entropy is:');
% disp(E);
% disp(E2);
% disp(E3);
%sum of the log of each probabilty of each class of iris in each set gives
%the entropy
end

