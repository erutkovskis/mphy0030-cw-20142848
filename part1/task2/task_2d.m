%% PDF calculation
pd = makedist('Normal'); % generate normal distribution
x = random(pd,[2,10000]); % create a set of 10000 x1 and x2 variables, dimensionality of x1 and x2 is [2x1]
sigma = cov(x.'); % covariance matrix, works on 1x2 matrix 10000 times
detsigma = det(sigma); % determinant of covariance matrix
mu = mean(x,2); % mean vector, operates on the variables 2x10000

% The following loop calcualtes PDF for each x1 and x2 
p = [];
for i = 1:size(x,2)
    pcur = (1/(2*pi*sqrt(detsigma)))*exp(-0.5*((x(:,i)-mu).')*(sigma^(-1))*(x(:,i)-mu));
    p = [p,pcur];
end

% figure;scatter3(x(1,:),x(2,:),p,'.') % scatter3 visualization

%% ScatteredInterpolation

x1lin = linspace(min(x(1,:)),max(x(1,:)),100); % linearised space of 100 between min and max of x1 values
x2lin = linspace(min(x(2,:)),max(x(2,:)),100);
[X1,X2] = meshgrid(x1lin,x2lin);
pinterp = scatteredInterpolant(x(1,:).',x(2,:).',p.'); % create scattered interpolant of p
Z = pinterp(X1,X2); % define values of interpolated PDF at X1 and X2

%% Percentiles with my function
pct10 = MyPrctl(p,10);
pct50 = MyPrctl(p,50);
pct90 = MyPrctl(p,90);
% 
% i10 = find(p==pct10); 
% i50 = find(p==pct50);
% i90 = find(p==pct90);
% 
% x10 = x(:,i10);
% x50 = x(:,i50);
% x90 = x(:,i90);


%% Visualization

figure; mesh(X1,X2,Z,'FaceAlpha','0.1'); axis tight; hold on; % interpolated Gaussian

contour3(X1,X2,Z,[pct10 pct50 pct90],'LineWidth',2); hold off; % Percentiles+ellipses 
figure; contour3(X1,X2,Z,[pct10 pct50 pct90],'LineWidth',2); % Percentiles+ellipses 


%% Calculate ellipsis equation and visualize
ellipsis10 = MyEllipsis(mu,sigma,pct10);
ellipsis50 = MyEllipsis(mu,sigma,pct50);
ellipsis90 = MyEllipsis(mu,sigma,pct90);

%% Percentiles with the toolbox function

pct10 = prctile(p,10);
pct50 = prctile(p,50);
pct90 = prctile(p,90);
%% Draw PDF (scatter3) with ellipes
figure;scatter3(x(1,:),x(2,:),p,'.'); hold on;
fimplicit(ellipsis10, 'LineWidth',2); hold on;
fimplicit(ellipsis50, 'LineWidth',2); hold on;
fimplicit(ellipsis90, 'LineWidth',2); hold off;

%% Drafts/trash
% pd = makedist('Normal'); % generate normal distribution
% x = random(pd,[2,10000]); % create a set of 10000 x1 and x2 variables, dimensionality of x1 and x2 is [2x1]
% % x = rand(2,1000);
% sigma = cov(x.'); % covariance matrix, works on 1x2 matrix 10000 times
% detsigma = det(sigma); % determinant of covariance matrix
% mu = mean(x,2); % mean vector, operates on the variables 2x10000
% %i = 1:size(x,2);
% 
% % The following loop calcualtes PDF for each x1 and x2 
% p = [];
% for i = 1:size(x,2)
%     pcur = (1/(2*pi*sqrt(detsigma)))*exp(-0.5*((x(:,i)-mu).')*(sigma^(-1))*(x(:,i)-mu));
%     p = [p,pcur];
% end
% 
% pct10 = prctile(p,10);
% pct50 = prctile(p,50);
% pct90 = prctile(p,90);
% 
% figure;scatter3(x(1,:),x(2,:),p,'.') % scatter3 visualization
% 
% 
% % figure;
% % plot3(X1,X2,p);
% 
% % pvect = (1/(2*pi*sqrt(detsigma)))*exp(-0.5*((x-mu).')*sigma^(-1)*(x-mu));
% % Vectorisation will not work. x should be a meshgrid of x(1,:) and x(2,:),
% % mu and sigma should operate on the meshgrid of [X1,X2] somehow and p
% % should be calculated for the meshgrid. Somehow. Will not work.
% 
% [X1,X2] = meshgrid(x(1,:),x(2,:));
% pinterp = scatteredInterpolant(x(1,:).',x(2,:).',p.'); % create scattered interpolant of p
% Z = pinterp(X1,X2); % define values of interpolated PDF at X1 and X2
% figure; mesh(X1,X2,Z); axis tight; % visualize

%contour(X1,X2,Z,[pct90 pct90]); hold off
%zslice = pct10;
%slice(X1,X2,Z,zslice);
%contour3