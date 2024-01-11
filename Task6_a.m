clc;
clear;

lambda=50;
a=0.4;
b=0.04;
num_real=20;              %number of realizations
s=10;

W=[[0 s];[0 s]];
  
spacing=0.025;

k=12;
%ALXq_A=zeros(k+1,4);

[Pixel]=importdata('data_Hiremath.txt');
%for i=1:k+1
  %r=i*spacing;
B=Pixel;
ALXq_A=estQMinkowskiFcts(B,k,spacing);
hold on
figure(1)
plot(ALXq_A(:,1),ALXq_A(:,2),'r')    %Plot for A
%hold all
%figure('Y','L')
hold on
figure(2)
plot(ALXq_A(:,1),ALXq_A(:,3),'r')    %Plot for L
%hold all
%figure('Y','X')
hold on
figure(3)
plot(ALXq_A(:,1),ALXq_A(:,4),'r')    %Plot for X  
disp(ALXq_A);



