function [test,train] = CrossValidation(X,fold)
% This function will divide the X data (the whole dataset with labels) into
% the number of folds that is specified

% inputs  X: the whole dataset
%         fold: the number of fold that is needed

% output  test: is a structerde array which contains each fold's test samples
%         train: is a structerde array which contains each fold's train samples
                    

labels = unique(X(:,end));
WholeSamples = [];

for i=1:length(labels)
    temp  = X(find(X(:,end)==i),:);
    r = randperm(size(temp,1));
    temp = temp(r,:);
    WholeSamples = [WholeSamples;temp];
end

index(:,1) = WholeSamples(:,end); % labels

for i=1:fold:size(WholeSamples,1)
    index(i:i+fold-1,2) = 1:fold;
end
index = index(1:size(WholeSamples,1),:);

for i=1:fold
    test(i).value = WholeSamples(index(:,2) == i,:);
    train(i).value = WholeSamples(index(:,2) ~= i,:);
end

