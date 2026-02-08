function [ GaussFi ] = Gauss_Fe(w,X,P,i,npts)
%calcule le second membre élémentaire Fi dans l'élément Ei
%       à l'aide des points d'intégration de Gauss
%               Fi
%       |---------------|
%       -1              1
% cette fonction fait appel aux fonctions:
%    1) requeteGauss(npts)
%    2) Vect_elem_Fe_Gauss(u,W,X,P,i)

    r = requeteGauss(npts) ;   % Appelle de la requête de Gauss 
    GaussFi = sym(zeros(2,1)); % Initialisation de la matrise
for j=1:npts
    GaussFi= GaussFi + Vect_elem_Fe_Gauss(r(j,1),w,X,P,i).*r(j,2); % Vecteur de l'élément numéro Ei
end
end