clc;
clear all;
close all;

lambda=6.5696;                  %6.5696;
a=2.4764;                     % 2.4764;                    %Take from 6_b solution
b=0.0990;                    %0.0990;                   %Take from 6_b solution
num_real=99;              %number of realizations of model given to be m=39
m=num_real;
s=10;
W=[[0 s];[0 s]];
spacing=0.025;
k=12;                     %Take the same value as used in 6_a and 6_b
alpha=0.05;               %Significance level    delta is compared with delta(95) value-->(1-alpha)(m+1)=0.95*100=95.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Pixel]=importdata('data_Hiremath.txt');
B=Pixel;
del_A=zeros(m,1);
del_L=zeros(m,1);
del_X=zeros(m,1);

A_avg=zeros(k+1,1);
L_avg=zeros(k+1,1);
X_avg=zeros(k+1,1);
ALXq_avg=zeros(k+1,4);
%%%%%%Delta_j calculation%%%%%%%
delta_Aj=zeros(m,k+1);
delta_Lj=zeros(m,k+1);
delta_Xj=zeros(m,k+1);
T_Aj=zeros(m,k+1);
T_Lj=zeros(m,k+1);
T_Xj=zeros(m,k+1);
d_Aj=zeros(m,1);
d_Lj=zeros(m,1);
d_Xj=zeros(m,1);
d2_Aj=zeros(m,1);
d2_Lj=zeros(m,1);
d2_Xj=zeros(m,1);

for j=1:m
  [M,num_centre]=rBoolRectangles(lambda,a,W,b);
  [Pixel]=digitizeDiscSys(M,W,num_centre,spacing);
  B=Pixel;
  ALXq=estQMinkowskiFcts(B,k,spacing);     %T_j---->A_j,L_j,X_j    
  ALXq_avg=ALXq_avg+ALXq;
 
  
  for i=0:k
     r=i*spacing;
     Dev_A=ALXq(i+1,2)-(1-exp(-lambda*(r^2+4*(a+b)*r/pi+(a*b))));   %T_theta---->A_theta---> Analytical solution for A
     delta_Aj(j,i+1)=delta_Aj(j,i+1)+(Dev_A*Dev_A);
	 d_Aj(j,1)=d_Aj(j,1)+delta_Aj(j,i+1);
	 
	 Dev_L=ALXq(i+1,3)-(lambda*(4*r+2*(a+b))*exp(-lambda*(r^2+4*(a+b)*r/pi+(a*b))));  %T_theta---->L_theta---> Analytical solution for L
	 delta_Lj(j,i+1)=delta_Lj(j,i+1)+(Dev_L*Dev_L);
	 d_Lj(j,1)=d_Lj(j,1)+delta_Lj(j,i+1);
	 
	 Del_X=ALXq(i+1,4)-((lambda-(lambda^2/(4*pi))*(4*r+2*(a+b))^2)*exp(-lambda*(r^2+4*(a+b)*r/pi+(a*b))));   %T_theta---->X_theta---> Analytical solution for X
	 delta_Xj(j,i+1)=delta_Xj(j,i+1)+(Del_X*Del_X);
	 d_Xj(j,1)=d_Xj(j,1)+delta_Xj(j,i+1);
  end
  T_Aj(j,:)=ALXq(:,2);
  T_Lj(j,:)=ALXq(:,3);
  T_Xj(j,:)=ALXq(:,4);
  
  ALXq_avg=ALXq_avg+ALXq;
  	
end
delta_Aj=sort(delta_Aj);
delta_Lj=sort(delta_Lj);
delta_Xj=sort(delta_Xj);
disp(d_Aj);
disp(d_Lj);
disp(d_Xj);

ALXq_avg=ALXq_avg/m;                          %T_theta---->A_theta,L_theta,X_theta--->Average taken over m realizations for A,L,X
delta2_Aj=zeros(m,k+1);                       
delta2_Lj=zeros(m,k+1);                       
delta2_Xj=zeros(m,k+1);                       

for j=1:m
  for i=0:k
    delta2_Aj(j,i+1)=T_Aj(j,i+1)-ALXq_avg(i+1,2);   %Delta_j values for A with T_theta as the average over model realizations 
	d2_Aj(j,1)=d2_Aj(j,1)+delta2_Aj(j,i+1);
	delta2_Lj(j,i+1)=T_Lj(j,i+1)-ALXq_avg(i+1,3);   %Delta_j values for L with T_theta as the average over model realizations
	d2_Lj(j,1)=d2_Lj(j,1)+delta2_Lj(j,i+1);
	delta2_Xj(j,i+1)=T_Xj(j,i+1)-ALXq_avg(i+1,4);   %Delta_j values for X with T_theta as the average over model realizations
    d2_Xj(j,1)=d2_Xj(j,1)+delta2_Xj(j,i+1);
  end
end
delta2_Aj=sort(delta2_Aj);
delta2_Lj=sort(delta2_Lj);
delta2_Xj=sort(delta2_Xj);
disp(d2_Aj);
disp(d2_Lj);
disp(d2_Xj);


%%%%%%delta calculation%%%%%%
[Pixel]=importdata('data_Hiremath.txt');
B=Pixel;
ALXq_data=estQMinkowskiFcts(B,k,spacing);          %T_cap---->ALXq_data(:,2)=A_cap,ALXq_data(:,3)=L_cap,ALXq_data(:,4)=X_cap
delta_A=0.0;
delta_L=0.0;
delta_X=0.0;

for i=0:k
     r=i*spacing;
     D_A=ALXq_data(i+1,2)-(1-exp(-lambda*(r^2+4*(a+b)*r/pi+(a*b))));   %T_theta---->A_theta---> Analytical solution for A
     delta_A=delta_A+(D_A*D_A);
	 
	 D_L=ALXq_data(i+1,3)-(lambda*(4*r+2*(a+b))*exp(-lambda*(r^2+4*(a+b)*r/pi+(a*b))));  %T_theta---->L_theta---> Analytical solution for L
	 delta_L=delta_L+(D_L*D_L);
	 
	 D_X=ALXq_data(i+1,4)-((lambda-(lambda^2/(4*pi))*(4*r+2*(a+b))^2)*exp(-lambda*(r^2+4*(a+b)*r/pi+(a*b))));   %T_theta---->X_theta---> Analytical solution for X
	 delta_X=delta_X+(D_X*D_X);
end
disp(delta_A);
disp(delta_L);
disp(delta_X);


delta2_A=0.0;                               
delta2_L=0.0;
delta2_X=0.0;
for i=0:k
     D2_A=ALXq_data(i+1,2)-ALXq_avg(i+1,2);
     delta2_A=delta2_A+(D2_A*D2_A);          %Delta values for A with T_theta as the average over model realizations
	 
	 D2_A=ALXq_data(i+1,2)-ALXq_avg(i+1,2);
     delta2_A=delta2_A+(D2_A*D2_A);          %Delta values for A with T_theta as the average over model realizations
	 
	 D2_A=ALXq_data(i+1,2)-ALXq_avg(i+1,2);
     delta2_A=delta2_A+(D2_A*D2_A);          %Delta values for A with T_theta as the average over model realizations
end

disp(delta2_A);
disp(delta2_L);
disp(delta2_X);