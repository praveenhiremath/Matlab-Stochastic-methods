clc;
clear;

lambda=200;
%disc_radius = 0.2854;
a=0.2;
b=0.02;
W = [[0 1];[0 1]];
spacing=0.01;
%spacing1=0.001;
num_real=2;

for i=1:num_real
[M,num_centre] = rBoolRectangles(lambda,a,W,b);
display(M);
[Pixel] = digitizeDiscSys(M,W,num_centre,spacing);
%colormap default
%image(Pixel);
 if(i==1)
   [C1]=[Pixel];
   colormap([0 0 0;1 1 1]);
   figure(1)
   image(C1.*400);
 end
 
 if(i==2)
   [C2]=[Pixel];
   colormap([0 0 0;1 1 1]);
   figure(2)
   image(C2.*400);
 end

end
