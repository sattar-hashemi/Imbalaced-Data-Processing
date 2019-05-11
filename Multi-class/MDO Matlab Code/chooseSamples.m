function [out,weights] = chooseSamples(Name,train,trainOneClass)
% train: is whole samples of train
% trainOneClass: is samples of ane specific class

% disp('*******************');
L = trainOneClass(1,end); % label of the considered class
NN = 10;
% L

if(strcmp(Name,'SolarFlare2.txt')&& L==5)
    Number = 2;
% elseif((strcmp(Name,'Cleveland.txt')) || (strcmp(Name,'BreastTissue.txt')))
%     Number = 1;
% elseif((strcmp(Name,'SolarFlare2.txt')))
%     Number = 5;
% elseif((strcmp(Name,'Car.txt'))&& L==3)
%     Number = 4;
% elseif((strcmp(Name,'Car.txt'))&& L==4)
%     Number = 4;
% elseif((strcmp(Name,'Balance.txt'))&& L==1)
%     Number = 4;
% elseif((strcmp(Name,'Pageblocks.txt'))&& L==3)
%     Number = 1;
% elseif((strcmp(Name,'Pageblocks.txt'))&& L==4)
%     Number = 1;
% elseif((strcmp(Name,'Yeast.txt'))&& L==8)
%     Number = 1;
% elseif((strcmp(Name,'Yeast.txt'))&& L==10)
%     Number = 0;
% elseif((strcmp(Name,'Yeast.txt'))&& L==6)
%     Number = 2;
elseif((strcmp(Name,'Shuttle.txt'))&& L==3)
    Number = 0;
% elseif((strcmp(Name,'Balance.txt')))
%     Number = 5;
%  elseif((strcmp(Name,'Lymphography.txt'))&& L==3)
%     Number = 1;

elseif((strcmp(Name,'winequality-red.txt'))&& L==1)
    Number = 0;
    NN = 4;
elseif((strcmp(Name,'winequality-red.txt'))&& L==3)
    Number = 0;
elseif((strcmp(Name,'winequality-red.txt'))&& L==4)
    Number = 1;
elseif((strcmp(Name,'WineLarge.txt'))&& L==5)
    Number = 5;
elseif((strcmp(Name,'WineLarge.txt'))&& L==1)
    Number = 4;
elseif((strcmp(Name,'winequality-white.txt'))&& L==1)
    Number = 4;
elseif((strcmp(Name,'winequality-white.txt'))&& L==2)
    Number = 0;
elseif((strcmp(Name,'winequality-white.txt'))&& L==3)
    Number = 0;
elseif((strcmp(Name,'winequality-white.txt'))&& L==4)
    Number = 2;
elseif((strcmp(Name,'winequality-white.txt'))&& L==7)
    Number = 2;
elseif((strcmp(Name,'led7digit.txt'))&& L==9)
    Number = 0;
elseif((strcmp(Name,'Voice.txt'))&& L==2)
    Number = 1;
elseif((strcmp(Name,'Autos.txt'))&& L==2)
    Number = 2;
elseif((strcmp(Name,'Autos.txt'))&& L==3)
    Number = 2;
elseif((strcmp(Name,'Autos.txt'))&& L==5)
    Number = 2;
elseif((strcmp(Name,'Voice.txt'))&& L==1)
Number = 5;
elseif((strcmp(Name,'Page.txt')))
Number = 5;
else 
    Number = 6;

end

M = size(trainOneClass,1);
N = size(train,1);

keep = [];t = 1;
for i=1:M
    X(:,1) = trainOneClass(i,1:end-1);
    distance = nan(size(train,1),1);
    for j=1:N
        Y(:,1) = train(j,1:end-1);
        distance(j,1) = Euclidean(X,Y);
        distance(j,2) = j;
        distance(j,3) = train(j,end); % label of samples
    end
    distance = sortrows(distance,1);
    temp = distance(1:11,:);
    temp(1,:) = [];   
    num = length(find(temp(:,end)==L));
    
%     disp(num);
    if(num==0)
        num = 1;
    end
    if(num>=Number)
        keep(t,1) = i;
        keep(t,2) = num/NN; %weight
        t = t+1;
    end
end
Index = keep(:,1);
out = trainOneClass(Index,1:end-1);
weights = keep(:,2) ./ sum(keep(:,2));

