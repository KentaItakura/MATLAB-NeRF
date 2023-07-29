clear;clc;close all
addpath('img\')
I1 = imread("left.jpg");
I2 = imread("right.jpg");
figure;imshowpair(I1,I2,'montage')
I1_gray = im2gray(I1);
I2_gray = im2gray(I2);
% Find the corners.
points1 = detectSURFFeatures(I1_gray);
points2 = detectSURFFeatures(I2_gray);
% Extract the neighborhood features.
[features1,valid_points1] = extractFeatures(I1_gray,points1);
[features2,valid_points2] = extractFeatures(I2_gray,points2);
% Match the features.
indexPairs = matchFeatures(features1,features2,"MaxRatio",0.4,'Unique',true);
% Retrieve the locations of the corresponding points for each image.
matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);
% Visualize the corresponding points. You can see the effect of translation between the two images despite several erroneous matches.
figure; showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);