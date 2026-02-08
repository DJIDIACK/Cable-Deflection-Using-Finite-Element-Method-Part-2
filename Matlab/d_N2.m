function y = d_N2(X,P,i)
%calcule de la dérivée de la fonction de forme N2 telle que :
%     N1(-1)=0 et N2(1)=1
%               N2
%       |---------------|
%       -1              1
% dN2/dx=(dN2/du)/(dx/du)=a/(dx/du) et ab=[a;b]
ab=[-1 1;1 1]\[0;1];
y = ab(1)/dx_du(X,P,i);
end
