function [distantRed, distantGreen, distantBlue] = MostDistantPixel(pixelList)
% This function calculates the pixel from a list that is most distant from
% the median RGB values of that list. The distance metric used is the
% squared distance between points in the RGB colour space.
%
% The function takes ONE input:
%   1. "pixelList": a 1xnx3 3D array of RGB values representing a list of
%       pixels (pixel 1 will be in column 1, pixel 2 in column 2, etc). n
%       can be 1 or a greater number.
%
% The function returns THREE outputs in the following order:
%   1. "distantRed": the R value of the most distant pixel
%   2. "distantGreen": the G value of the most distant pixel
%   3. "distantBlue": the B value of the most distant pixel
%
% Author: Jiaru Lin


% use the "MedianPixel" function to calculate the median set of RGB values
% from the given list of pixels "pixelList", and set it to be "P"
P(1:3) = MedianPixel(pixelList);

% "distanceArray" is a 1xn array (where n is the number of pixels to
% process) where each element corresponds to the squared distance between
% each pixel and the median pixel. To avoid "distanceArray" changing size
% every loop in the for loop below, pre-allocate "distanceArray" by
% initialising it to zero. This reduces runtime.
distanceArray = zeros(1,size(pixelList,2));

% cycle through the "pixelList" array from 1 to n where n is the number of
% pixels in the array. Each column contains the RGB values of a pixel.
for i = (1:size(pixelList,2))
    
    % set "Q" to be the RGB values of "i"th pixel in the "pixelList" array.
    Q = pixelList(:,i,:);
    
    % use the "PixelDistance" function to calculate the squared distance
    % between points P and Q, then write this value into the "i"th element
    % of "distanceArray". Each
    distanceArray(i) = PixelDistance(P, Q);
    
end

% use the "max" function to find the index, "indexMax", of the pixel that
% is the most distant from the median pixel. Discard the actual value of
% the maximum squared distance using "~" as it is reduntant for the
% purposes of this function.
[~, indexMax] = max(distanceArray);

% set the value of the output "distantRed" to be the R value of the most
% distant pixel
distantRed = pixelList(:,indexMax,1);
% set the value of the output "distantGreen" to be the G value of the most
% distant pixel
distantGreen = pixelList(:,indexMax,2);
% set the value of the output "distantBlue" to be the B value of the most
% distant pixel
distantBlue = pixelList(:,indexMax,3);

end


