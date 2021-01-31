% PDF calculation
pd = makedist('Normal'); % generate normal distribution
x = random(pd,[10000,3]); % create a set of 10000 x1,x2 and x3 variables, dimensionality of x1 and x2 is [2x1]
sigma = cov(x); % covariance matrix, works on 10000x3 matrix
detsigma = det(sigma); % determinant of covariance matrix
mu = mean(x); % mean vector, operates on the variables 3x10000
xtr = x.'; % transpose x for the PDF function
mutr = mu.'; % transpose mean calculation accordingly
% The following loop calcualtes PDF for each x1,x2 and x3 according to
% multivatiate Gaussian function
p = [];
for i = 1:size(xtr,2)
    pcur = (1/(2*(pi^1.5)*sqrt(detsigma)))*exp(-0.5*(((xtr(:,i))-mutr).')*(sigma^(-1))*(xtr(:,i)-mutr));
    p = [p,pcur];
end

% figure;scatter3(x(1,:),x(2,:),p,'.') % scatter3 visualization

%% Generate  samples, calculate Gaussian PDF
x = randn(10000,3); % create a set of 10000 x1,x2 and x3 variables
sigma = cov(x); % covariance matrix, works on 10000x3 matrix
mu = mean(x); % mean vector, operates on the variables 3x10000
p = gaussian_pdf(x,mu,sigma);   

%% Percentiles calculation

pct10 = MyPrctl(p,10); % Calculate the percentiles. Based on nearest rank method.
pct50 = MyPrctl(p,50);
pct90 = MyPrctl(p,90);

%% PDF crossection - ellipsoids
% Since the crossection of the PDF is ellipsoid, I will need to find range
% of points within each percentile out of which I will create a surface.
% First, let's find indeces corresponding to points around each percentile:
i10 = find(p < (pct10 + 0.001) & p > (pct10 - 0.001)); % find indices corresponding to the percentile within small range (+-0.001) around the percentile. Indices correspond to the iteration number.
i50 = find(p < (pct50 + 0.001) & p > (pct50 - 0.001));
i90 = find(p < (pct90 + 0.001) & p > (pct90 - 0.001));

% Find the points:
x10 = x(i10,:); % find x1,x2,x3 values corresponding to the iteration
x50 = x(i50,:);
x90 = x(i90,:);
%% Visualisation

DT10 = delaunay(x10(:,1),x10(:,2),x10(:,3)); % create Delanay triangulation matrix from X10 points (3D crossection for the 10th percentile)
DT50 = delaunay(x50(:,1),x50(:,2),x50(:,3)); % create Delanay triangulation matrix from X50 points (3D crossection for the 50th percentile)
DT90 = delaunay(x90(:,1),x90(:,2),x90(:,3)); % create Delanay triangulation matrix from X10 points (3D crossection for the 90th percentile)
% figure; trisurf(DT10,x10(:,1),x10(:,2),x10(:,3)); % Visualize using trisurf in separate windows
% figure; trisurf(DT50,x50(:,1),x50(:,2),x50(:,3)); 
% figure; trisurf(DT90,x90(:,1),x90(:,2),x90(:,3)); 
% figure; trisurf(DT10,x10(:,1),x10(:,2),x10(:,3), 'FaceAlpha',0.9); hold on;
% trisurf(DT50,x50(:,1),x50(:,2),x50(:,3),'FaceAlpha',0.9); hold on;
% trisurf(DT90,x90(:,1),x90(:,2),x90(:,3),'FaceAlpha',0.9); hold off;
subplot(1,3,1);
trisurf(DT10,x10(:,1),x10(:,2),x10(:,3)); title('10th percentile PDF ellipsoid');
subplot(1,3,2);
trisurf(DT50,x50(:,1),x50(:,2),x50(:,3)); title('50th percentile PDF ellipsoid');
subplot(1,3,3);
trisurf(DT90,x90(:,1),x90(:,2),x90(:,3)); title('90th percentile PDF ellipsoid');