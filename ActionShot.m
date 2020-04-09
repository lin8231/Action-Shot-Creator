function actionImage = ActionShot(rgbImages)
% This function creates an action shot image by finding the pixels from a
% stack of images that are most distant from the median RGB values. Each
% pixel in the new image is obtained by finding the pixel in the same row
% and column of the source images that is most distant from the median RGB
% values of the stack of corresponding pixels.
%
% The function takes ONE input:
%   1. "rgbImages": a 1xn 1D cell array containing n images, where each
%       element is an RGB image (each RGB images is stored as a 3D array of
%       uint8 values ranging from 0 to 255). It is assumed that all images
%       have the same dimensions.
%
% The function returns ONE output:
%   1. "actionImage": an action shot in the form of an RGB image (stored as
%       a 3D array of uint8 values ranging from 0 to 255).
%
% Author: Jiaru Lin


% Using the "cat" function, turn "rgbImages" from a 1xn 1D cell array where
% each cell is a 3D array into a 4D array where the 4th dimensino
% represents the different images in "rgbImages" (i.e. size of the 4D array
% in the 4th dimension is the same as the length of the original 1D cell
% array).
rgbImages4D = cat(4, rgbImages{:});

% This line of code returns the action removed image of the stack of
% images in the form of a 3D array with values that are the medians of all
% the images in the original multi-image array. This 3D array is written
% into the output variable "medianPixels". Although this line of code
% serves the same purpose as the "RemoveAction" function, it is faster to
% directly calculate the median image in this function rather than call
% the "RemoveAction" function.
medianPixels(:,:,:) = median(rgbImages4D, 4);


% Find maximums along the 4th dimension direction. ignore the first output
% which is the actual max values. only index
% The following code executes the following commands in the following
% order:
%   1. Convert "rgbImages4D" and "medianPixels" into doubles for distance
%       calculation.
%   2. Find the squares of the differences between components of the stack
%       of images and the median image. (i.e. find the squares of the
%       differences bewteen each colour value of each pixel in
%       "medianPixels" and each colour value of each pixel for all images
%       in "rgbImages4D".
%   3. Sum values of the new 4D array with component square differences
%       along the 3rd dimension. This sums the component square differences
%       and gives the overall squared difference between the RGB values of
%       each pixel on each image and the median image.
%   4. Using the "max" function, index which image in the stack is the most
%       distant from the median for each pixel. Discard the actual values
%       of the maximum distances as these values are redundant. Save the
%       index under the "indexMax".
% "indexMax" is a 2D array with the same number of rows and columns as the
% images to process. Each element of "indexMax" ranges from 1 to n (where n
% is the number of images in the stack) and indexes which of the images to
% keep for the pixel in the position of the index number.
[~, indexMax] = max(sum(((double(rgbImages4D)-double(medianPixels)).^2), 3), [], 4);

% Convert "indexMax" back to uint8. This shoudn't have any visible effect
% on the values assuming the number of images to process in a single set
% is <=255.
indexMax = uint8(indexMax);


% Create grids that index the position number of each element in a RGB
% image. This produces 3 sets of grids, "gridRows", "gridCols",
% "gridLayers".
% For instance, "gridRows" has the same number of rows as the number of
% rows in "rgbImages4D", and all elements in each row is the row number of
% that row. This is the same for "gridCols" and "gridLayers". Grid in the
% layers direction should always be 3, as RGB images are always composed of
% three colour values.
[gridRows, gridCols, gridLayers] = ndgrid(1:size(rgbImages4D,1), 1:size(rgbImages4D, 2),1:size(rgbImages4D, 3));

% The index for the 4th dimension is the same accross all three layers for
% each pixel on the image, so create a 3D array using "cat" (in order to be
% dimensionally consistent for sub2ind) with the same 2D index for 3 layers
indexMax4D = cat(3, indexMax, indexMax, indexMax);

% Convert subscripts to indices so the array can be put into rgbImages4D to
% extract the max distance pixels to create the action shot
% Page referenced: https://au.mathworks.com/help/matlab/ref/sub2ind.html
indexFinal = sub2ind(size(rgbImages4D), gridRows, gridCols, gridLayers, indexMax4D);


% Extract specific elements of "rgbImages4D" (which is comprised of the
% whole set of images) using the indices saved in "indexFinal" to create an
% image where each pixel is the pixel in that position with the RGB value
% RGB value that is the most distant from the median pixel in that
% position.
actionImage = rgbImages4D(indexFinal);

end

