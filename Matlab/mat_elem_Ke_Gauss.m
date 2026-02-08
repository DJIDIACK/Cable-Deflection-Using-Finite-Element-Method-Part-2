function [ elemKi ] = mat_elem_Ke_Gauss(X,T,P,i)
%calcule la matrice élémentaire Ki dans l'élément Ei
% avant l'application des points d'intégration de Gauss
%               Ki
%       |---------------|
%       -1              1
%
A=T*dx_du(X,P,i)*d_N1(X,P,i)^2;
B=T*dx_du(X,P,i)*d_N1(X,P,i)*d_N2(X,P,i);
C=T*dx_du(X,P,i)*d_N2(X,P,i)^2;
elemKi=[A B;B C]; % matrice de l'élément numéro Ei
end