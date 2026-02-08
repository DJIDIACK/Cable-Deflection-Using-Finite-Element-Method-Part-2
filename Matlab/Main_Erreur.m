%Opération menant au calcul de l'Erreur absolue obtenue par intégration
% exacte pour 2, 4, 8, 10, 20 et 100 éléments
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
N6=100;
N1=2;
N2=4;
N3=8;
N4=10;
N5=20;
%--------------------------------------------------------------------------
%Appelle de la fonction Maillage
%--------------------------------------------------------------------------
[X1, P1] = Maillage(L, N1); [X2, P2] = Maillage(L, N2); [X3, P3] = Maillage(L, N3);
[X4, P4] = Maillage(L, N4); [X5, P5] = Maillage(L, N5); [X6, P6] = Maillage(L, N6);
%--------------------------------------------------------------------------
%Appelle de la fonction solution par Gauss
%--------------------------------------------------------------------------
[U1] = Cal_Sol(w,X1,T,P1); [U2] = Cal_Sol(w,X2,T,P2); [U3] = Cal_Sol(w,X3,T,P3);
[U4] = Cal_Sol(w,X4,T,P4); [U5] = Cal_Sol(w,X5,T,P5); [U6] = Cal_Sol(w,X6,T,P6);
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% Appel de la solution Exacte
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
yEx = SolExact(x, w0, k, L, T);
%--------------------------------------------------------------------------
% Erreur absolue obtenue par éléments finis
%--------------------------------------------------------------------------
Err6 = ErrTotal(X6, P6, U6, yEx, 101);
Err1 = ErrTotal(X1, P1, U1, yEx, 3);
Err2 = ErrTotal(X2, P2, U2, yEx, 5);
Err3 = ErrTotal(X3, P3, U3, yEx, 9);
Err4 = ErrTotal(X4, P4, U4, yEx, 11);
Err5 = ErrTotal(X5, P5, U5, yEx, 21);
%--------------------------------------------------------------------------
%Tracons le graphe
%--------------------------------------------------------------------------
for j=1:100
p6 = fplot(Err6(j),[X6(j) X6(j+1)],'m', 'Linewidth', 2);
end
hold on
for j=1:2
p1 = fplot(Err1(j),[X1(j) X1(j+1)],'r', 'Linewidth', 2);
end
for j=1:4
p2 = fplot(Err2(j),[X2(j) X2(j+1)],'g', 'Linewidth', 2);
end
for j=1:8
p3 = fplot(Err3(j),[X3(j) X3(j+1)],'b', 'Linewidth', 2);
end
for j=1:10
p4 = fplot(Err4(j),[X4(j) X4(j+1)],'c', 'Linewidth', 2);
end
for j=1:20
p5 = fplot(Err5(j),[X5(j) X5(j+1)],'y', 'Linewidth', 2);
end
hold off
grid on
legend([p1 p2 p3 p4 p5 p6],{'Erreur EF N=2','Erreur EF N=4', 'Erreur EF N=8', 'Erreur EF N=10', 'Erreur EF N=20', 'Erreur EF N=100'})
title('Erreur absolue obtenue par éléments finis')
xlabel('X/L')
ylabel('(yT)/(wL^2)')



