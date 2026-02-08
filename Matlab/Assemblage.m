function [K,F] = Assemblage(w, X, T, P)
% Assemblage des matrices élémentaires "elemki" dans la matrice globale K
% Assemblage des seconds membres élémentaires "elemFi" dans le second
% membre global F
% cette fonction fait appel aux fonctions:
%    1) mat_elem_Ke(X,T,P,i)
%    2) Vect_elem_Fe(w,X,P,i)
%
    n = size(X,1);   % nombre des noeuds
    p = size(P,1);   % nombre des éléments
    
    K = sym(zeros(n));    
    F = sym(zeros(n,1));

% Assemblage de la matrice golbale K
%
   for k=1:p   % boucle sur les éléments
       elemKi = mat_elem_Ke(X,T,P,k);  % matrice de l'élément numéro k
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
       elemFi = Vect_elem_Fe(w,X,P,k);  % SM de l'élément numéro k
     for i=1:2  %boucle sur les numéros locaux
     I=k+i-1;                            % numéros globaux dans K
     F(I)=F(I)+ elemFi(i);         % l'assemblage
     end
   end    
end
