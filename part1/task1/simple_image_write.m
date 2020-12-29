function simple_image_write(FilepathToWrite,IntensityVals,VoxDims)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% Error checking
if nargin ~= 3
    error('Number of arguments is expected to be 3')
end
if ~ischar(FilepathToWrite)
    error('Please enter a valid path')
end

%Implementation
[ImgY,ImgX,ImgZ] = size(IntensityVals); % get image dimensions
FileToWrite = fopen(FilepathToWrite,'w'); % open, get file ID, create the file if non-existent
fwrite(FileToWrite,[ImgY,ImgX,ImgZ]); % write image dimensions
fwrite(FileToWrite,IntensityVals,'int16'); % write intensity values as int16
fwrite(FileToWrite,VoxDims,'single'); % write voxel dimensions as float32

fclose(FileToWrite);

end

