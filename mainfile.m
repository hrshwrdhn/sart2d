%tic
%addpath('./functions');
%input
n=128;
no_angle= 100;
no_t=127;

%process_1
slphantom = construct_shepp_logan(n);
SV= slphantom(:)';
%view_shepp_logan(slphantom)
[X_grid,Y_grid] = construct_grid(n);  % X_grid,Y_grid are vectors

[ANG,T] = create_projection_input(no_angle,no_t); %no_orthogonalization
pi= zeros(1,no_angle*no_t);
    parfor i=1:no_angle*no_t
        theta=ANG(i);
        t=T(i);
        % generated points along rayS
        [pointx,pointy,flag]=find_intersection_point(theta,t,n);
    
      
           [ai] =bilinear_int_fun(pointx,pointy,n,X_grid,Y_grid,flag);
        pi(i)= sum( SV.*ai);
    end
%toc
save pi.mat pi
 
