%% Load example_image with vol and voxdims
load('../../data/example_image.mat');
%% Path to image.sim
FilepathToWrite = '../../data/image.sim';
%% Write image intensity values and voxel dimension into the image.sim
simple_image_write(FilepathToWrite,vol,voxdims);
%% 
FilepathToRead = FilepathToWrite;
%% Read image.sim and get intensity and voxel dimension values
[intensity,voxdimens] = simple_image_read(FilepathToRead);

%% Attempt on scaling and visualization
img_dims = size(intensity);
x_axis = (0:img_dims(1)-1) * voxdims(1);
y_axis = (0:img_dims(2)-1) * voxdims(2);
z_axis = (0:img_dims(3)-1) * voxdims(3);

subplot(3,1,1);
imagesc(y_axis,z_axis,squeeze(intensity(200,:,:))'); axis image; colormap(gray); title('YZ plane,200th slice');
subplot(3,1,2);
imagesc(x_axis,z_axis,squeeze(intensity(:,150,:))'); axis image; colormap(gray); title('XZ plane,150th slice');
subplot(3,1,3);
imagesc(x_axis,y_axis,squeeze(intensity(:,:,15))'); axis image; colormap(gray); title('XY plane,15th slice');