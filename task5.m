clc;
clear all;
close all;

lambda=50;
a=0.4;
b=0.04;
m=20;              %number of realizations
s=1;

W=[[0 s];[0 s]];
  
spacing=0.005;
k=40;




for i=1:m
   [M,num_centre]=rBoolRectangles(lambda,a,W,b);
   [Pixel]=digitizeDiscSys(M,W,num_centre,spacing);
   B=Pixel;
   ALXq=estQMinkowskiFcts(B,k,spacing);
end

[LU]=calcEnvelope(lambda,a,W,b,spacing,m,k);
%disp(LU);