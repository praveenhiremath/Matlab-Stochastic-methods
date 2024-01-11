clc;
clear;

lambda=50;
a=0.4;
b=0.04;
num_real=20;              %number of realizations
s=2;

W=[[0 s];[0 s]];
  
spacing=0.005;

k=40;


ALXq_avg=zeros(k+1,4);
for i=1:num_real
   [M,num_centre]=rBoolRectangles(lambda,a,W,b);
   [Pixel]=digitizeDiscSys(M,W,num_centre,spacing);
   B=Pixel;
   ALXq=estQMinkowskiFcts(B,k,spacing);
   ALXq_avg=ALXq_avg+ALXq;
   %figure('Y','A')
   hold on
   figure(1)
   plot(ALXq(:,1),ALXq(:,2),'r')    %Plot for A
   %hold all
   %figure('Y','L')
   hold on
   figure(2)
   plot(ALXq(:,1),ALXq(:,3),'r')    %Plot for L
   %hold all
   %figure('Y','X')
   hold on
   figure(3)
   plot(ALXq(:,1),ALXq(:,4),'r')    %Plot for X
   %hold all
   
end

ALXq_avg=ALXq_avg/20;     %For average value
%figure('Y','A')
hold on
figure(1)
plot(ALXq_avg(:,1),ALXq_avg(:,2),'*')    %Plot for A
%hold all
%figure('Y','L')
hold on
figure(2)
plot(ALXq_avg(:,1),ALXq_avg(:,3),'*')    %Plot for L
%hold all
%figure('Y','X')
hold on
figure(3)
plot(ALXq_avg(:,1),ALXq_avg(:,4),'*')    %Plot for X
%hold all

%For exact solutions
ALXq_exact=[spacing*(0:k).' zeros(k+1,3)];
  
%display r;
%if r>=0 
for i=1:k+1
     r=i*spacing;
     A(i)=1-exp(-lambda*(r^2+4*(a+b)*r/pi+(a*b)));
     L(i)=lambda*(4*r+2*(a+b))*exp(-lambda*(r^2+4*(a+b)*r/pi+(a*b)));
     X(i)=(lambda-(lambda^2/(4*pi))*(4*r+2*(a+b))^2)*exp(-lambda*(r^2+4*(a+b)*r/pi+(a*b)));
     ALXq_exact(i,1)=r;
     ALXq_exact(i,2)=A(i);
	 ALXq_exact(i,3)=L(i);
	 ALXq_exact(i,4)=X(i);
end
%end
%figure('Y','A')
hold on
figure(1)
plot(ALXq_exact(:,1),ALXq_exact(:,2),'+')    %Plot for A
%hold all
%figure('Y','L')
hold on
figure(2)
plot(ALXq_exact(:,1),ALXq_exact(:,3),'+')    %Plot for L
%hold all
%figure('Y','X')
hold on
figure(3)
plot(ALXq_exact(:,1),ALXq_exact(:,4),'+')    %Plot for X
%hold all


display(ALXq_exact);