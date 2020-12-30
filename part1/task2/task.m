pd = makedist('Normal'); % normal distribution
x = random(pd,[10000,2]);
mu = mean(x);
sigma = cov(x);
detsigma = det(sigma);
p = 1/(2*pi*sqrt(detsigma)).*exp((-0.5*(x-mu).').*sigma.^(-1).*(x-mu));
