% positional encoding in NeRF
% This function is performed in the following paper. 
% NeRF: Representing Scenes as Neural Radiance Fields for View Synthesis

clear;clc;close all
% parameter
L = 10;
% xyz
p1 = [1 2 3]';

freq_bands = reshape(repelem(2.^(0:(L-1)),1,size(p1,1)),size(p1,1),1,[]);
emb_period = [sin(freq_bands.*repmat(p1,[1,1,L]));cos(freq_bands.*repmat(p1,[1,1,L]))];
emb_period = reshape(permute((emb_period),[1,3,2]),[],size(p1,2))';

freqBands = p1 .* repmat(2.^[0:L-1], [3, 1]); 
% sin=>x, y, z *10 = 30
sin1 = sin(freqBands);
% cos=>x, y, z *10 = 30
cos1 = cos(freqBands);
% combine both sin and cos
embed = [sin1(:); cos1(:)]