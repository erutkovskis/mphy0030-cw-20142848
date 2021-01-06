function pct = MyPrctl(PDF,percentile)
% pct = prcntl(data,percentile)
% Calculates percentile using nearest rank method
% INPUTS:
% data          array of values
% percentile    percentile to be calculated

xSorted = sort(PDF,2); % sort the distribution row-wise (PDF considered to be 1xn)
N = numel(xSorted(1,:)); % number of elements in the PDF
n = round(percentile/100 * N); % Get the nearest ordinal rank
pct = xSorted(n); % get the percentile

end

