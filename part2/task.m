load('../data/example_image.mat');
img3d_object = Image3D(vol,voxdims); % Initialize object

[imh,imw,imd] = size(vol);
x_axis = (0:imh-1) * voxdims(1); % scale x axis according to voxel dimensions
y_axis = (0:imw-1) * voxdims(2); % scale y axis 
z_axis = (0:imd-1) * voxdims(3); % scale z axis 

%% Defining source points
% place source points in the corners
source_pts = [1,1; 1,(x_axis(end)); x_axis(end),y_axis(end); y_axis(end),1];
%  target points slightly shifted
target_pts = [source_pts(1,:)+10; 1,source_pts(2,2)*0.7; source_pts(3,:)*0.8;
    source_pts(4,1)*0.8,5];

%% Generate 10 different randomly transformed images and plot 5 images for each transformed image at different z depths.
% Nothing.
%% Change the strength parameter in random_transform_generator; change the number of control points; and change the Gaussian kernel parameter. Visualise the randomly transformed images.

rand_par = rand(1);
rand_ctr_pts = random_transform_generator(rand_par,ctr_pts);
% Nothing.

%% All that follows just shows my attempts to solve the exercise. It doesn't work, but at least shows I tried.


%% Visualisation of the points
figure; imagesc(x_axis,y_axis,squeeze(im(:,:,15))); axis image; colormap(gray); title('XY plane,15th slice'); 
hold on;
plot(source_pts(:,1),source_pts(:,2),'*'); hold on;
plot(target_pts(:,1),target_pts(:,2),'r*'); hold off;

% pd = ps; % initialise target pts
% pd(5:8,:) = pd(5:8,:) + 15*[1,1;-1,1;1,-1;-1,-1]; % target pts position
%  % dimensions
% r = 0.1*imw; 
% imo = zeros(imh,imw,imc);
% mask = zeros(imh,imw);
%% Using RBF to get alpha
alpha = RBFSpline.fit(source_pts, target_pts); % without lambdas

%% Create nx3 matrix from the image
[X,Y,Z] = meshgrid(y_axis,x_axis,z_axis);
reshaped_im = reshape([X,Y,Z],[],3); % reshape the image to apply the calculations

%% Use function "Evaluate"
transf_im = RBFSpline.evaluate(reshaped_im,target_pts,alpha); % feed the image, target points and spline coefficients to the function
% This should transform the image. Doesn't work at this stage.

%% Drafts
load('\\wsl$\Ubuntu\home\erutkovs\mphy0030-cw-20142848\data\example_image.mat'); % get the test image
im = vol;
%% meshgrid visualisation
[imh,imw,imd] = size(im);
x_axis = (0:imh-1) * voxdims(1); % scale x axis according to voxel dimensions
y_axis = (0:imw-1) * voxdims(2); % scale y axis 
z_axis = (0:imd-1) * voxdims(3); % scale z axis 
[X, Y] = meshgrid(x_axis,y_axis);
figure;
imagesc(X(1,:),Y(:,2),im(:,:,15)); colormap(gray); hold on
% ps = randn(8,2);
% pd = randn(8,2);
% ps = [1,1;imw,1;imw,imh;1,imh;
%       0.4*imw,imh*3/8;
%       0.6*imw,imh*3/8;      
%       0.4*imw,imh*5/8; 
%       0.6*imw,imh*5/8]; % 8 source points
source_pts = [1,1;
                1,(x_axis(end));
                x_axis(end),y_axis(end);
                y_axis(end),1;];
% source_pts = [1,1;imw,1;imw,imh;1,imh;
%        0.4*imw,imh*3/8;
%        0.6*imw,imh*3/8;      
%        0.4*imw,imh*5/8; 
%        0.6*imw,imh*5/8]; 
plot(source_pts(:,1).*voxdims(1),source_pts(:,2).*voxdims(2),'*'); hold off

nump = size(pd,1);
num_center = size(ps,1);
K=zeros(nump,num_center);
%%
source_pts = randn(8,2);
target_pts = randn(8,2);
lambda = randn(8);
sigmas = randn(1,8);
alpha = fit(source_pts,target_pts,lambda,sigmas);
