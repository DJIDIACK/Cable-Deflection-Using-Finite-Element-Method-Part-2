%Opération menant à la Solution approchée par Intégration exacte
% et par Gauss pour N éléments (A définir)
%--------------------------------------------------------------------------
clear all, close all, clc
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
npts=input('entrez le nombre de points d''intégration : ');
h=L/N;
%--------------------------------------------------------------------------
%Appelle de la fonction Maillage
%--------------------------------------------------------------------------
[X, P] = Maillage(L, N);
%--------------------------------------------------------------------------
%Appelle de la fonction solution par Gauss et Intégration Exacte
%--------------------------------------------------------------------------
[U] = Cal_Sol(w,X,T,P);
[D] = Cal_Sol_Gauss(w,X,T,P,npts);
%--------------------------------------------------------------------------
%Appelle de la fonction Réaction 
%--------------------------------------------------------------------------
[R] = Cal_React(w,X,T,P);
%--------------------------------------------------------------------------
%Tracons les graphes
%--------------------------------------------------------------------------
figure('name', 'solution approchée '); 
hold on
p1 = plot( X,D,'r-*');
p2 = plot( X,U,'b--o');
hold off
grid on
legend([p1 p2],{'Gauss', 'Exact'})
title('Solution approchée par Eléments Finis')
xlabel('X/L')
ylabel('(yT)/(wL^2)')




