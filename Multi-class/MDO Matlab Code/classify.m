function [estimatedTestLabels,predProbs] = classify(classifier,test,labels)
%CLASSIFY will return the labels and predicted probabilities of 'test' input


% # classify test instances
numInst = test.numInstances();
estimatedTestLabels = zeros(numInst,1);
predProbs = zeros(numInst, length(labels));


for i=1:numInst
    temp = classifier.classifyInstance(test.instance(i-1));
    estimatedTestLabels(i) = str2num(char(test.classAttribute().value((temp))));
    predProbs(i,:) = classifier.distributionForInstance( test.instance(i-1) );
end


end

