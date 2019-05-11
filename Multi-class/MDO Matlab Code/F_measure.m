function out = F_measure(precision,recall,ro)

if(precision == 0 || recall ==0)
    out = 0;
else
    out = (2*precision*recall) / (precision+recall);
end

