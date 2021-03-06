function proximity(LTM, EpisodeLTM, StepInEpisode, STM, ObservationValue)
%PROXIMITY Summary of this function goes here
%   Detailed explanation goes here
global proximityValue
proximityValue = 0.0;

global proximityAndMatchVector
proximityAndMatchVector = [];

rowNum = 1;

currentObservation = LTM(StepInEpisode,1,EpisodeLTM);

%If the observation in the LTM specified by the input is the same as the
%observation specified then its a match
if currentObservation == ObservationValue
    disp('Match');
    proximityValue = 1;
    %get the last row of the STM for an index
    StmIndex = size(STM,1);
    disp(StmIndex);
    %store the match in a vector
    proximityAndMatchVector(rowNum,1) = proximityValue;
    proximityAndMatchVector(rowNum,2) = LTM(StepInEpisode,1,EpisodeLTM);
    proximityAndMatchVector(rowNum,3) = LTM(StepInEpisode,2,EpisodeLTM);
    proximityAndMatchVector(rowNum,4) = LTM(StepInEpisode,3,EpisodeLTM);
    rowNum = rowNum +1;
    %Do this so it stops once it hits the first row of the LTM
    while StepInEpisode >= 1
    %if the observations and action values match for both the LTM and STM
    %row then add one to proximity
    if LTM(StepInEpisode,1,EpisodeLTM) == STM(StmIndex,1) && LTM(StepInEpisode,2,EpisodeLTM) == STM(StmIndex,2) 
        proximityValue = proximityValue + 1;
        proximityAndMatchVector(rowNum,1) = proximityValue;
        proximityAndMatchVector(rowNum,2) = LTM(StepInEpisode,1,EpisodeLTM);
        proximityAndMatchVector(rowNum,3) = LTM(StepInEpisode,2,EpisodeLTM);
        proximityAndMatchVector(rowNum,4) = LTM(StepInEpisode,3,EpisodeLTM);
        %take one away from each index to move back through STM and LTM
        StepInEpisode = StepInEpisode - 1;
        StmIndex = StmIndex - 1;
        rowNum = rowNum + 1;
    else
        %if there is a mismatch terminate the loop.
        disp('Terminate process')
        StepInEpisode = 0;
    end
    end
end
disp('Proximity : ')
disp(proximityValue)
disp('The final output Vector is : ')
disp(proximityAndMatchVector);

end