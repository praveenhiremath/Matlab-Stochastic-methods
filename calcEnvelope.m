function [LU] = calcEnvelope(lambda,a,W,b,spacing,m,k)
%filename1='ALXq.xlsx';
%filename2='A.xlsx';
%filename3='L.xlsx';
%filename4='X.xlsx';

A_all=zeros(m,k+1);
L_all=zeros(m,k+1);
X_all=zeros(m,k+1);
LU=zeros(k+1,6);

for i=1:m      %for m realizations
   [M,num_centre]=rBoolRectangles(lambda,a,W,b);
   [Pixel]=digitizeDiscSys(M,W,num_centre,spacing);
   B=Pixel;
   ALXq=estQMinkowskiFcts(B,k,spacing);
 
%disp(ALXq);
   A_all(i,:)=ALXq(:,2)';
%   disp(A_all);
   L_all(i,:)=ALXq(:,3)';
%disp(L_all);
   X_all(i,:)=ALXq(:,4)';
%disp(X_all);
end


%xlswrite(filename1,ALXq)
%xlswrite(filename2,A_all)
%xlswrite(filename3,L_all)
%xlswrite(filename4,X_all)

A_all=sort(A_all);
L_all=sort(L_all);
X_all=sort(X_all);


min=ceil(m*0.025);
max=ceil(m*0.975);
disp(min);
disp(max);

LU(:,1)=A_all(min,:)';
LU(:,2)=A_all(max,:)';
LU(:,3)=L_all(min,:)';
LU(:,4)=L_all(max,:)';
LU(:,5)=X_all(min,:)';
LU(:,6)=X_all(max,:)';

end

