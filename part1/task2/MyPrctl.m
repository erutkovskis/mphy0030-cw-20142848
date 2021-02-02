function pct = MyPrctl(PDF,percentile)
% pct = MyPrctl(PDF,percentile)
% 
% Calculates percentile using nearest rank method.
% INPUTS:
%   PDF             PDF values
%   percentile      percentile to be calculated
% Outputs:
%   pct             PDF values corresponding to the percentile

xSorted = sort(PDF,2); % sort the distribution row-wise (PDF considered to be 1xn)
N = numel(xSorted(1,:)); % number of elements in the PDF
n = round(percentile/100 * N); % Get the nearest ordinal rank
pct = xSorted(n); % get the percentile

end

