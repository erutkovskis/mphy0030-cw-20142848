pd = makedist('Normal'); % generate normal distribution
x = random(pd,[2,1000]); % create a set of 10000 x1 and x2 variables, dimensionality of x1 and x2 is [2x1]
sigma = cov(x.'); % covariance matrix, works on 1x2 matrix 10000 times
detsigma = det(sigma); % determinant of covariance matrix
mu = mean(x,2); % mean vector, operates on the variables 2x10000
%i = 1:size(x,2);

% The following loop calcualtes PDF for each x1 and x2 
p = [];
for i = 1:size(x,2)
    pcur = (1/(2*pi*sqrt(detsigma)))*exp(-0.5*((x(:,i)-mu).')*(sigma^(-1))*(x(:,i)-mu));
    p = [p,pcur];
end

pct10 = prctile(p,10);
pct50 = prctile(p,50);
pct90 = prctile(p,90);

figure;scatter3(x(1,:),x(2,:),p,'.') % scatter3 visualization


% [X1, X2] = meshgrid(x);
% figure;
% plot3(X1,X2,p);

% pvect = (1/(2*pi*sqrt(detsigma)))*exp(-0.5*((x-mu).')*sigma^(-1)*(x-mu));
% % vectorised form - doesn't work yet, produces p for each 10000 x1 and x2
% resultin in 10000x10000 matrix. Incorrect.
