function y = d_N1(X,P,i)
%calcule de la dérivée de la fonction de forme N1 telle que :
%     N1(-1)=1 et N2(1)=0
%               N1
%       |---------------|
%       -1              1
% dN1/dx=(dN1/du)/(dx/du)=a/(dx/du) et ab=[a;b]
ab=[-1 1;1 1]\[1;0];
y = ab(1)/dx_du(X,P,i);
end

