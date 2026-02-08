%Opération menant à l’estimation de l’erreur (Err𝑔) le long du câble 
% et ce, pour 2, 4, 8, 10, 20 et 100 éléments
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
% Erreur absolue obtenue par éléments finis
%--------------------------------------------------------------------------
Errg1 = Erreurg(N1,w,X1,T,P1); Errg2 = Erreurg(N2,w,X2,T,P2); Errg3 = Erreurg(N3,w,X3,T,P3);
Errg4 = Erreurg(N4,w,X4,T,P4); Errg5 = Erreurg(N5,w,X5,T,P5); Errg6 = Erreurg(N6,w,X6,T,P6);
%--------------------------------------------------------------------------
%Tracons les graphes
%--------------------------------------------------------------------------
hold on
p1 = plot(X1,Errg1,'k','Linewidth', 1);
p2 = plot(X2,Errg2,'Linewidth', 1);
p3 = plot(X3,Errg3,'Linewidth', 1);
p4 = plot(X4,Errg4,'Linewidth', 1);
p5 = plot(X5,Errg5,'Linewidth', 1);
p6 = plot(X6,Errg6,'Linewidth', 1);
hold off
grid on
legend([p1 p2 p3 p4 p5 p6],{'EF N=2', 'EF N=4', 'EF N=8', 'EF N=10', 'EF N=20', 'EF N=100'})
title({'l’estimation de l’erreur (Err𝑔) le long du câble ';'et ce, pour 2, 4, 8, 10, 20 et 100 éléments'})
xlabel('X/L')
ylabel('(yT)/(wL^2)')
