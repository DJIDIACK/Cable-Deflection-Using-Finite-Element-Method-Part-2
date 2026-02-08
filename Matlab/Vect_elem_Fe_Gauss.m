function [ elemFi ] = Vect_elem_Fe_Gauss(u,w,X,P,i)
%calcule le second membre élémentaire Fi dans l'élément Ei
% avant l'application des points d'intégration de Gauss
%               Fi
%       |---------------|
%       -1              1
x = x_u(u,X,P,i); %Appelle de la fonction u(x)
elemFi = [N1(u)*w(x)*dx_du(X,P,i) ; N2(u)*w(x)*dx_du(X,P,i)]; % Vecteur de l'élément numéro Ei
end