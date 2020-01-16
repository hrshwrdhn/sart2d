function [X_grid,Y_grid] = construct_grid(n)
% construct 2 dim. grid x,y axis into vector
%input is n: 128 or 256 or 64
x= -1:2/(n-1):1;
y= -1*x;
[X,Y] = meshgrid(x,y);
X_grid= ( X(:) )';
Y_grid = (Y(:))';
end