function [rgbImages] = ReadImages(fileLocation, filenameArray)
% This function reads in a specified list of images given the filenames and
% the directory the files are located in.
%
% The function takes TWO inputs in the following order:
%   1. "fileLocation": a string containing the name of the directory the
%       images are contained in
%   2. "filenameArray": a 1x1 1D cell array containing n strings where each
%       element is a filename of an image to read
%
% The function returns ONE output:
%   1. a 1xn 1D cell array containing n images, where each element is an
%       RGB image (each RGB image is stored as a 3D array of uint8 values
%       ranging from 0 to 255). The first image will correspond to the
%       first filename from the list of filenames, etc.
%
% Author: Jiaru Lin


% to reduce runtime, pre-allocate "rgbImages" by initialising it before the
% for loop so that it does not change size on every loop.
rgbImages{1,length(filenameArray)} = [];

% use for loop to cycle through each image file and write each image file
% into RGB image (3D array) using imread then enter each RGB image into
% the output cell array.
for i = (1:length(filenameArray))
    
    % locate the "i"th image given the input "fileLocation" and the
    % filename.
    image = [fileLocation, '\', filenameArray{i}];
    
    % get the RGB image 3D array and write it into the output cell array
    % "rgbImages" after making sure it's in the uint8 format.
    rgbImages{i} = uint8(imread(image));
end

end