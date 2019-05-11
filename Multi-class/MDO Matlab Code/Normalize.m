function [NormalData,M] = Normalize(imbalancedDataset)
% imbalancedDataset is all samples without labels
% The NormalData is zero mean
% M is the mean of the data

NormalData = imbalancedDataset -repmat(mean(imbalancedDataset),[size(imbalancedDataset,1),1]); 
M = mean(imbalancedDataset);