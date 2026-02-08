function [U] = Cal_Sol_Gauss(w,X,T,P,npts)
% fonction traite le calcul des solutions sur un toute la longueur du 
% système avec y(0)=y(L)=0 
  n = size(X,1);   % nombre des noeuds      %nombre des noeuds
 [K,F] = Assemblage_Gauss(w, X, T, P, npts);
%
% Conditions aux bords

 K(1,:)=[];
 K(n-1,:)=[];
 K(:,1)=[];
 K(:,n-1)=[];

%
F(1)=[];
F(n-1)=[];
%
% Résolution 
U=K\F;
U=[0;U;0];
end

