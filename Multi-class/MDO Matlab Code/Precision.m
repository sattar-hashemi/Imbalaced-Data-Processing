function out = Precision(PosClass,estimatedLabels,TrueLabels)

MinprityCLabel = PosClass;                   
index = find(TrueLabels == MinprityCLabel);  
trueMinerLabel = TrueLabels(index);          
estimatedMinerLabel = estimatedLabels(index);
index = find(estimatedLabels == MinprityCLabel); % those who estimated as positive
TP = length(find(trueMinerLabel == estimatedMinerLabel)); 
FP = length(find(estimatedLabels(index)~=TrueLabels(index)));
out = (TP) / (TP + FP);
if(isnan(out))
    out = 0;
end