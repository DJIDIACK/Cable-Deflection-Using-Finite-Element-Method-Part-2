function [X, P] = Maillage(L, N)
%----------------------------
%Génére un maillage de type
% X la table des coordonnées
% P la table de connectivité moyennant les indices
%----------------------------
n=N+1;
h=L/N;
X = h.*(0:n-1)';
[~, I] = sort(X);
P = [ I(1:n-1), I(2:n)]; 
end