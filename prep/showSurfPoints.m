clear;clc;close all
% Read in image.
I = imread('./img/pancake.jpg');
I_gray = im2gray(I);
% Detect SURF features.
points = detectSURFFeatures(I_gray);

% Display location and scale for the 10 strongest points.
strongest = points.selectStrongest(100);
imshow(I); hold on;
plot(strongest);