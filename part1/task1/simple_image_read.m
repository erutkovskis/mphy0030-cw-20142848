function [intensity, voxels] = simple_image_read(FilepathToRead)
% [intensity, voxels] = simple_image_read(FilepathToRead)
% 
% This function reads an image in the binary format from the storage
% Inputs
%   FilepathToRead      character array containing path to the binary image
%                       file
% Outputs
%   intensity           Intensity array written on the disk
%   voxels              Voxel dimenstions written on the disk


% Error checking
if nargin ~= 1
    error('Number of arguments is expected to be 1')
end
if ~ischar(FilepathToRead)
    error('Please enter a valid path')
end

FileToRead = fopen(FilepathToRead,'r'); % open test file in r mode
ImgSize = fread(FileToRead,[1,3]); % Read the header containing image size
intensity = fread(FileToRead,[ImgSize(1),ImgSize(2)*ImgSize(3)],'*int16'); % read intensity values into 2D colsx(rows*depth) matrix in int16
intensity = reshape(intensity,[ImgSize(1),ImgSize(2),ImgSize(3)]); % reshape 2D matrix into 3D
voxels = fread(FileToRead,[1,3],'*single');

fclose(FileToRead);

end

