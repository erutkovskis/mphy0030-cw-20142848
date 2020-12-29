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
%% Plot 10th slice in "z dimension"
figure; slice(double(intensity),[],10,[]);
%% Plot 10th slice in "x dimension"
%figure; imshow(uint8(reshape(intensity(10,:,:),[224,224])));
%% Plot 10th slice in "y dimension"
%figure; imshow(uint8(reshape(intensity(:,10,:),[224,224])));