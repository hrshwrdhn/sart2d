function [ANG,T] = create_projection_input(na,nt)
%function generate angle and T(t=xcosd+ysind) matrix
ang= 0:180/100:179.99;
t= -1:2/(nt-1):1;
ANG=repmat(ang,1,nt);
T=repelem(t,1,na);



end