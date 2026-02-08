%Opération menant à l'rreur absolue obtenue par Gauss et Intégation exacte
% et ceci pour 4 éléments (A définir)
%--------------------------------------------------------------------------
clear all, close all,  clc
%--------------------------------------------------------------------------
%Exprimons la valeur explicite des variables
%--------------------------------------------------------------------------
w0=1; 
k=8; 
L=input('entrez la longeur du câble : ');
T=input('entrez la tension du câble : ');
syms x
w(x)=input('entrez le type de chargement : ');  %w0.*(1-k*x).*exp(-k*x);
%Définir le nombre d'élément du cable
N=input('entrez le nombre d element : ');
h=L/N;
npts=[1 2 3];
%--------------------------------------------------------------------------
%Appelle de la fonction Maillage
%--------------------------------------------------------------------------
[X, P] = Maillage(L, N);
%--------------------------------------------------------------------------
%Appelle de la fonction solution par Gauss et Intégration Exacte
%--------------------------------------------------------------------------
[U1] = Cal_Sol_Gauss(w,X,T,P,npts(1));
[U2] = Cal_Sol_Gauss(w,X,T,P,npts(2));
[U3] = Cal_Sol_Gauss(w,X,T,P,npts(3));
[U4] = Cal_Sol(w,X,T,P);
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% Appel de la solution Exacte
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
yEx = SolExact(x, w0, k, L, T);
%--------------------------------------------------------------------------
% Erreur absolue obtenue pour 4 éléments à l'aide de Gauss 
% et par Intégration Exacte
%--------------------------------------------------------------------------
Err1 = ErrTotal(X, P, U1, yEx, N+1);
Err2 = ErrTotal(X, P, U2, yEx, N+1);
Err3 = ErrTotal(X, P, U3, yEx, N+1);
Err4 = ErrTotal(X, P, U4, yEx, N+1);
%--------------------------------------------------------------------------
%Tracons le graphe
%--------------------------------------------------------------------------
hold on
for j=1:N
p1 = fplot(Err1(j),[X(P(j,1)) X(P(j,2))],'r', 'Linewidth', 2);
end
for j=1:N
p2 = fplot(Err2(j),[X(P(j,1)) X(P(j,2))],'g', 'Linewidth', 2);
end
for j=1:N
p3 = fplot(Err3(j),[X(P(j,1)) X(P(j,2))],'b', 'Linewidth', 2);
end
for j=1:N
p4 = fplot(Err4(j),[X(P(j,1)) X(P(j,2))],'m', 'Linewidth', 2);
end
hold off
grid on
legend([p1 p2 p3 p4],{'EF npts=1', 'EF npts=2', 'EF npts=3', 'Int__Exact'})
title('Erreur absolue obtenue par éléments finis')
xlabel('X/L')
ylabel('(yT)/(wL^2)')
