function G_mean = Gmean(estimatedLabelsTest,TrueTestLabels,labels)
% inputs---> labels: is the label of classes
%----------> estimatedLabelsTest :is the number of classes
%---------->TrueTestLabels : is the true labels
% G-mean is the single class Metric

c = length(labels);
for i=1:c
	considerPositive = labels(i);  % as positive
	index = find(TrueTestLabels == considerPositive); 
	truePosLabel = TrueTestLabels(index);          
	estimatedPosLabel = estimatedLabelsTest(index);
	TP = length(find(truePosLabel == estimatedPosLabel)); 
	FN = length(find(truePosLabel ~= estimatedPosLabel)); 
	R(i) = (TP) / (TP + FN);  % Recall of the considered class
end

G_mean = (prod(R))^(1/c);


	