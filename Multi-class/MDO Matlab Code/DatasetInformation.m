function [ DataSet ] = DatasetInformation(Dataset)
%DATASETINFORMATION will give a full description of the dataset

S = size(Dataset,1);
F = size(Dataset,2)-1;
DataSet.labels = unique(Dataset(:,end)); % dataset labels
DataSet.ClassNum = length(DataSet.labels);% number of dataset's labels
DataSet.FeatureNum = F; % number of datasets's features
DataSet.InstanceNum = S;

C = zeros(DataSet.ClassNum,2); % column1: number of instances in each class, column2 = class label;

for i=1:DataSet.ClassNum
    temp =  Dataset(find(Dataset(:,end)==i),:);
    C(i,1) = size(temp,1); % size of each class
    C(i,2) = i; % class label
end
DataSet.ClassDistribution = C;

ClassInfo = DataSet.ClassDistribution;
MajorityClassNum = max(ClassInfo(:,1));
MinorityClassNum = min(ClassInfo(:,1));
[~,MinorityClass] =  min(ClassInfo(:,1)); % index of minority class
[~,MajorityClass] =  max(ClassInfo(:,1)); % index of minority class

DataSet.MajorityClassNum = MajorityClassNum;
DataSet.MinorityClassNum = MinorityClassNum;
DataSet.MinorityClass = MinorityClass;
DataSet.MajorityClass = MajorityClass;
end

