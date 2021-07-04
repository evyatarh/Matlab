%% Ex5
clc;
clear;
close all;

load fisheriris;
%creating a tree and classify by the lables
tree = create_tree(concatination(meas,species),20,0.04);