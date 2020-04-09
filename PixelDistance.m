function [squaredDistance] = PixelDistance(P,Q)
% This function calculates the square of the distance between two points in
% colour space. Inputs P and Q do NOT have to be the same size but they
% must both have exactly three elements in total (i.e. P can be 3x1 and Q
% can be 1x1x3 and the code will still work as long as both variables each
% have exactly 3 elements.
%
% The function takes TWO inputs in the following order:
%   1. "P": an array containing three elements representing a point in 3D
%       colour space
%   2. "Q": an array containing three elements representing a second point
%       in 3D colour space
%
% The function returns ONE output:
%   1. "squaredDistance": the square of the distance between the two
%       points, "P" and "Q", in 3D colour space
%
% Author: Jiaru Lin


% Convert uint8 values to doubles in order to process square calculations,
% as squares of the differences between P and Q may exceed 255.
P = double(P);
Q = double(Q);

% Find the square of the distance between P and Q
squaredDistance = (P(1)-Q(1))^2+(P(2)-Q(2))^2+(P(3)-Q(3))^2;

end

