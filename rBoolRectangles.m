function [M,num_centre] = rBoolRectangles(lambda,a,W,b)
% Author: Praveenkumar Hiremath
% Email: praveenkumar.hiremath@mek.lth.se (Email at the University)
%       praveenkumar.hiremath2911@gmail.com (Private email)

 assert(lambda>0, 'lambda should be greater than zero');
 assert(a>0, 'a should be greater than zero');
 assert(W(1,2)>0 && W(2,2)>0, 'Window dimensions should be greater than zero');
 assert(a>b && b>0, '0<b<a');
 
 
R=sqrt((0.5*a)^2+(0.5*b)^2);
p1=W(1,1)-R;
p2=W(1,2)+R;
pl=p2-p1;
q1=W(2,1)-R;
q2=W(2,2)+R;
ql=q2-q1;

area=pl*ql;
num_centre=poissrnd(area*lambda);
%display(num_centre)

for i=1:num_centre
   M(i,1)=p1+unifrnd(0,1)*pl;
   M(i,2)=p1+unifrnd(0,1)*ql;
   M(i,3)=a;
   M(i,4)=b;
   M(i,5)=unifrnd(0,2*pi);
end   
   
   
   
   
   
   
   
% rect_centres=poissrnd(lambda,10,2);
% %m=1;  n=1:10;
% angles=unifrnd(0,2*pi);                         %Angles f orientation of rectangles
% centres=numel(rect_centres)/2;               %Total number of centres
% vertices=4*centres;                          %Total vertices of all rectangles
% count1=numel(rect_centres);
% l=1;

% %Coordinates of the vertices of all rectangles
% for i=1:centres         
% COORD(l,1)=rect_centres(i,1)+(a/2);          %X Coordinates
% COORD(l+1,1)=rect_centres(i,1)+(a/2);
% COORD(l+2,1)=rect_centres(i,1)-(a/2);
% COORD(l+3,1)=rect_centres(i,1)-(a/2);

% COORD(l,2)=rect_centres(i,2)-(b/2);          %Y Coordinates
% COORD(l+1,2)=rect_centres(i,2)+(b/2);
% COORD(l+2,2)=rect_centres(i,2)+(b/2);
% COORD(l+3,2)=rect_centres(i,2)-(b/2);

% l=l+4;
% end

% l=1;
% for i=1:centres
  
   % New_COORD(l,1)=(cos(angles(i))*COORD(l,1))-(sin(angles(i))*COORD(l,2));
   % New_COORD(l,2)=(sin(angles(i))*COORD(l,1))+(cos(angles(i))*COORD(l,2));
   % l=l+1;
% end

% for l=1:centres
  % M(l,:)=[rect_centres(l,1),rect_centres(l,2),a,b,angles(l)];
% end

%disp(angles)



