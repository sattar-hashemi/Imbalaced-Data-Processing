function R = Recall(MinorityClass,estimatedLabelsTest,TrueTestLabels)


index = find(TrueTestLabels == MinorityClass);  % indexes of Minority class labels
trueMinorLabel = TrueTestLabels(index);          % true Minority class labels
estimatedMinorLabel = estimatedLabelsTest(index);% estimated Minority class labels
TP = length(find(trueMinorLabel == estimatedMinorLabel)); % True Positive
FN = length(find(trueMinorLabel ~= estimatedMinorLabel)); % False Negative

R = (TP) / (TP + FN);
end



