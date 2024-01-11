% digitizeDiscSys function %%

function [Pixel] = digitizeDiscSys(M,W,num_centre,spacing)

Num_pix_X=ceil(W(1,2)/spacing);   %% Number of Pixels along X direction of window %%
Num_pix_Y=ceil(W(2,2)/spacing);   %% Number of Pixels along Y direction of window%%

%f = spacing/2;          %% Centre of the first Pixel along %%

%m = 1;                   %% Counter %%


v=[spacing/2:spacing:(W(1,2)-spacing/2)];             

w=fliplr([spacing/2:spacing:(W(2,2)-spacing/2)]);

Pixel=zeros(Num_pix_X,Num_pix_Y); 

for j=1:Num_pix_Y
   for i=1:Num_pix_X
     for k=1:num_centre
	   o=abs((v(i)-M(k,1))*cos(M(k,5))+(w(j)-M(k,2))*sin(M(k,5)));
       p=abs((v(i)-M(k,1))*sin(M(k,5))+(w(j)-M(k,2))*cos(M(k,5)));
	   if(o<=M(k,3)/2 && p<=M(k,4)/2)
	   Pixel(i,j)=1;
       end
	 end
   end
end
        

%display(Pixel);




% for i=1:X
     % for j = 1:Y
        % for k = 1:P
            % r_x = (p(i) - system(1,k))^2;
            % r_y = (q(j) - system(2,k))^2; 
            
            % r = r_x + r_y;
            
            % if r <= system(3,k)^2
    
            % B(i,j) = 1;
        
            % end
            
        % end
    % end
% end
    
%display(B);

