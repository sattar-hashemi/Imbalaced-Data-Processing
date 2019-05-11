function NEW_Samples = MDO_Oversampling(Samples,oversampleRate)
% We oversample here for just one class
% Samples is an structure of the original array structure
     
fNum = Samples(1).numFeatures;
coefficients = [Samples.coef]; % Vs: ((x1^2)/alpha*V1)+((x2^2)/alpha*V1)+((x3^2)/alpha*V1)+... = 1
for i=1:length(coefficients)
    if(coefficients(i)<=1e-5)
        coefficients(i) = 0;
    end
end
index = find(coefficients);
samples = Samples.transformed; % A matrix of samples
formatSpec = '(%f/(%f*x))';
equation = '%s+';
endEquation = '%s';
itr = 1;
Weights = Samples(1).weights;
randomNumbers = randsample([1:size(samples,1)],oversampleRate,'true',Weights);
% randomNumbers = randi(size(samples,1),[1,oversampleRate]);
while(itr <= oversampleRate)
    temp = '1=';
    ind = randomNumbers(itr);
    considerSample = samples(ind,:);
    considerSample = considerSample.^2;  % [x1^2,x2^2,x3^2,...];
    for j=1:length(index)
        str = sprintf(formatSpec,considerSample(index(j)),coefficients(index(j)));
        if j~=length(index)
            temp = [temp,sprintf(equation,str)];
        else
            temp = [temp,sprintf(endEquation,str)];
        end
    end
    syms x
    alpha = double(solve(char(temp)));
    tempCoeff = alpha.*coefficients(index);
    S = 0;  
    newSample = zeros(fNum,1);
    terminate = 1;
    while(terminate)
        S = 0;
        for k=1:length(index)-1    % For all non zero coefficients
            aplhaV = (tempCoeff(k)); 
            a = (-sqrt(aplhaV));
            b = (sqrt(aplhaV));
            r = a + (b-a).*rand(1,1);
            newSample(index(k)) = r;
            S = S + ((r^2)/aplhaV);     
        end
        if(S<=1)
          terminate = 0;
        end
    end 
        
    % Constructing the equation to calculate the last value of the newSample
    temp = '1=';
    aplhaVEnd = tempCoeff(end); %% Min
    equation2 = '%f+((x)/(%f))';
    lastEqu = [temp,sprintf(equation2,S,aplhaVEnd)];
%     temp
%     equation2
%     S
%     aplhaVEnd
%     lastEqu
    lastFeaVal = (solve(char(lastEqu)));
    lastFeaVal = double(lastFeaVal);
    newSampleTemp = sqrt(lastFeaVal);
    inde = randi(2);
    if(inde==1)  
        newSample(end) = newSampleTemp;
    else
        newSample(end) = -newSampleTemp;
    end
    NEW_Samples(itr,:) = newSample;
    itr = itr + 1;
%     itr
end
end

