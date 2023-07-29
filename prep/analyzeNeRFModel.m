clear;clc;close all
addpath('model\')
net = importKerasLayers('my_model.h5','OutputLayerType','regression');
analyzeNetwork(net)