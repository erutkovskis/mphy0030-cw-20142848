pd = makedist('Normal'); % normal distribution
x = random(pd,[2,10000]);
sigma = cov(x.');
detsigma = det(sigma);
mu = mean(x,2);
%i = 1:size(x,2);
p = [];
for i = 1:size(x,2)
    pcur = (1/(2*pi*sqrt(detsigma)))*exp(-0.5*((x(:,i)-mu).')*(sigma^(-1))*(x(:,i)-mu));
    p = [p,pcur];
end

% [X1, X2] = meshgrid(x);
% figure;
% plot3(X1,X2,p);