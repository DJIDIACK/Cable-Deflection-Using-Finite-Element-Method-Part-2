function  GaussKi  = Gauss_Ke(X,T,P,i,npts)
%calcule la matrice élémentaire Ki dans l'élément Ei
%       à l'aide des points d'intégration de Gauss
%               Ki
%       |---------------|
%       -1              1
% cette fonction fait appel aux fonctions:
%    1) requeteGauss(npts)
%    2) mat_elem_Ke_Gauss(X,T,P,i)

    r = requeteGauss(npts) ; % Appelle de la requête de Gauss
    GaussKi=sym(zeros(2,2)); % Initialisation de la matrise
for j=1:npts
    GaussKi= GaussKi + r(j,2).*mat_elem_Ke_Gauss(X,T,P,i);  % matrice de l'élément numéro Ei
end
end