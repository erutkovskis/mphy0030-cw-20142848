function simple_image_read(FilepathToRead)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% Error checking
if nargin ~= 1
    error('Number of arguments is expected to be 1')
end
if ~ischar(FilepathToRead)
    error('Please enter a valid path')
end

% Implementation
% FilepathToRead = '../../data/image.sim'; % test filepath
FileToRead = fopen(FilepathToRead,'r'); % open test file in r mode
intensity = fread(FileToRead,[224,224*30],'*int16'); % read intensity values into 2D colsx(rows*depth) matrix in int16
intensity = reshape(intensity,[224,224,30]); % reshape 2D matrix into 3D
% voxels = fread(,'*single');
fclose(FileToRead);

end

