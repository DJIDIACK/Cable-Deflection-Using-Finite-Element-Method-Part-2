function [R] = Cal_React(w,X,T,P)
% fonction traite le calcul des réactions aux bords
  n = size(X,1);   % nombre des noeuds
 [K,F] = Assemblage(w, X, T, P);
% Appel de la fonction pour reprendre les expressions de Y2 et Yn-1
  U = Cal_Sol(w,X,T,P);
% Vecteur des résistances aux bords
R= [K(2,1)*U(2)-F(1) ; K(n-1,n)*U(n-1)-F(n)];
end

