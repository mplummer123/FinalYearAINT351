function KNearest

global proximityValue
global LTM
global proximityAndMatchVector

EpisodeLTM = 1;
StepInEpisode = 1;

nearestSteps = zeros(10,4);
nearestStepsRowNum = 1;
proximityAndMatchVectorRowNum = 1;

%for every episode in LTM
while EpisodeLTM <= size(LTM,3)
    %for every step in episode
    while StepInEpisode <= 20
        STM = LTM(:,:,EpisodeLTM);
        stmObservationValue = LTM(StepInEpisode,1,EpisodeLTM);
        %pass to proximity the LTM, step to start, 20x3 STM (current episode)
        %and the observation of this step in LTM
        proximity(LTM, EpisodeLTM, StepInEpisode,STM, stmObservationValue);
        StepInEpisode = StepInEpisode + 1;
        
        if proximityValue > 0
            %if size(nearestSteps,1) == 10
                while proximityAndMatchVectorRowNum <= size(proximityAndMatchVector,1)
                    %find min proximity value in nearest steps
                    minValue = min(nearestSteps(:,1));
                    %get the proximity of the row stated from proximityAndMatchVector
                    possibleReplaceProximity = proximityAndMatchVector(proximityAndMatchVectorRowNum,1);
                    if possibleReplaceProximity > minValue
                        %get the row the min nearestSteps proximity is in
                        [row, column] = find(nearestSteps == minValue);
                        %replace the nearestStep row with the values in the
                        %proximityAndMatchVector for that row.
                        nearestStep(row,1) = proximityAndMatchVector(proximityAndMatchVectorRowNum,1);
                        nearestStep(row,2) = proximityAndMatchVector(proximityAndMatchVectorRowNum,2);
                        nearestStep(row,3) = proximityAndMatchVector(proximityAndMatchVectorRowNum,3);
                        nearestStep(row,4) = proximityAndMatchVector(proximityAndMatchVectorRowNum,4);
                    end
                    %iterate through all rows in the proximityAndMatchVector
                    proximityAndMatchVectorRowNum = proximityAndMatchVectorRowNum + 1;
                %end
                %reset the row num for the next call.
                
            %else
                %if any iteration has any matches resulting in proximities more
                %than one then store the values.
                %nearestSteps = (nearestSteps:proximityAndMatchVector);
                %nearestStepsRowNum = nearestStepsRowNum +1;
                end
            proximityAndMatchVectorRowNum = 1;
        end
    end
    EpisodeLTM = EpisodeLTM + 1;
    %Reset the step number to 1 for next episode
    StepInEpisode = 1;
end

disp('Knearest vector is :')
disp(nearestSteps);
end

