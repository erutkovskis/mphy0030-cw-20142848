function p = gaussian_pdf(x,mu,sigma)
% p = gaussian_pdf(x,mu,sigma)
%
% This function calculates Gaussian probability distribution function.
% Inputs:
%   x           samples, expected [nx3]
%   mu          mean vector calculated from x
%   sigma       covariance matrix, calculated from x
% Outputs:
%   p           PDF

detsigma = det(sigma); % determinant of covariance matrix
xtr = x.'; % transpose x for the PDF function
mutr = mu.';

% The following loop calcualtes PDF for each x1,x2 and x3 according to
% multivatiate Gaussian function
p = [];
for i = 1:size(xtr,2)
    pcur = (1/(2*(pi^1.5)*sqrt(detsigma)))*exp(-0.5*(((xtr(:,i))-mutr).')*(sigma^(-1))*(xtr(:,i)-mutr));
    p = [p,pcur];
end


end

