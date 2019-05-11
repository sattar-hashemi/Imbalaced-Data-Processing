function [MinorityClasses,MajorityClasses] = identifyMinorityMajorityClass(Name)

switch Name
    case 'New-thyroid.txt'
        MinorityClasses = [2,3];
        MajorityClasses = 1;
        
    case 'Wine.txt'
        MinorityClasses = [1,3];
        MajorityClasses = 2;
        
    case 'Ecoli.txt'
        MinorityClasses = [2,3,4,5];
        MajorityClasses = 1;
        
    case 'Glass.txt'
        MinorityClasses = [3,4,5,6];
        MajorityClasses = [1,2];
        
    case 'SolarFlare2.txt'
        MinorityClasses = [1,2,3,4,5];
        MajorityClasses = 6;
        
    case 'Cleveland.txt'
        MinorityClasses = [1,2,3,4];
        MajorityClasses = 5;
        
    case 'Car.txt'
        MinorityClasses = [2,3,4];
        MajorityClasses = 1;
        
    case 'Balance.txt'
        MinorityClasses = 1;
        MajorityClasses = [2,3];
        
    case 'Hayes-roth.txt'
        MinorityClasses = 3;
        MajorityClasses = [1,2];
        
    case 'Pageblocks.txt'
        MinorityClasses = [2,3,4];
        MajorityClasses = 1;
        
    case 'Yeast.txt'
        MinorityClasses = [1,2,4,5,6,7,8,9,10];
        MajorityClasses = 3;
        
    case 'Nursery.txt'
        MinorityClasses = [1,2,4];
        MajorityClasses = 3;
        
    case 'Shuttle.txt'
        MinorityClasses = [2,3,4];
        MajorityClasses = 1;
        
    case 'BreastTissue.txt'
        MinorityClasses = [2,3,4,5];
        MajorityClasses = 6;
        
    case 'Lymphography.txt'
        MinorityClasses = [1,3];
        MajorityClasses = 2;
        
    case 'Contraceptive.txt'
        MinorityClasses = [2,3];
        MajorityClasses = 1;
        
        %     case 'Page.txt'
        %         MinorityClasses = [2,3,4,5];
        %         MajorityClasses = 1;
        %
        %     case 'Contraceptive.txt'
        %         MinorityClasses = [2,3];
        %         MajorityClasses = 1;
    case 'Abalone.txt'
        MinorityClasses = [1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17,18];
        MajorityClasses = 9;
        
    case 'WineLarge.txt'
        MinorityClasses = [1,2,3,4,5,7];
        MajorityClasses = 6;
        
    case 'Vertebral Column.txt'
        MinorityClasses = [1,3];
        MajorityClasses = 2;
        
    case 'Letter.txt'
        MinorityClasses = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,22,23,24,25,26];
        MajorityClasses = 21;
        
    case 'winequality-red.txt'
        MinorityClasses = [1,2,3,4,6];
        MajorityClasses = 5;
        
    case 'winequality-white.txt'
        MinorityClasses = [1,2,3,4,5,7];
        MajorityClasses = 6;
        
    case 'Pendigits.txt'
        MinorityClasses = [3,5,6,8,9];
        MajorityClasses = [1,2,4,7,10];
        
    case 'Vehicle.txt'
        MinorityClasses = [1,4];
        MajorityClasses = [2,3];
        
        
    case 'Voice.txt'
        MinorityClasses = [1,2];
        MajorityClasses = 3;
        
    case 'User Knowledge Modeling.txt'
        MinorityClasses = [1,2,4];
        MajorityClasses = 3;
        
    case 'led7digit.txt'
        MinorityClasses = [1,2,4,5,6,8,9,10];
        MajorityClasses = [3,7];

    case 'Autos.txt'
        MinorityClasses = [1,2,3,5];
        MajorityClasses = 4;
        
    case 'Page.txt'
        MinorityClasses = [2,3,4,5];
        MajorityClasses = 1;        
end
