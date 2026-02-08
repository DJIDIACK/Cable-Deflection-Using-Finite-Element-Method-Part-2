%Opération menant à l’estimation de l’erreur (Err𝑔) le long du câble 
%en utilisant 1, 2 et 3 points d’intégration ainsi qu’une intégration exacte
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
% Erreur absolue obtenue pour 4 éléments à l'aide de Gauss 
% et par Intégration Exacte
%--------------------------------------------------------------------------
Errg1 = Erreurg_Gauss(N,w,X,T,P,npts(1));
Errg2 = Erreurg_Gauss(N,w,X,T,P,npts(2));
Errg3 = Erreurg_Gauss(N,w,X,T,P,npts(3));
Errg4 = Erreurg(N,w,X,T,P);
%--------------------------------------------------------------------------
%Tracons les graphes
%--------------------------------------------------------------------------
hold on
p1 = plot(X,Errg1,'r','Linewidth', 1);
p2 = plot(X,Errg2,'g','Linewidth', 1);
p3 = plot(X,Errg3,'b','Linewidth', 1);
p4 = plot(X,Errg4,'m','Linewidth', 1);
hold off
grid on
legend([p1 p2 p3 p4],{'EF npts=2', 'EF npts=2', 'EF npts=3', 'Int__Exact'})
%title({'l’estimation de l’erreur (Err𝑔) le long du câble ';'et ce, en utilisant 1, 2 et 3 points d’intégration ainsi qu’une intégration exacte'})
xlabel('X/L')
ylabel('(yT)/(wL^2)')





