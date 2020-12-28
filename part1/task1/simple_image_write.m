function [] = simple_image_write(filename)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

FilepathToRead = '../../data/example_image.mat';
FilepathToWrite = '../../data/image.sim';
FileToRead = fopen(FilepathToRead,'r');
FileToWrite = fopen(FilepathToWrite,'w');
fwrite(FileToWrite,vol);
fclose(FileToWrite);
end

