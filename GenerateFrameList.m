function [frameList] = GenerateFrameList(firstFrame, stepSize, numberOfFrames)
% This function generates a list of frames of interest which can
% be used by other functions. In particular, it will be useful for
% determining which frames to extract from a movie file.
%
% The function takes THREE inputs in the following order:
%   1. "firstFrame": this is the starting frame number
%   2. "stepSize": this is the step size, or in other words the interval
%       between the frames we are interested in
%   3. "numberOfFrames": this is the total number of frames to generate (n)
%
% The function returns ONE output:
%   1. "frameList": this is a 1xn 1D array, where n is the desired number
%       of frames (n). The first element of the array will be the starting
%       frame number ("firstFrame") and each subsequent element will have
%       a frame value that is the step size ("stepSize") greater than the
%       last.
%
% Author: Jiaru Lin


% Calculate the the which frame is the last frame of interest given the
% step size and the number of frames that are wanted.
lastFrame = firstFrame+(stepSize.*(numberOfFrames-1));

% Function output which generates a 1D array that begins with the first
% frame (of interest), ends with the last frame (of interest), with an
% interval of the specified step size.
frameList = firstFrame:stepSize:lastFrame;

end

