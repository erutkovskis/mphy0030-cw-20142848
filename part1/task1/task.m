%% Read/Write workflow
load('../../data/example_image.mat'); % Load example_image with vol and voxdims
FilepathToWrite = '../../data/image.sim'; % Path to image.sim
simple_image_write(FilepathToWrite,vol,voxdims); % Write image intensity values and voxel dimension into the image.sim 
FilepathToRead = FilepathToWrite; % path to the just written file
[intensity,voxdimens] = simple_image_read(FilepathToRead); % Read image.sim and get intensity and voxel dimension values

%% Attempt on scaling and visualization
img_dims = size(intensity); 
x_axis = (0:img_dims(1)-1) * voxdims(1); % scale x axis according to voxel dimensions
y_axis = (0:img_dims(2)-1) * voxdims(2); % scale y axis 
z_axis = (0:img_dims(3)-1) * voxdims(3); % scale z axis 

subplot(2,2,1); % visualise different planes
imagesc(y_axis,z_axis,squeeze(intensity(200,:,:))'); axis image; colormap(gray); title('YZ plane');
subplot(2,2,2);
imagesc(x_axis,z_axis,squeeze(intensity(:,150,:))'); axis image; colormap(gray); title('XZ plane');
subplot(2,2,3);
imagesc(x_axis,y_axis,squeeze(intensity(:,:,15))'); axis image; colormap(gray); title('XY plane,15th slice');
subplot(2,2,4);
imagesc(x_axis,y_axis,squeeze(intensity(:,:,20))'); axis image; colormap(gray); title('XY plane,20th slice');

%% Save visualizations 
Image = getframe(gcf);
imwrite(Image.cdata,'image_sim.jpg');