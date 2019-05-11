function [classifier] = Classifier(train,name)
% Classifier will generate a classifier
% train: is the dataset
% name: is the name of the dataset



switch name
    case 'J48'
        classifier = weka.classifiers.trees.J48();
        %         option = '-U -B -M 2 -A';
        %         classifier.setOptions(weka.core.Utils.splitOptions(option));
        
    case 'SVM-NormalizedPolyKernel'
        classifier = weka.classifiers.functions.SMO();
        option = '-C 1.0 -L 0.0010 -P 1.0E-12 -N 0 -V -1 -W 1 -K "weka.classifiers.functions.supportVector.NormalizedPolyKernel -C 250007 -E 2.0"';
        %         option = '-C 2.0 -L 0.0010 -P 1.0E-12 -N 0 -V -1 -W 1 -K "weka.classifiers.functions.supportVector.RBFKernel -C 250007 -G 0.01"';
        classifier.setOptions(weka.core.Utils.splitOptions(option));
        
    case 'SVM'
        classifier = weka.classifiers.functions.SMO();
      
    case '5NN'
        classifier = weka.classifiers.lazy.IBk();
        option = '-K 5 -W 0 -A "weka.core.neighboursearch.LinearNNSearch -A \"weka.core.EuclideanDistance -R first-last\""';
        classifier.setOptions(weka.core.Utils.splitOptions(option));
        
    case 'OneNN'
        classifier = weka.classifiers.lazy.IBk();
        
    case 'Naive'
        classifier = weka.classifiers.bayes.NaiveBayes();
        
    case 'Ripper'
        classifier = weka.classifiers.rules.JRip();
end

save train.txt train -ascii

[train] = convertToNominal('train.txt');
classifier.buildClassifier(train);
end

