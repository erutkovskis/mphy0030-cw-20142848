function simple_image_write(FilepathToWrite)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% Error checking
if nargin ~= 1
    error('Number of arguments is expected to be 1')
end
if ~ischar(FilepathToWrite)
    error('Please enter a valid path')
end

%Implementation
% FilepathToWrite = '../../data/image.sim'; % file path to write in
FileToWrite = fopen(FilepathToWrite,'w'); % open, get file ID, create the file if non-existent
fwrite(FileToWrite,vol,'int16'); % write intensity values as int16
%fwrite(FileToWrite,voxdims,'single'); % write voxel dimensions as float32
fclose(FileToWrite);

end

