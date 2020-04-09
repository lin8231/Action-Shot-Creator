function [medianRed, medianGreen, medianBlue] = MedianPixel(pixelList)
% This function calculates the median RGB values from a list of pixels.
%
% The function takes ONE input:
%   1. "pixelList": a 1xnx3 3D array of RGB values representing a list of
%       pixels, where each pixel is in a different column (pixel 1 will be
%       in column 1, pixel2 in column 2, etc). n can be 1 or a greater
%       number.
%
% The function returns THREE outputs in the following order:
%   1. "medianRed": the median red value, which will be the median of all
%       the R values from the list of pixels "pixelList"
%   2. "medianGreen": the median green value, which will be the median of
%       all the G values from the list of pixels "pixelList"
%   3. "medianBlue": the median blue value, which will be the median of
%       all the B values from the list of pixels "pixelList"
%
% Author: Jiaru Lin


% convert "pixelList" into uint8 format if it is not already.
pixelList = uint8(pixelList);

% Calculate the median values for each colour for the list of pixels.
% Non-integer values are automatically rounded to the nearest integer as
% uint8 values can only be integers.
medianRed = median(pixelList(:,:,1));
medianGreen = median(pixelList(:,:,2));
medianBlue = median(pixelList(:,:,3));

end

