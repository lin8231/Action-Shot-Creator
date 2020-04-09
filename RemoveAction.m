function [actionRemoved] = RemoveAction(rgbImages)
% This function creates an image that has the action removed by applying a
% median filter (i.e. each pixel in the new image is obtained by taking the
% median RGB values of the stack of corresponding pixels taken from the
% source images).
%
% The function takes ONE input:
%   1. "rgbImages": a 1xn 1D cell array containing n images, where each
%       element is an RGB image (each RGB images is stored as a 3D array of
%       uint8 values ranging from 0 to 255).
%
% The function returns ONE output:
%   1. "actionRemoved": an RGB image (stored as a 3D array of uint8 values
%       ranging from 0 to 255) that was obtained by taking the median RGB
%       values of the stack of corresponding pixels from the source images.
%
% Author: Jiaru Lin


% The following line of code executes the following commands in the
% following order:
%   1. Using the "cat" function, turn "rgbImages" from a 1xn 1D cell array
%       where each cell is a 3D array into a 4D array where the 4th
%       dimension represents the different images in "rgbImages" (i.e. size
%       of the 4D array in the 4th dimension is the same as the length of
%       the original 1D cell array).
%   2. Using the "median" function, calculate the median values of the new
%       4D images array along the 4th dimension. It returns a 3D array with
%       values that are the medians of all the images in the multi-image
%       array. This 3D array is written into the output variable
%       "actionRemoved".
actionRemoved(:,:,:) = median(cat(4, rgbImages{:}), 4);

end