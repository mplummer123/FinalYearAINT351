function learnDescisionTree(variables, classification)

measData = num2cell(variables);
global dataSet;
dataSet =[measData,classification];
disp(dataSet);
split(1,2,1);

%speciesData = getVariable(fisheriris, species);
%disp(speciesData);
%variables = [VarName1, VarName2, VarName3, VarName4];
%classication = Classification;

% T = empty tree
% repeat
%   split data-set, D, into sub-sets, S0-Sn, using T
%   for each subset, Si
%     for each variables, xj
%       for each values, vk, in Si
% 	  split Si into sub-sets Si1 and Si2: vk>xj and xj>=vk
% 	  find max improvement max(I(Si1, Si2)) for split <Si, xj, vk> 
%   add split <Si, xj, vk> with max(I(Si1, Si2)) to T
% until max(I(Si1, Si2)) <= 0.0 

end

