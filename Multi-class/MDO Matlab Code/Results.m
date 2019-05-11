clc;
fprintf('The Data set is: %s',Name);
fprintf('\nThe Classifier is: %s', classifierName);
fprintf('\n*************************');

%--- Before Oversampling
fprintf('\nBefore Oversampling');
fprintf('\nMAUC:%.4f',mean(BO_Final_MAUC));fprintf('+-%.4f',std(BO_Final_MAUC));
fprintf('\nG-mean:%.4f',mean(BO_FinalGmean));fprintf('+-%.4f',std(BO_FinalGmean));
fprintf('\nPrecision:%.4f',mean(BO_FinalPrecision));fprintf('+-%.4f',std(BO_FinalPrecision));
fprintf('\nRecall:%.4f',mean(BO_FinalRecall));fprintf('+-%.4f',std(BO_FinalRecall));
fprintf('\nFmeasure:%.4f',mean(BO_FinalFmeasure));fprintf('+-%.4f',std(BO_FinalFmeasure));

%--- Random Oversampling
fprintf('\n*************************');
fprintf('\nRandom Oversampling');
fprintf('\nMAUC:%.4f',mean(RA_Final_MAUC));fprintf('+-%.4f',std(RA_Final_MAUC));
fprintf('\nG-mean:%.4f',mean(RA_Final_Gmean));fprintf('+-%.4f',std(RA_Final_Gmean));
fprintf('\nPrecision:%.4f',mean(RA_Final_Precision));fprintf('+-%.4f',std(RA_Final_Precision));
fprintf('\nRecall:%.4f',mean(RA_Final_Recall));fprintf('+-%.4f',std(RA_Final_Recall));
fprintf('\nFmeasure:%.4f',mean(RA_Final_Fmeasure));fprintf('+-%.4f',std(RA_Final_Fmeasure));

%--- MDO Oversampling
fprintf('\n***************************');
fprintf('\nMDO Oversampling');
fprintf('\nMAUC:%.4f',mean(MDO_Final_MAUC1));fprintf('+-%.4f',std(MDO_Final_MAUC1));
fprintf('\nG-mean:%.4f',mean(MDO_Final_Gmean1));fprintf('+-%.4f',std(MDO_Final_Gmean1));    
fprintf('\nPrecision:%.4f',mean(MDO_Final_Precision1));fprintf('+-%.4f',std(MDO_Final_Precision1));  
fprintf('\nRecall:%.4f',mean(MDO_Final_Recall1));fprintf('+-%.4f',std(MDO_Final_Recall1));   
fprintf('\nFmeasure:%.4f',mean(MDO_Final_Fmeasure1));fprintf('+-%.4f',std(MDO_Final_Fmeasure1));  

%--- SMOTE Oversampling
fprintf('\n***************************');
fprintf('\nSMOTE Oversampling');
fprintf('\nMAUC:%.4f',mean(SMOTE_Final_MAUC));fprintf('+-%.4f',std(SMOTE_Final_MAUC));
fprintf('\nG-mean:%.4f',mean(SMOTE_Final_Gmean));fprintf('+-%.4f',std(SMOTE_Final_Gmean));    
fprintf('\nPrecision:%.4f',mean(SMOTE_Final_Precision));fprintf('+-%.4f',std(SMOTE_Final_Precision));  
fprintf('\nRecall:%.4f',mean(SMOTE_Final_Recall));fprintf('+-%.4f',std(SMOTE_Final_Recall));   
fprintf('\nFmeasure:%.4f',mean(SMOTE_Final_Fmeasure));fprintf('+-%.4f',std(SMOTE_Final_Fmeasure));  

%--- BorderlineSMOTE Oversampling
fprintf('\n***************************');
fprintf('\nBorderlineSMOTE Oversampling');
fprintf('\nMAUC:%.4f',mean(BorderlineSMOTE_Final_MAUC));fprintf('+-%.4f',std(BorderlineSMOTE_Final_MAUC));
fprintf('\nG-mean:%.4f',mean(BorderlineSMOTE_Final_Gmean));fprintf('+-%.4f',std(BorderlineSMOTE_Final_Gmean));    
fprintf('\nPrecision:%.4f',mean(BorderlineSMOTE_Final_Precision));fprintf('+-%.4f',std(BorderlineSMOTE_Final_Precision));  
fprintf('\nRecall:%.4f',mean(BorderlineSMOTE_Final_Recall));fprintf('+-%.4f',std(BorderlineSMOTE_Final_Recall));   
fprintf('\nFmeasure:%.4f',mean(BorderlineSMOTE_Final_Fmeasure));fprintf('+-%.4f',std(BorderlineSMOTE_Final_Fmeasure));  

%--- ADASYN Oversampling
fprintf('\n***************************');
fprintf('\nADASYN Oversampling');
fprintf('\nMAUC:%.4f',mean(ADASYN_Final_MAUC));fprintf('+-%.4f',std(ADASYN_Final_MAUC));
fprintf('\nG-mean:%.4f',mean(ADASYN_Final_Gmean));fprintf('+-%.4f',std(ADASYN_Final_Gmean));    
fprintf('\nPrecision:%.4f',mean(ADASYN_Final_Precision));fprintf('+-%.4f',std(ADASYN_Final_Precision));  
fprintf('\nRecall:%.4f',mean(ADASYN_Final_Recall));fprintf('+-%.4f',std(ADASYN_Final_Recall));   
fprintf('\nFmeasure:%.4f',mean(ADASYN_Final_Fmeasure));fprintf('+-%.4f',std(ADASYN_Final_Fmeasure));  

%----------------------------------------------------------------------------------------------------------------------------
% Writting in file
N_Name = sprintf('Res-%s-%s',classifierName,Name);
fileID = fopen(N_Name,'w');
fprintf(fileID,'The Data set is: %s',Name);
fprintf(fileID,'\nThe Classifier is: %s', classifierName);

%--- Before Oversampling
fprintf(fileID,'\nBefore Oversampling');
fprintf(fileID,'\nMAUC:%.4f',mean(BO_Final_MAUC));fprintf(fileID,'+-%.4f',std(BO_Final_MAUC));
fprintf(fileID,'\nG-mean:%.4f',mean(BO_FinalGmean));fprintf(fileID,'+-%.4f',std(BO_FinalGmean));
fprintf(fileID,'\nPrecision:%.4f',mean(BO_FinalPrecision));fprintf(fileID,'+-%.4f',std(BO_FinalPrecision));
fprintf(fileID,'\nRecall:%.4f',mean(BO_FinalRecall));fprintf(fileID,'+-%.4f',std(BO_FinalRecall));
fprintf(fileID,'\nFmeasure:%.4f',mean(BO_FinalFmeasure));fprintf(fileID,'+-%.4f',std(BO_FinalFmeasure));

%--- Random Oversampling
fprintf(fileID,'\n*************************');
fprintf(fileID,'\nRandom Oversampling');
fprintf(fileID,'\nMAUC:%.4f',mean(RA_Final_MAUC));fprintf(fileID,'+-%.4f',std(RA_Final_MAUC));
fprintf(fileID,'\nG-mean:%.4f',mean(RA_Final_Gmean));fprintf(fileID,'+-%.4f',std(RA_Final_Gmean));
fprintf(fileID,'\nPrecision:%.4f',mean(RA_Final_Precision));fprintf(fileID,'+-%.4f',std(RA_Final_Precision));
fprintf(fileID,'\nRecall:%.4f',mean(RA_Final_Recall));fprintf(fileID,'+-%.4f',std(RA_Final_Recall));
fprintf(fileID,'\nFmeasure:%.4f',mean(RA_Final_Fmeasure));fprintf(fileID,'+-%.4f',std(RA_Final_Fmeasure));

%--- MDO Oversampling 
fprintf(fileID,'\n***************************');
fprintf(fileID,'\nMDO Oversampling');
fprintf(fileID,'\nMAUC:%.4f',mean(MDO_Final_MAUC1));fprintf(fileID,'+-%.4f',std(MDO_Final_MAUC1));
fprintf(fileID,'\nG-mean:%.4f',mean(MDO_Final_Gmean1));fprintf(fileID,'+-%.4f',std(MDO_Final_Gmean1));    
fprintf(fileID,'\nPrecision:%.4f',mean(MDO_Final_Precision1));fprintf(fileID,'+-%.4f',std(MDO_Final_Precision1));  
fprintf(fileID,'\nRecall:%.4f',mean(MDO_Final_Recall1));fprintf(fileID,'+-%.4f',std(MDO_Final_Recall1));   
fprintf(fileID,'\nFmeasure:%.4f',mean(MDO_Final_Fmeasure1));fprintf(fileID,'+-%.4f',std(MDO_Final_Fmeasure1));  

%--- SMOTE Oversampling
fprintf(fileID,'\n***************************');
fprintf(fileID,'\nSMOTE Oversampling');
fprintf(fileID,'\nMAUC:%.4f',mean(SMOTE_Final_MAUC));fprintf(fileID,'+-%.4f',std(SMOTE_Final_MAUC));
fprintf(fileID,'\nG-mean:%.4f',mean(SMOTE_Final_Gmean));fprintf(fileID,'+-%.4f',std(SMOTE_Final_Gmean));    
fprintf(fileID,'\nPrecision:%.4f',mean(SMOTE_Final_Precision));fprintf(fileID,'+-%.4f',std(SMOTE_Final_Precision));  
fprintf(fileID,'\nRecall:%.4f',mean(SMOTE_Final_Recall));fprintf(fileID,'+-%.4f',std(SMOTE_Final_Recall));   
fprintf(fileID,'\nFmeasure:%.4f',mean(SMOTE_Final_Fmeasure));fprintf(fileID,'+-%.4f',std(SMOTE_Final_Fmeasure));  

%--- BorderlineSMOTE Oversampling
fprintf(fileID,'\n***************************');
fprintf(fileID,'\nBorderlineSMOTE Oversampling');
fprintf(fileID,'\nMAUC:%.4f',mean(BorderlineSMOTE_Final_MAUC));fprintf(fileID,'+-%.4f',std(BorderlineSMOTE_Final_MAUC));
fprintf(fileID,'\nG-mean:%.4f',mean(BorderlineSMOTE_Final_Gmean));fprintf(fileID,'+-%.4f',std(BorderlineSMOTE_Final_Gmean));    
fprintf(fileID,'\nPrecision:%.4f',mean(BorderlineSMOTE_Final_Precision));fprintf(fileID,'+-%.4f',std(BorderlineSMOTE_Final_Precision));  
fprintf(fileID,'\nRecall:%.4f',mean(BorderlineSMOTE_Final_Recall));fprintf(fileID,'+-%.4f',std(BorderlineSMOTE_Final_Recall));   
fprintf(fileID,'\nFmeasure:%.4f',mean(BorderlineSMOTE_Final_Fmeasure));fprintf(fileID,'+-%.4f',std(BorderlineSMOTE_Final_Fmeasure));  

%--- ADASYN Oversampling
fprintf(fileID,'\n***************************');
fprintf(fileID,'\nADASYN Oversampling');
fprintf(fileID,'\nMAUC:%.4f',mean(ADASYN_Final_MAUC));fprintf(fileID,'+-%.4f',std(ADASYN_Final_MAUC));
fprintf(fileID,'\nG-mean:%.4f',mean(ADASYN_Final_Gmean));fprintf(fileID,'+-%.4f',std(ADASYN_Final_Gmean));    
fprintf(fileID,'\nPrecision:%.4f',mean(ADASYN_Final_Precision));fprintf(fileID,'+-%.4f',std(ADASYN_Final_Precision));  
fprintf(fileID,'\nRecall:%.4f',mean(ADASYN_Final_Recall));fprintf(fileID,'+-%.4f',std(ADASYN_Final_Recall));   
fprintf(fileID,'\nFmeasure:%.4f',mean(ADASYN_Final_Fmeasure));fprintf(fileID,'+-%.4f',std(ADASYN_Final_Fmeasure));  
fclose(fileID);

%--------------------------------------------------------------------------------------------------------------------------
% Before Oversampling;
% Random Oversampling; 
% MDO; 
% SMOTE;
% Borderline SMOTE; 
% ADASYN

% Results for FriedmanTest MAUC
New_Name = sprintf('Friedman-%s-%s',classifierName,Name);
fileID = fopen(New_Name,'w');
fprintf(fileID,'The Data set is: %s',Name);
fprintf(fileID,'\nThe Classifier is: %s', classifierName);

fprintf(fileID,'\nMAUC');
fprintf(fileID,'\n%.4f',mean(BO_Final_MAUC));
fprintf(fileID,' %.4f',mean(RA_Final_MAUC));
fprintf(fileID,' %.4f',mean(MDO_Final_MAUC1));
fprintf(fileID,' %.4f',mean(SMOTE_Final_MAUC));
fprintf(fileID,' %.4f',mean(BorderlineSMOTE_Final_MAUC));
fprintf(fileID,' %.4f',mean(ADASYN_Final_MAUC));

% Results for FriedmanTest G-mean
fprintf(fileID,'\nG-mean');
fprintf(fileID,'\n%.4f',mean(BO_FinalGmean));
fprintf(fileID,' %.4f',mean(RA_Final_Gmean));
fprintf(fileID,' %.4f',mean(MDO_Final_Gmean1));
fprintf(fileID,' %.4f',mean(SMOTE_Final_Gmean));    
fprintf(fileID,' %.4f',mean(BorderlineSMOTE_Final_Gmean)); 
fprintf(fileID,' %.4f',mean(ADASYN_Final_Gmean));

% Results for FriedmanTest Precision
fprintf(fileID,'\nPrecision');
fprintf(fileID,'\n%.4f',mean(BO_FinalPrecision));
fprintf(fileID,' %.4f',mean(RA_Final_Precision));
fprintf(fileID,' %.4f',mean(MDO_Final_Precision1));
fprintf(fileID,' %.4f',mean(SMOTE_Final_Precision));
fprintf(fileID,' %.4f',mean(BorderlineSMOTE_Final_Precision));
fprintf(fileID,' %.4f',mean(ADASYN_Final_Precision));

% Results for FriedmanTest Recall
fprintf(fileID,'\nRecall');
fprintf(fileID,'\n%.4f',mean(BO_FinalRecall));
fprintf(fileID,' %.4f',mean(RA_Final_Recall));
fprintf(fileID,' %.4f',mean(MDO_Final_Recall1));
fprintf(fileID,' %.4f',mean(SMOTE_Final_Recall)); 
fprintf(fileID,' %.4f',mean(BorderlineSMOTE_Final_Recall));
fprintf(fileID,' %.4f',mean(ADASYN_Final_Recall));

% Results for FriedmanTest F-measure
fprintf(fileID,'\nFmeasure');
fprintf(fileID,'\n%.4f',mean(BO_FinalFmeasure));
fprintf(fileID,' %.4f',mean(RA_Final_Fmeasure));
fprintf(fileID,' %.4f',mean(MDO_Final_Fmeasure1));
fprintf(fileID,' %.4f',mean(SMOTE_Final_Fmeasure)); 
fprintf(fileID,' %.4f',mean(BorderlineSMOTE_Final_Fmeasure));
fprintf(fileID,' %.4f',mean(ADASYN_Final_Fmeasure));
fclose(fileID);
  
 %ALL Results --------------------------------------------------------------------------------------------------------------------------
% Before Oversampling;
% Random Oversampling; 
% MDO; 
% SMOTE;
% Borderline SMOTE; 
% ADASYN

New_Name = sprintf('ALL-Res-%s-%s',classifierName,Name);
fileID = fopen(New_Name,'w');
fprintf(fileID,'The Data set is: %s',Name);
fprintf(fileID,'\nThe Classifier is: %s', classifierName);

fprintf(fileID,'\nMAUC');
fprintf(fileID,'\n%.4f',mean(BO_Final_MAUC));fprintf(fileID,'+-%.4f',std(BO_Final_MAUC));
fprintf(fileID,' %.4f',mean(RA_Final_MAUC));fprintf(fileID,'+-%.4f',std(RA_Final_MAUC));
fprintf(fileID,' %.4f',mean(MDO_Final_MAUC1));fprintf(fileID,'+-%.4f',std(MDO_Final_MAUC1));
fprintf(fileID,' %.4f',mean(SMOTE_Final_MAUC));fprintf(fileID,'+-%.4f',std(SMOTE_Final_MAUC));
fprintf(fileID,' %.4f',mean(BorderlineSMOTE_Final_MAUC));fprintf(fileID,'+-%.4f',std(BorderlineSMOTE_Final_MAUC));
fprintf(fileID,' %.4f',mean(ADASYN_Final_MAUC));fprintf(fileID,'+-%.4f',std(ADASYN_Final_MAUC));

% Results for  G-mean
fprintf(fileID,'\nG-mean');
fprintf(fileID,'\n%.4f',mean(BO_FinalGmean));fprintf(fileID,'+-%.4f',std(BO_FinalGmean));
fprintf(fileID,' %.4f',mean(RA_Final_Gmean));fprintf(fileID,'+-%.4f',std(RA_Final_Gmean));
fprintf(fileID,' %.4f',mean(MDO_Final_Gmean1));fprintf(fileID,'+-%.4f',std(MDO_Final_Gmean1));
fprintf(fileID,' %.4f',mean(SMOTE_Final_Gmean));  fprintf(fileID,'+-%.4f',std(SMOTE_Final_Gmean));  
fprintf(fileID,' %.4f',mean(BorderlineSMOTE_Final_Gmean)); fprintf(fileID,'+-%.4f',std(BorderlineSMOTE_Final_Gmean));
fprintf(fileID,' %.4f',mean(ADASYN_Final_Gmean));fprintf(fileID,'+-%.4f',std(ADASYN_Final_Gmean));

% Results for  Precision
fprintf(fileID,'\nPrecision');
fprintf(fileID,'\n%.4f',mean(BO_FinalPrecision));fprintf(fileID,'+-%.4f',std(BO_FinalPrecision));
fprintf(fileID,' %.4f',mean(RA_Final_Precision));fprintf(fileID,'+-%.4f',std(RA_Final_Precision));
fprintf(fileID,' %.4f',mean(MDO_Final_Precision1));fprintf(fileID,'+-%.4f',std(MDO_Final_Precision1));
fprintf(fileID,' %.4f',mean(SMOTE_Final_Precision));fprintf(fileID,'+-%.4f',std(SMOTE_Final_Precision));
fprintf(fileID,' %.4f',mean(BorderlineSMOTE_Final_Precision));fprintf(fileID,'+-%.4f',std(BorderlineSMOTE_Final_Precision));
fprintf(fileID,' %.4f',mean(ADASYN_Final_Precision));fprintf(fileID,'+-%.4f',std(ADASYN_Final_Precision));

% Results for  Recall
fprintf(fileID,'\nRecall');
fprintf(fileID,'\n%.4f',mean(BO_FinalRecall));fprintf(fileID,'+-%.4f',std(BO_FinalRecall));
fprintf(fileID,' %.4f',mean(RA_Final_Recall));fprintf(fileID,'+-%.4f',std(RA_Final_Recall));
fprintf(fileID,' %.4f',mean(MDO_Final_Recall1));fprintf(fileID,'+-%.4f',std(MDO_Final_Recall1));
fprintf(fileID,' %.4f',mean(SMOTE_Final_Recall)); fprintf(fileID,'+-%.4f',std(SMOTE_Final_Recall));
fprintf(fileID,' %.4f',mean(BorderlineSMOTE_Final_Recall));fprintf(fileID,'+-%.4f',std(BorderlineSMOTE_Final_Recall));
fprintf(fileID,' %.4f',mean(ADASYN_Final_Recall));fprintf(fileID,'+-%.4f',std(ADASYN_Final_Recall));

% Results for F-measure
fprintf(fileID,'\nFmeasure');
fprintf(fileID,'\n%.4f',mean(BO_FinalFmeasure));fprintf(fileID,'+-%.4f',std(BO_FinalFmeasure));
fprintf(fileID,' %.4f',mean(RA_Final_Fmeasure));fprintf(fileID,'+-%.4f',std(RA_Final_Fmeasure));
fprintf(fileID,' %.4f',mean(MDO_Final_Fmeasure1));fprintf(fileID,'+-%.4f',std(MDO_Final_Fmeasure1));
fprintf(fileID,' %.4f',mean(SMOTE_Final_Fmeasure));fprintf(fileID,'+-%.4f',std(SMOTE_Final_Fmeasure)); 
fprintf(fileID,' %.4f',mean(BorderlineSMOTE_Final_Fmeasure));fprintf(fileID,'+-%.4f',std(BorderlineSMOTE_Final_Fmeasure));
fprintf(fileID,' %.4f',mean(ADASYN_Final_Fmeasure));fprintf(fileID,'+-%.4f',std(ADASYN_Final_Fmeasure));
fclose(fileID);
  

