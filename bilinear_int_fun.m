function [ai] =bilinear_int_fun(pointx,pointy,n,X_grid,Y_grid,flag)
   if flag==0
del= 2/(n-1);
 delp=del/2;
  ai= zeros(size(X_grid));
 xv= repmat(X_grid,length(pointx),1);
 yv= repmat(Y_grid,length(pointx),1);
 px= repmat(pointx,length(X_grid),1)';
 py= repmat(pointy,length(X_grid),1)';
 
 %D= sqrt ( (px-xv).^2 + (py-yv).^2 );
 Dx= abs(px-xv);
 Dy =abs(py-yv);
 ind= find(Dx<del & Dy<del);
W=zeros(size(Dx));
 W(ind)= ( (del-Dx(ind)).* (del-Dy(ind))./ del^2 ) ;
 ai= sum(W)*delp;
   else
       ai= zeros(size(X_grid));
   end
end


