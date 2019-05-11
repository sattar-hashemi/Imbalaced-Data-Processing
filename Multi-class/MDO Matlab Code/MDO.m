function newSamples = MDO(MinorityClasses,Name,train,DataSet)

NumF = DataSet.FeatureNum;
Samples = struct();
newSamples = [];
Train = DatasetInformation(train);
TClassInfo = Train.ClassDistribution;
[MajorityClassNum,~] = max(TClassInfo(:,1));


for i=MinorityClasses
    trainOneClass = train(find(train(:,end)==i),:);
    [t,weights] = chooseSamples(Name,train,trainOneClass);
    [NS,M] = Normalize(t);
    Samples(i).ClassMean = M;
    Samples(i).NormalSamples = NS;
    Samples(i).value = t;               % Original samples
    Samples(i).label = i;
    Samples(i).size = size(t,1);        % Number of samples in each class
    Samples(i).numFeatures = NumF;
    [V,D] = eig(cov(NS));               % Eigen values of covariance matrix
    Samples(i).transformed = (V'*NS')'; % Transformed samples into another space
    Samples(i).transitionMatrix = V;
    Samples(i).coef = diag(cov(Samples(i).transformed));
    Samples(i).weights = weights;
    
end

% OverSampling for minority classes of samples
for i= MinorityClasses
    oversampleRate = MajorityClassNum - TClassInfo(i,1) ;
    tempSamples = MDO_Oversampling(Samples(i),oversampleRate);
    V = Samples(i).transitionMatrix;
    M = Samples(i).ClassMean;
    tempSamples = tempSamples*V';        % Transform to the original space
    tempSamples = tempSamples + repmat(M,[size(tempSamples,1),1]);
    tempSamples(:,NumF+1) = i;            % Assign label
    newSamples = [newSamples;tempSamples];   
end

