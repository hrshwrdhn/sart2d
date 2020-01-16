function  [pointx,pointy,flag]=find_intersection_point(theta,t,n)
     del = 2/(n-1);
    delp = del/2;
       flag=0;
    %    ______ 2
    % 1 |      |
    %   |      |  3
    %   |______|
    %     4
      
  %  x1=-1;
    y1= ( t + cosd(theta) ) / sind(theta);
  %  x3=1;
    y3= ( t - cosd(theta) ) / sind(theta);
   % y2= 1;
    x2= (t - sind(theta))/cosd(theta);
  %  y4= -1;
    x4= (t + sind(theta))/cosd(theta);
    
    
    if theta<0.01 && abs(t)<1
        pointy =  1:-1*delp:-1;
        pointx= t* ones(1,length(pointy));
    elseif abs(theta-90)<.01 && abs(t)<1
        pointx =  -1:delp:1;
        pointy= t* ones(1,length(pointx));
    elseif theta>0 && theta<90
        if abs(x2)<=1 && abs(x4)<=1
            pointx = x2:delp*sind(theta):x4  ;
            pointy = ( t- pointx.*cosd(theta) )/sind(theta);
        elseif abs(y1)<1 && abs(y3)<1
            pointx = -1:delp*sind(theta):1  ;
            pointy = ( t- pointx.*cosd(theta) )/sind(theta);
        elseif abs(x2)<1 && abs(y3)<1
            pointx = x2:delp*sind(theta):1  ;
            pointy = ( t- pointx.*cosd(theta) )/sind(theta);
        elseif abs(y1)<1 && abs(x4)<1
            pointx = -1:delp*sind(theta):x4  ;
            pointy = ( t- pointx.*cosd(theta) )/sind(theta);
         else
            pointx=nan;
            pointy=nan;
             flag=1;     
        end
        
        
    elseif theta>90 && theta<180
        if abs(y1)<1 && abs(x2)<1
            pointx = -1:delp*sind(theta):x2  ;
            pointy = ( t- pointx.*cosd(theta) )/sind(theta);
        elseif abs(y1)<1 && abs(y3)<1
            pointx = -1:delp*sind(theta):1  ;
            pointy = ( t- pointx.*cosd(theta) )/sind(theta);
        elseif abs(x2)<=1 && abs(x4)<=1
            pointx = x4:delp*sind(theta):x2  ;
            pointy = ( t- pointx.*cosd(theta) )/sind(theta);
        elseif abs(y3)<1 && abs(x4)<1
            pointx = x4:delp*sind(theta):1  ;
            pointy = ( t- pointx.*cosd(theta) )/sind(theta);
        else
            pointx=nan;
            pointy=nan;
             flag=1;   
        end
     else
            pointx=nan;
            pointy=nan;
             flag=1;  
        
    end
end