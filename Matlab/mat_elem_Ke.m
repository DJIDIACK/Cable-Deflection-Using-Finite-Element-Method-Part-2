function [ elemKi ] = mat_elem_Ke(X,T,P,i)
%calcule la matrice élémentaire Ki dans l'élément Ei
%       par intégration exacte
%               Ki
%       |---------------|
%       -1              1
syms x
xi=[X(P(i,1));X(P(i,2))]; %coordonées de l'élément Ei

A=int(T*d_N1(X,P,i)*d_N1(X,P,i)+0*x,x,xi(1),xi(2));
B=int(T*d_N1(X,P,i)*d_N2(X,P,i)+0*x,x,xi(1),xi(2));
C=int(T*d_N2(X,P,i)^2+0*x,x,xi(1),xi(2));
elemKi=[A B;B C]; % matrice de l'élément numéro Ei

end