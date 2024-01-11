clc;
clear all;
close all;

%lambda=50;
%a=0.4;
%b=0.04;
%num_real=20;              %number of realizations
%s=10;

%W=[[0 s];[0 s]];
k=12;  
spacing=0.025;
%[Sigma]=deviation(G);
%New=Sigma;
G=fminsearch(@(G)deviation(G),[1,0.5,0.4]);
disp(G);
%disp(fval);%5.8873    2.7810    0.0983    
