function out = MAUC (TrueTestLabels,labels,predProbs)

c = length(labels);  % Number of classes
t =1;
for i=1:c
    for j=i+1:c
        positiveC = i;
        prob = predProbs(:,positiveC);
        ind1 = find(TrueTestLabels==i);  % index of positive class
        ind2 = find(TrueTestLabels==j);  % index of negative class
        temp1 = [TrueTestLabels(ind1);TrueTestLabels(ind2)];
        temp2 = [prob(ind1);prob(ind2)];
        [~,~,~,AUC1] = perfcurve(temp1,temp2,positiveC);
        
        clear prob ind1 ind2 temp1 temp2
        positiveC = j;
        prob = predProbs(:,positiveC);
        ind1 = find(TrueTestLabels==i);  % index of positive class
        ind2 = find(TrueTestLabels==j);  % index of negative class
        temp1 = [TrueTestLabels(ind1);TrueTestLabels(ind2)];
        temp2 = [prob(ind1);prob(ind2)];
        [~,~,~,AUC2] = perfcurve(temp1,temp2,positiveC);
        
        AUC(t) = (AUC1+AUC2) /2;
        t = t+1;        
    end
end

out = sum(AUC)*(2/(c*(c-1)));