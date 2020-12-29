load('../../data/example_image.mat');
%%
FilepathToWrite = '../../data/image.sim';
%%
simple_image_write(FilepathToWrite);
%%
FilepathToRead = FilepathToWrite;
%%
simple_image_read(FilepathToRead);