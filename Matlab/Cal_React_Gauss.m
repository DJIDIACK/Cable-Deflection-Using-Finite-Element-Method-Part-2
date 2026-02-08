function [R] = Cal_React_Gauss(w,X,T,P,npts)
% fonction traite le calcul des réactions aux bords
  n = size(X,1);   % nombre des noeuds
 [K,F] = Assemblage_Gauss(w, X, T, P, npts);
% Appel de la fonction pour reprendre les expressions de Y2 et Yn-1
  U = Cal_Sol_Gauss(w,X,T,P,npts);
% Vecteur des résistances aux bords
R= [K(2,1)*U(2)-F(1) ; K(n-1,n)*U(n-1)-F(n)];
end

