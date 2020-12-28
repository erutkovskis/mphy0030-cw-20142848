function temp = simple_image_read(filepath)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% Error checking
if nargin ~= 1
    error('Number of arguments is expected to be 1')
end
if ~ischar(filepath)
    error('Please enter a valid path')
end

% Test filepath

% Implementation

fid = fopen(filepath);
temp = fread(fid);

fclose(fid);
end

