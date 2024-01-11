clc;
clear all;
close all;

lambda=6.5696;
a=2.4764;                    %Take from 6_b solution
b=0.0990;                   %Take from 6_b solution
num_real=5;              %number of realizations of model given to be m=39
m=num_real;
%disp(m);
s=10;

W=[[0 s];[0 s]];
  
spacing=0.025;

k=12;                     %Take the same value as used in 6_a and 6_b


%Calling calcEnvelope function
%[LU]=calcEnvelope(lambda,a,W,b,spacing,m,k);
%ALXq_A=[spacing*(0:k).' zeros(k+1,3)];
LU=calcEnvelope(lambda,a,W,b,spacing,m,k);  %Envelope is calculated for 39 realizations.
disp(LU);
[Pixel]=importdata('data_Hiremath.txt');
B=Pixel;
ALXq=estQMinkowskiFcts(B,k,spacing);     %Calculating Minkowski functions using data from 'hiremath.txt'

%ALXq_exact=[spacing*(0:k).' zeros(k+1,3)];
  
%display r;
%if r>=0 
% for i=0:k
%      r=i*spacing;
%      A(i+1)=1-exp(-lambda*(r^2+4*(a+b)*r/pi+(a*b)));
%      L(i+1)=lambda*(4*r+2*(a+b))*exp(-lambda*(r^2+4*(a+b)*r/pi+(a*b)));
%      X(i+1)=(lambda-(lambda^2/(4*pi))*(4*r+2*(a+b))^2)*exp(-lambda*(r^2+4*(a+b)*r/pi+(a*b)));
%      ALXq_exact(i+1,1)=r;
%      ALXq_exact(i+1,2)=A(i+1);
% 	 ALXq_exact(i+1,3)=L(i+1);
% 	 ALXq_exact(i+1,4)=X(i+1);
% end

% for i=1:k+1
     % r=i*spacing;
     % K(i,1)=r;
% end

r=spacing*(0:k).';


%disp(K);
% %end
% %figure('Y','A')
 
figure(1)
plot(r,LU(:,1),'r')    %Plot for A
hold on;
plot(r,LU(:,2),'r') 
hold on;

% %figure('Y','L')
 
figure(2)
plot(r,LU(:,3),'r')    %Plot for L
hold on;
plot(r,LU(:,4),'r')
hold on; 

 % %figure('Y','X')
 
figure(3)
plot(r,LU(:,5),'r')    %Plot for X
hold on;
plot(r,LU(:,6),'r')
hold on;


figure(1)
plot(r,ALXq(:,2),'+')    %Plot for A
hold on;

%figure('Y','L')

figure(2)
plot(r,ALXq(:,3),'+')    %Plot for L
hold on;
%figure('Y','X')

figure(3)
plot(r,ALXq(:,4),'+')    %Plot for X  
hold on;
% 
% r=spacing*(0:k).';
% %plotting the curves envelopes with the curves estimated in a
% figure(1)
% plot(r,LU(:,1),'r');
% hold on;
% plot(r,LU(:,2),'r');
% hold on;
% plot(r,ALXq(:,2),'g');
% hold on
% 
% 
% 
% 
% 
% figure(2)
% plot(r,LU(:,3),'r');
% hold on;
% plot(r,LU(:,4),'r');
% hold on
% plot(r,ALXq(:,3),'g');
% 
% figure(3)
% plot(r,LU(:,5),'r');
% hold on;
% plot(r,LU(:,6),'r');
% hold on
% plot(r,ALXq(:,4),'g');
% 
