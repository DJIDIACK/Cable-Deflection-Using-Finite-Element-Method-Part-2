function [K,F] = Assemblage_Gauss(w, X, T, P, npts)
% Assemblage des matrices élémentaires "Gausski" dans la matrice globale K
% Assemblage des seconds membres élémentaires "GaussFi" dans le second
% membre global F
% cette fonction fait appel aux fonctions:
%    1) Gauss_Ke(X,T,P,i,npts)
%    2) Gauss_Fe(w,X,P,i,npts)
%
    n = size(X,1);   % nombre des noeuds
    p = size(P,1);   % nombre des éléments
    
    K = sym(zeros(n));    
    F = sym(zeros(n,1));

% Assemblage de la matrice golbale K
%
   for k=1:p   % boucle sur les éléments
       elemKi = Gauss_Ke(X,T,P,k,npts);  % matrice de l'élément numéro k
     for i=1:2  %boucle sur les numéros locaux
     for j=1:2  %boucle sur les numéros locaux
     I=k+i-1;                            % numéros globaux dans K
     J=k+j-1;                            % numéros globaux dans K
     K(I,J)=K(I,J)+ elemKi(i,j);         % l'assemblage
     end
     end    
   end

% Assemblage du second membre élémentaire golbal F
%
   for k=1:p   % boucle sur les éléments
       elemFi = Gauss_Fe(w,X,P,k,npts);  % SM de l'élément numéro k
     for i=1:2  %boucle sur les numéros locaux
     I=k+i-1;                            % numéros globaux dans K
     F(I)=F(I)+ elemFi(i);         % l'assemblage
     end
   end    
end
