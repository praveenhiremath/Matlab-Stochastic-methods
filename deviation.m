function [Sigma]=deviation(G)
s=10;
W=[[0 s];[0 s]];  
spacing=0.025;
k=12;
[Pixel]=importdata('data_Hiremath.txt');
B=Pixel;
ALXq_A=estQMinkowskiFcts(B,k,spacing);
Sigma=0.0;
for i=0:k
     r=i*spacing;
     Dev=1-exp(-G(1)*(r^2+4*(G(2)+G(3))*r/pi+(G(2)*G(3))))-ALXq_A(i+1,2);    %G(1)=lambda,G(2)=a,G(3)=b
     Sigma=Sigma+(Dev*Dev);
end
end