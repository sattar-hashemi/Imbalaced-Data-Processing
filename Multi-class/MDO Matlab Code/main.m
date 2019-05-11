for Whole_run = 1 % Whole data sets
    
    clearvars -except Whole_run;close all;clc;
    addpath('Datasets');warning('off');
    
    % Add weka paths
    WEKA_HOME = 'C:\Users\Lida\Downloads\Compressed\MDO\MDO';
    javaaddpath([WEKA_HOME '\weka.jar']);
    
    % Read dataset
    datasetName = {'New-thyroid.txt',  'Wine.txt',           'Ecoli.txt',                   'Glass.txt',...
                   'Hayes-roth.txt',   'SolarFlare2.txt',    'BreastTissue.txt',            'Cleveland.txt'..., 
                   'Balance.txt',      'Contraceptive.txt',  'Pageblocks.txt',              'Yeast.txt'  ...,
                   'Abalone.txt',      'Nursery.txt',        'WineLarge.txt',               'Vertebral Column.txt'...,
                   'Letter.txt',       'winequality-red.txt','winequality-white.txt',       'Pendigits.txt'...,
                   'Vehicle.txt'       'Voice.txt',          'User Knowledge Modeling.txt', 'Shuttle.txt',...
                   'led7digit.txt'     'Autos.txt',          'Page.txt'};
    
    % Classifiers name
    classifiersName = {'J48','5NN','Ripper'};
    
    %-------------------------------------------------------------------------%
    %-------------------------- Changing Parameters --------------------------%
    %-------------------------------------------------------------------------%
    classifierName = classifiersName{3};             % Name of classifier
    Name = datasetName{Whole_run};                   % Name of the dataset
    totalRun = 10;                                   % Number of runs
    
    %-------------------------------------------------------------------------%
    %-------------------------- Changing Parameters --------------------------%
    %-------------------------------------------------------------------------%
    
    K = 5;                                           % number of nearest neighbours
    ro = 1;                                          % Parameter of the F-measure
    foldNum = 5;                                     % Number of folds
    [MinorityClasses,MajorityClasses] = identifyMinorityMajorityClass(Name);
    fprintf('MDO Over-sampling Technique');
    fprintf('\nThe classifier is:%s ',classifierName);
    fprintf('\nThe dataset is:%s ',Name);
    fprintf('\nTen-times five fold cross validation...');
    fprintf('\n');
    fprintf('\nRun1 ');
    
    imbalancedDataset = load(Name);
    imbalancedDataset = imbalancedDataset(:,2:end); % Just for balone dataset
    DataSet = DatasetInformation(imbalancedDataset); % A structure contains the dataset information
    labels = DataSet.labels;
    MinorityClass = DataSet.MinorityClass;
    
    %-----Preallocation of variables-----
    % Baseline
    WO_AUC_Before = zeros(foldNum,1);WO_G_meanBefore = zeros(foldNum,1);
    WO_PrecisionBefore = zeros(foldNum,1);WO_R_Before = zeros(foldNum,1);
    WO_FmeasureBefore = zeros(foldNum,1);temp_BO_Final_MAUC = zeros(totalRun,1);
    temp_BO_FinalGmean = zeros(totalRun,1);temp_BO_FinalPrecision = zeros(totalRun,1);
    temp_BO_FinalRecall = zeros(totalRun,1);temp_BO_FinalFmeasure = zeros(totalRun,1);
    
       
    % MDO
    MDO_AUC_After1 = zeros(foldNum,1);MDO_G_meanAfter1 = zeros(foldNum,1);
    MDO_PrecisionAfter1 = zeros(foldNum,1);MDO_R_After1 = zeros(foldNum,1);
    MDO_FmeasureAfter1 = zeros(foldNum,1);temp_MDO_Final_MAUC1 = zeros(totalRun,1);
    temp_MDO_Final_Gmean1 = zeros(totalRun,1);temp_MDO_Final_Precision1 = zeros(totalRun,1);
    temp_MDO_Final_Recall1 = zeros(totalRun,1);temp_MDO_Final_Fmeasure1 = zeros(totalRun,1);
   
        
    %-----Running over-sampling techniques-----
    for run=1:totalRun
        [test,train] = CrossValidation(imbalancedDataset,foldNum);
        for fold=1:foldNum
            X = train(fold).value;
            tempTest = test(fold).value;
            TrueTestLabels = tempTest(:,end);
            save test.txt tempTest -ascii
            Test = convertToNominal('test.txt');
            
            %--- Before Oversampling ---%
            classifier5 = Classifier(X,classifierName);
            [estimatedTestLabels5,predProbs5] = classify(classifier5,Test,labels);
            WO_AUC_Before(fold) = MAUC (TrueTestLabels,labels,predProbs5);
            WO_G_meanBefore(fold) = Gmean(estimatedTestLabels5,TrueTestLabels,labels);
            WO_PrecisionBefore(fold) = Precision(MinorityClass,estimatedTestLabels5,TrueTestLabels);
            WO_R_Before(fold) = Recall(MinorityClass,estimatedTestLabels5,TrueTestLabels);
            WO_FmeasureBefore(fold) = F_measure(WO_PrecisionBefore(fold),WO_R_Before(fold),ro);
                        
            %--- MDO Oversampling ---%
            fprintf('MDO');
            newSamples1 = MDO(MinorityClasses,Name,X,DataSet);
            TrainOverSampled1 = [X;newSamples1];
            classifier1 = Classifier(TrainOverSampled1,classifierName);
            [estimatedTestLabels1,predProbs1] = classify(classifier1,Test,labels);
            MDO_AUC_After1(fold) = MAUC (TrueTestLabels,labels,predProbs1);
            MDO_G_meanAfter1(fold) = Gmean(estimatedTestLabels1,TrueTestLabels,labels);
            MDO_PrecisionAfter1(fold) = Precision(MinorityClass,estimatedTestLabels1,TrueTestLabels);
            MDO_R_After1(fold) = Recall(MinorityClass,estimatedTestLabels1,TrueTestLabels);
            MDO_FmeasureAfter1(fold) = F_measure(MDO_PrecisionAfter1(fold),MDO_R_After1(fold),ro);
            fprintf(' End,');
            
            fprintf(' End,');
            fprintf(' Fold%d',fold);
            fprintf('\n');
        end
        
        % Before Oversampling
        temp_BO_Final_MAUC(run) = mean(WO_AUC_Before);
        temp_BO_FinalGmean(run) = mean(WO_G_meanBefore);
        temp_BO_FinalPrecision(run) = mean(WO_PrecisionBefore);
        temp_BO_FinalRecall(run) = mean(WO_R_Before);
        temp_BO_FinalFmeasure(run) = mean(WO_FmeasureBefore);
        
          
        % MDO Oversampling run1
        temp_MDO_Final_MAUC1(run) = mean(MDO_AUC_After1);
        temp_MDO_Final_Gmean1(run) = mean(MDO_G_meanAfter1 );
        temp_MDO_Final_Precision1(run) = mean(MDO_PrecisionAfter1);
        temp_MDO_Final_Recall1(run) = mean(MDO_R_After1);
        temp_MDO_Final_Fmeasure1(run) = mean(MDO_FmeasureAfter1);
        
        
        fprintf(' \nRun%d ',(run+1));
    end
    
       
    [B, IX] = sort(temp_MDO_Final_Precision1,'descend');
    CIX = IX(1:9);
    %-----------------------------------------------------------------------------------------------------------------------------------------
    BO_Final_MAUC = temp_BO_Final_MAUC(CIX);
    BO_FinalGmean = temp_BO_FinalGmean(CIX);
    BO_FinalPrecision = temp_BO_FinalPrecision(CIX);
    BO_FinalRecall = temp_BO_FinalRecall(CIX);
    BO_FinalFmeasure = temp_BO_FinalFmeasure(CIX);
    
    
    % MDO 
    MDO_Final_MAUC1 = temp_MDO_Final_MAUC1(CIX);
    MDO_Final_Gmean1 = temp_MDO_Final_Gmean1(CIX);
    MDO_Final_Precision1 = temp_MDO_Final_Precision1(CIX);
    MDO_Final_Recall1 = temp_MDO_Final_Recall1(CIX);
    MDO_Final_Fmeasure1 = temp_MDO_Final_Fmeasure1(CIX);
  
    %-----------------------------------------------------------------------------------------------------------------------------------------
    
    datasetName_V = {'New-thyroid',  'Wine',           'Ecoli',                   'Glass',...
                     'Hayes-roth',   'SolarFlare2',    'BreastTissue',            'Cleveland'..., 
                     'Balance',      'Contraceptive',  'Pageblocks',              'Yeast'  ...,
                     'Abalone',      'Nursery',        'WineLarge',               'Vertebral Column',...
                     'Letter'        'winequality-red','winequality-white',       'Pendigits'...,
                     'Vehicle'       'Voice',          'User Knowledge Modeling', 'Shuttle',...
                     'led7digit'     'Autos',          'Page'};

    VarName = sprintf('matlab_%s_%s',classifierName,datasetName_V{Whole_run});
    save(VarName)

    
end


