function [filenameArray] = GenerateImageList(fileLocation, fileExtension)
% This function fetches a list of the names of all the images with a
% particular file extension that are contained in a specified directory.
%
% The function takes TWO inputs in the following order:
%   1. "fileLocation": a string containing the name of the directory the
%       images are contained in
%   2. "fileExtension": a string containing the file extension of the
%   images to fetch.
%
% The function returns ONE output:
%   1. "filenameArray": a 1xn 1D cell array containing n strings where each
%   element is the filename of an image from the specified directory that
%   has a particular file extension.
%
% Author: Jiaru Lin


% Change directory to the file location of the images.
cd(fileLocation);

% Find the relevant files by using "dir" to list only the files with the
% specified file extension.
% Page referenced: https://au.mathworks.com/help/matlab/ref/dir.html
fileRelevant = dir(['**/*.', fileExtension]);

% Find how many relevant files there are in total
fileCount = size(fileRelevant, 1);

% to reduce runtime, pre-allocate "filenameArray" by initialising it before
% the for loop so that it does not change size on every loop.
filenameArray{1, fileCount} = [];

% Use for loop to cycle through each file for the number of relevant files.
for i= 1:fileCount
    
    % For each of the "i"th file, extract the "name" field from the
    % structure array "fileRelevant" (which has many fields) as we are only
    % interested in the name of the files. Then save the file names to
    % their corresponding positions in the cell array "filenameArray".
    % Pages referenced: https://au.mathworks.com/help/matlab/ref/getfield.html
    % https://au.mathworks.com/matlabcentral/answers/224692-how-to-dynamic-field-references-in-place-of-setfield-and-getfield
    filenameArray{i} = fileRelevant(i).('name');
    
end

end

