%Opération menant à la Comparaison de la solution exacte
% avec celles obtenues par éléments finis
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
N1=2;
N2=4;
N3=8;
N4=10;
N5=20;
N6=100;
%--------------------------------------------------------------------------
%Appelle de la fonction Maillage
%--------------------------------------------------------------------------
[X1, P1] = Maillage(L, N1); [X2, P2] = Maillage(L, N2); [X3, P3] = Maillage(L, N3);
[X4, P4] = Maillage(L, N4); [X5, P5] = Maillage(L, N5); [X6, P6] = Maillage(L, N6);
%--------------------------------------------------------------------------
%Appelle de la fonction solution par Intégration Exacte
%--------------------------------------------------------------------------
[U1] = Cal_Sol(w,X1,T,P1); [U2] = Cal_Sol(w,X2,T,P2); [U3] = Cal_Sol(w,X3,T,P3);
[U4] = Cal_Sol(w,X4,T,P4); [U5] = Cal_Sol(w,X5,T,P5); [U6] = Cal_Sol(w,X6,T,P6);
%--------------------------------------------------------------------------
%Appelle de la solution exacte
%--------------------------------------------------------------------------
yEx = SolExact(x, w0, k, L, T);
%--------------------------------------------------------------------------
%Tracons les graphes
%--------------------------------------------------------------------------
hold on
p1 = plot(X1,U1,'Linewidth', 1);
p2 = plot(X2,U2,'Linewidth', 1);
p3 = plot(X3,U3,'Linewidth', 1);
p4 = plot(X4,U4,'Linewidth', 1);
p5 = plot(X5,U5,'Linewidth', 1);
p6 = plot(X6,U6,'Linewidth', 1);
p7 = fplot(yEx, [0 2], '--m', 'Linewidth', 1);
hold off
grid on
legend([p1 p2 p3 p4 p5 p6 p7],{'EF N=2', 'EF N=4', 'EF N=8', 'EF N=10', 'EF N=20', 'EF N=100','Exacte'})
title({'Comparaison de la solution exacte';'avec celles obtenues par éléments finis'})
xlabel('X/L')
ylabel('(yT)/(wL^2)')





