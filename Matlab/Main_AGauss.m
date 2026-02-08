%Opération menant à la Comparaison de la solution exacte avec celles obtenues
%par éléments finis  en utilisant 1, 2 et 3 points d’intégration 
%ainsi qu’une intégration exacte.
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
%Appelle de la solution exacte
%--------------------------------------------------------------------------
yEx = SolExact(x, w0, k, L, T);
%--------------------------------------------------------------------------
%Tracons les graphes
%--------------------------------------------------------------------------
hold on
p1 = plot(X,U1,'Linewidth', 1);
p2 = plot(X,U2,'Linewidth', 1);
p3 = plot(X,U3,'Linewidth', 1);
p4 = plot(X,U4,'Linewidth', 1);
p5 = fplot(yEx,[0 2],'Linewidth', 1);
hold off
grid on
legend([p1 p2 p3 p4 p5],{'EF npts=1', 'EF npts=2', 'EF npts=3', 'Int__Exact', 'Sol__Exact'})
title({'Comparaison de la solution exacte avec celles obtenues' ;
    'par éléments finis  en utilisant 1, 2 et 3 points'; 'd’intégration ainsi qu’une intégration exacte.'})
xlabel('X/L')
ylabel('(yT)/(wL^2)')




