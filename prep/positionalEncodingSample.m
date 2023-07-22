clear;clc;close all

L = 10;
p1 = [1 2 3]';


% freq_bands = reshape(repelem(2.^(0:(L-1)),1,size(p,1)),size(p,1),1,[]);
% emb_period = [sin(freq_bands.*repmat(p,[1,1,L]));cos(freq_bands.*repmat(p,[1,1,L]))]; %n-60
% emb_period = reshape(permute(stripdims(emb_period),[1,3,2]),[],size(p,2))';

freq_bands = reshape(repelem(2.^(0:(L-1)),1,size(p1,1)),size(p1,1),1,[]);
emb_period = [sin(freq_bands.*repmat(p1,[1,1,L]));cos(freq_bands.*repmat(p1,[1,1,L]))];
emb_period = reshape(permute((emb_period),[1,3,2]),[],size(p1,2))';

freqBands = p1 .* repmat(2.^[0:L-1], [3, 1]); 
% sin=>x, y, z *10 = 30
sin1 = sin(freqBands);
% cos=>x, y, z *10 = 30
cos1 = cos(freqBands);

embed = [sin1(:); cos1(:)]